create database lab3;

select lastname from employees;

select distinct lastname from employees;

select * from employees
where lastname = 'Smith';

select * from employees
where lastname = 'Smith' or lastname = 'Doe';

select * from employees
where department = '14';

select * from employees
where department = '37' or department = '77';

select sum(budget) as total_budget from departments;

select department, count(*) as number_of_employees
from employees group by department;

select department, count(*) as number_of_employees
from employees group by department having count(*) >= 2;

select name from departments
order by budget DESC
offset 1 limit 1;

select e.name, e.lastname from employees e
where department = (
    select d.code
    from departments d
    order by d.budget ASC
    limit 1
    );

select name from employees
where city = 'Almaty'

union

select name from customers
where city = 'Almaty';

select *
from departments
where budget > 60000
order by budget ASC, code DESC;

update departments
set budget = budget * 0.90
where code = (
    select code
    from departments
    order by budget asc
    limit 1
    );

update employees
set department = (
    select code
    from departments
    where name = 'IT'
    )
where department = (
    select code
    from departments
    where name = 'Research'
    );

delete from employees
where department = (
    select code
    from departments
    where name = 'IT'
    );


delete from employees;

