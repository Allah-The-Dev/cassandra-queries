-- Notes
-- materalized view's primary key must contain all the primary keys of base table
--  apart from it's own partition key

create table employee_by_car_make (
    car_make text, 
    id int, 
    car_model text,
    department text, 
    first_name text,
    last_name text,
    start_year text,
    primary key(car_make, id));

create materalized view test_keyspace.employee_by_department 
    as select *
    from test_keyspace.employee_by_car_make
    where department is not null and
    car_make is not null and
    car_model is not null and 
    id is not null and
    primary key (department, car_make, car_model, id);