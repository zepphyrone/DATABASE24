create database lab8;

create table salesman(
    salesman_id int primary key,
    name varchar(50),
    city varchar(50),
    commission decimal(4, 2)
);

create table customers(
    customer_id int primary key,
    cust_name varchar(50),
    city varchar(50),
    grade int,
    salesman_id int references salesman(salesman_id)
);

create table orders(
    ord_no int primary key,
    purch_amt decimal(10, 2),
    ord_date date,
    customer_id int references customers(customer_id),
    salesman_id int references salesman(salesman_id)
);

insert into salesman (salesman_id, name, city, commission) values
(5001, 'james hoog', 'new york', 0.15),
(5002, 'nail knite', 'paris', 0.13),
(5005, 'pit alex', 'london', 0.11),
(5006, 'mc lyon', 'paris', 0.14),
(5003, 'lauson hen', 'rome', 0.12),
(5007, 'paul adam', 'rome', 0.13);

insert into customers (customer_id, cust_name, city, grade, salesman_id) values
(3002, 'nick rimando', 'new york', 100, 5001),
(3005, 'graham zusi', 'california', 200, 5002),
(3001, 'brad guzan', 'london', 200, 5005),
(3004, 'fabian johns', 'paris', 300, 5006),
(3007, 'brad davis', 'new york', 200, 5001),
(3009, 'geoff camero', 'berlin', 100, 5003),
(3008, 'julian green', 'london', 300, 5002);


insert into orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) values
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);

create role junior_dev login;

create view city_ny as select *
from salesman
where city = 'New-York';

create view order_salesman as
select o.ord_no, s.name as salesman_name, c.cust_name as customer_name
from orders o
join salesman s on o.salesman_id = s.salesman_id
join customers c on o.customer_id = c.customer_id;

grant all privileges on order_salesman to junior_dev;


create view max_grade as
select * from customers
where grade = (select max(grade) from customers);

grant select on max_grade to junior_dev;

create view number_of_salesman as
select city, count(*) as salesman_count
from salesman
group by city;

create view salesman_customers as
select s.salesman_id, s.name as salesman_name,
count(c.customer_id) as customer_count
from salesman s
join customers c on s.salesman_id = c.salesman_id
group by s.salesman_id, s.name
having count(c.customer_id) > 1;

create role intern;
grant all privileges on database lab8 to junior_dev;