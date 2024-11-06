create database lab6;

create table locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(12),
    city varchar(30),
    state_province varchar(12)
);

create table departments(
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);

create table employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments
);

select employees.first_name, employees.last_name, employees.department_id, d.department_name
from employees
join departments d on d.department_id = employees.department_id;

select employees.first_name, employees.last_name, employees.department_id, d.department_name
from employees
join departments d on d.department_id = employees.department_id
where employees.department_id = 80 or employees.department_id = 40;

select employees.first_name, employees.last_name, d.department_name, l.city, l.state_province
from employees
join departments d on employees.department_id = d.department_id
join locations l on l.location_id = d.location_id;

select departments.department_id, departments.department_name, e.first_name, e.last_name
from departments
left join employees e on e.department_id = departments.department_id;

select employees.first_name, employees.last_name, employees.department_id, d.department_name
from employees
left join departments d on d.department_id = employees.department_id