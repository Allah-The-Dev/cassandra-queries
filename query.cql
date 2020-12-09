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