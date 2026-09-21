
 create table customers (
    customerid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    email varchar(100),
    registrationdate date
);

insert into customers values
(1,'aarav','mehta','aarav.mehta@email.com','2022-03-15'),
(2,'kiara','kapoor','kiara.kapoor@email.com','2021-11-02'),
(3,'vihaan','shah','vihaan.shah@email.com','2023-01-10'),
(4,'anaya','desai','anaya.desai@email.com','2022-07-18'),
(5,'reyansh','patel','reyansh.patel@email.com','2020-09-25'),
(6,'myra','joshi','myra.joshi@email.com','2023-04-30'),
(7,'advik','nair','advik.nair@email.com','2021-06-14'),
(8,'siya','verma','siya.verma@email.com','2022-12-01'),
(9,'ishaan','malhotra','ishaan.malhotra@email.com','2023-08-21'),
(10,'tara','singh','tara.singh@email.com','2024-01-05');

create table orders (
    orderid int primary key,
    customerid int,
    orderdate date,
    totalamount decimal(10,2),
    foreign key (customerid) references customers(customerid)
);

insert into orders values
(101,1,'2023-07-01',150.50),
(102,2,'2023-07-03',200.75),
(103,1,'2023-07-10',900.00),
(104,3,'2023-08-05',1200.00),
(105,4,'2023-08-12',750.00),
(106,5,'2023-09-01',400.50),
(107,6,'2023-09-18',1350.75),
(108,2,'2023-10-04',300.00),
(109,7,'2023-10-20',650.00),
(110,8,'2023-11-15',500.00),
(111,9,'2023-12-05',1600.00),
(112,1,'2024-01-08',250.00),
(113,3,'2024-01-18',450.00),
(114,4,'2024-02-10',1100.00),
(115,6,'2024-03-05',980.00);

create table employees (
    employeeid int primary key,
    firstname varchar(50),
    lastname varchar(50),
    department varchar(50),
    hiredate date,
    salary decimal(10,2)
);

insert into employees values
(1,'arjun','rana','sales','2020-01-15',50000),
(2,'naina','khanna','HR','2021-03-20',55000),
(3,'kabir','saxena','sales','2019-07-12',72000),
(4,'riya','bansal','finance','2018-05-25',85000),
(5,'vivaan','chopra','IT','2022-02-10',60000),
(6,'isha','agarwal','HR','2017-11-30',68000),
(7,'laksh','sehgal','finance','2021-08-19',92000),
(8,'aadhya','goyal','sales','2020-06-11',78000),
(9,'krish','patel','IT','2019-09-14',48000),
(10,'meher','kohli','marketing','2023-01-09',53000),
(11,'dev','ahuja','marketing','2021-10-05',65000),
(12,'avni','trivedi','IT','2018-12-18',95000);


select * from customers

select * from orders

select * from employees

-- 1
select * from customers c inner join orders o on c.customerid = o.customerid

-- 2
select * from customers c left join orders o on c.customerid = o.customerid

-- 3
select * from customers c right join orders o on c.customerid = o.customerid

-- 4
select * from customers c full outer join orders o on c.customerid = o.customerid

-- 5
select c.customerid, c.firstname, c.lastname 
from customers c 
join orders o 
on c.customerid = o.customerid 
where o.totalamount > (select avg(totalamount) from orders)

-- 6
select * from employees where salary > (select avg(salary) from employees)

-- 7
select orderid, orderdate, extract(year from orderdate) as orderyear, extract (month from orderdate) as ordermonth from orders

-- 8
select orderid, orderdate, current_date - orderdate as dayspassed from orders

-- 9
select to_char(orderdate, 'dd-mon-yyyy') as formatteddate from orders

-- 10
select customerid, concat(firstname, ' ', lastname) as fullname from customers

-- 11
select employeeid, replace(firstname, 'krish','krishna') as updatedname from employees

-- 12
select employeeid, upper(firstname), lower(lastname) from employees

-- 13
select customerid, trim(email) as trimmed from customers

-- 14
select orderid, orderdate, totalamount, sum(totalamount) over (order by orderdate) as runningtotal from orders

-- 15
select orderid, orderdate, totalamount, rank() over (order by orderdate) as ranked from orders

-- 16
select orderid, totalamount,
case when totalamount > 1000 then '10% discount' when totalamount > 500 then '5% discount' else 'no discount' end as discount from orders;

-- 17
select employeeid, firstname, salary,
case when salary >= 80000 then 'High' when salary >= 60000 then 'Medium' else 'Low' end as categorised from employees