create database lab10;

create table books(
    book_id integer primary key,
    title varchar(250),
    author varchar(250),
    price decimal,
    quantity integer
);

create table orders(
    order_id integer primary key,
    book_id integer,
    customer_id integer,
    order_date date,
    quantity integer,
    foreign key (book_id) references books(book_id)
);

create table customers(
    customer_id integer primary key,
    name varchar(250),
    email varchar(250)
);

insert into books values
  (1, 'Database 101', 'A. Smith', 40.00, 10),
  (2, 'Learn SQL', 'B. Johnson', 35.00, 15),
  (3, 'Advanced DB', 'C.Lee', 50.00, 5);

insert into customers values
  (101, 'John Doe', 'johndoe@example.com'),
  (102, 'John Doe', 'johndoe@example.com');

begin transaction;
insert into orders values (1, 1, 101, '2024-12-10', 2);
update books set quantity = quantity - 2 where book_id = 1;
commit;

begin transaction;
insert into orders values(2, 3, 102, '2024-12-10', 10);
do $$
    begin
        if (select quantity from books where book_id = 3) >= 10
            then update books set quantity = quantity - 10 where book_id = 3;
        else
            raise notice 'insufficient quantity';
        end if;
    end $$;
    rollback;

---3
begin transaction;
set transaction isolation level read committed;
update books set price = 55 where book_id = 3;

set transaction isolation level read committed;
select price from books where book_id = 3;
commit;

--- 4
begin transaction;
update customers set email = 'johndoe111@example.com' where customer_id = 101;
commit;
select * from customers;









