create database lab7;

create index countries_name_idx on countries(name);

create index employees_idx on employees(name, surname);

create unique index salary_idx on employees(salary);

create index substring_idx on employees((substring(name from 1 to 4)));

create index department_idx on departments(budget);
create index employees_salary_idx on employees(salary);
