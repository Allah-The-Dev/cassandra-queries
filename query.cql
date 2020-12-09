-- create keyspace
create keyspace test_keyspace with replication = {'class': 'SimpleStrategy', 'replication_factor': '1'} and durable_writes='true';

-- use keyspace
USE test_keyspace;

-- create table
create table employee_by_id (id int primary key, name text, position text);

-- get list of tables
describe tables;

-- drop table
drop table employee_by_id;

-- create table with composite key
create table employee_by_car_make (car_make text, id int, car_model text, primary key(car_make, id));
create table employee_by_car_make_sorted (car_make text, age int, id int, car_model text, primary key(car_make, age, id));
create table employee_by_car_make_and_model (car_make text, car_model text, id int, name text, primary key((car_make, car_model), id));

-- describe a single table
describe table employee_by_car_make

-- set up cluster consistency 
consistency quorum

-- insert single data into table
insert into employee_by_car_make_and_model (car_make, car_model, id, name) values ('BMW', 'Hatchback', 1, 'Bob');
insert into employee_by_car_make_and_model (car_make, car_model, id) values ('BMW', 'Hatchback', 2);
insert into employee_by_car_make_and_model (car_make, car_model, id) values ('Audi', 'Hatchback', 3);
insert into employee_by_car_make_and_model (car_make, car_model, id, name) values ('BMW', 'Truck', 8, 'Frank');
insert into employee_by_car_make_and_model (car_make, car_model, id, name) values ('Audi', 'Truck', 7, 'Amy');
insert into employee_by_car_make_and_model (car_make, car_model, id, name) values ('Audi', 'Sports Car', 4, 'Tim');
insert into employee_by_car_make_and_model (car_make, car_model, id, name) values ('Audi', 'Sports Car', 5, 'Jim');
insert into employee_by_car_make_and_model (car_make, car_model, id, name) values ('Audi', 'Sports car', 6, 'Nick');

insert into employee_by_id (id, name, position) values(1, 'John', 'Manager');
insert into employee_by_id (id, name, position) values(2, 'Bob', 'CEO');

insert into employee_by_car_make (car_make, id, car_model) values ('BMW', 1, 'Sports Car');
insert into employee_by_car_make (car_make, id, car_model) values ('BMW', 2, 'Sports Car');
insert into employee_by_car_make (car_make, id, car_model) values ('Audi', 4, 'Truck');
insert into employee_by_car_make (car_make, id, car_model) values ('Audi', 5, 'Hatchback');

-- Notes --
-- selecting just based on one partition key is not allowed.
-- selecting only based on clustering column is not allowed.
-- ordering always must be done based on the order of clusteting column.

-- query to check when last time an item was modified in a column
select car_make, car_model, writetime(car_model) from employee_by_car_make;

-- update a single item in a table
update employee_by_car_make set car_model='Truck' where car_make='BMW' and id=1;

-- update with TTL
update employee_by_car_make using TTL 60 set car_model='Truck' where car_make='BMW' and id=2;

-- adding an extra column in existing table
alter table employee_by_id add phone set<text>;

-- update data for an employee / add phone no 
update employee_by_id set phone={'1234', '5678'} where id=1;
-- add more items in an existing set
update employee_by_id set phone = phone + {'67890'} where id=1;
-- remove items from an existing set
update employee_by_id set phone = phone - {'67890'} where id=1;
-- remove all items from an existing set
update employee_by_id set phone = {} where id=1;

-- query data based on a random column using `allow filtering` label
select * from employee_by_id where name='John' allow filtering;

-- query data based on a random column using secondary index
-- create secondary index
create index on employee_by_id (name);
select * from employee_by_id where name='John';