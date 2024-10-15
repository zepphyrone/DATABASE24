create database lab5;


create table customers(
    customer_id integer,
    cust_name varchar(50),
    city varchar(50),
    grade integer,
    salesman_id integer
);

create table orders(
    ord_no integer,
    purch_amt numeric(10,2),
    ord_date date,
    customer_id integer,
    salesman_id integer
);

create table salesman(
    salesman_id integer,
    name varchar(50),
    city varchar(50),
    comission numeric(5, 2)
);

INSERT INTO customers (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3001, 'Brad Guzan', 'London', 100, 5005),
(3004, 'Fabian Johns', 'Paris', 300, 5006),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3009, 'Geoff Camero', 'Berlin', 100, 5003),
(3008, 'Julian Green', 'London', 300, 5002);

INSERT INTO orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001);

INSERT INTO salesman (salesman_id, name, city, comission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5003, 'Lauson Hen', 'London', 0.12),
(5007, 'Paul Adam', 'Rome', 0.13);

select sum(purch_amt)
as total_purchase from orders;

select avg(purch_amt)
as avrg_purchase from orders;

select count(*)
from customers where cust_name is not null;

select min(purch_amt)
as min_purchase from orders;

select * from customers
where cust_name like '%b';

select o.* from orders o
join customers c on o.customer_id = c.customer_id
where c.city = 'New York';

select c.* from customers c
join orders o on c.customer_id = o.customer_id
where o.purch_amt > 10;

select sum(grade)
as total_grade from customers;

select * from customers
where cust_name is not null;

select max(grade)
as max_grade from customers;
