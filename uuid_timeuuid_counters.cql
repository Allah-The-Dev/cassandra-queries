-- uuid
create table employee_by_uuid (id uuid primary key, first_name text, last_name text);

insert into employee_by_uuid (id, first_name, last_name) values (uuid(), 'tom', 'dunne');
insert into employee_by_uuid (id, first_name, last_name) values (uuid(), 'nk', 'pandey');
insert into employee_by_uuid (id, first_name, last_name) values (uuid(), 'lk', 'kumar');

select * from employee_by_uuid;

-- time uuid
create table employee_by_timeuuid (id timeuuid primary key, first_name text, last_name text);

insert into employee_by_timeuuid (id, first_name, last_name) values (now(), 'tom', 'dunne');
insert into employee_by_timeuuid (id, first_name, last_name) values (now(), 'nk', 'pandey');
insert into employee_by_timeuuid (id, first_name, last_name) values (now(), 'lk', 'kumar');

select * from employee_by_timeuuid;

-- counters
create table purchase_by_customer_id (id uuid primary key, purchases counter);

update purchase_by_customer_id set purchases = purchases + 1 where id=uuid();
update purchase_by_customer_id set purchases = purchases + 1 where id=uuid();
update purchase_by_customer_id set purchases = purchases + 1 where id=uuid();

select * from purchase_by_customer_id;