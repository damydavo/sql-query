show databases;
use employees;
show tables;
create table emp_details (Emp_id int primary key, Emp_name varchar(25), Age int, Gender char(1), Doj date, Dept varchar(20), City varchar(15), Salary float);

use employees;
show tables;
describe emp_details;

insert into emp_details values 
(101, "David", 35, "M", "2005-05-23",  "Tech", "Ikeja", 250000),
(102, "Bridget", 38, "F", "2006-04-03",  "Advert", "Surulere", 150000),
(103, "Ibukun", 25, "F", "2010-04-13",  "Legal", "Ikeja", 250000),
(104, "Bioye", 45, "M", "2010-03-20",  "Tech", "Ikeja", 450000),
(105, "Biodun", 34, "M", "2004-07-03",  "Human Resources", "Ibadan", 100000),
(106, "Adebo", 48, "F", "2008-10-01",  "Marketing", "Surulere", 50000),
(107, "Ronke", 28, "F", "2022-05-01",  "Editorial", "Abuja", 150000),
(108, "Timothy", 38 , "M", "2004-05-23",  "Tech", "Abuja", 250000),
(109, "Bode", 32, "M", "2019-09-01",  "Video", "Ikeja", 100000),
(110, "John", 27, "M", "2023-01-01",  "Freelance", "Surulere", 80000),
(111, "Bosede", 45, "F", "2003-05-23",  "Receptionist", "Ibadan", 70000),
(112, "Blessing", 25, "F", "2017-04-02",  "Marketing", "Abuja", 50000),
(113, "Oseni", 22, "M", "2019-05-01",  "Tech", "Abuja", 350000),
(114, "Stephen", 25, "M", "2005-05-23",  "Graphics Designer", "Ikeja", 250000),
(115, "Rasheeda", 35, "F", "2010-02-03",  "Marketing", "Ibadan", 180000),
(116, "Adewale", 32, "M", "2015-01-03",  "Accounting", "Ikeja", 250000),
(117, "Tope", 26, "F", "2018-04-03",  "Marketing", "Ibadan", 150000),
(118, "Richard", 39, "M", "2001-06-15",  "Tech", "Ikeja", 250000),
(119, "Freedman", 35, "M", "2005-05-23",  "Tech", "Abuja", 500000),
(120, "Victor", 20, "M", "2004-05-13",  "Video", "Abuja", 250000);

select * from emp_details;
select distinct city from emp_details;

select distinct dept from emp_details;

select avg(age) from emp_details;

-- average age in each dept

select dept, round(avg(age),1) as average_age from emp_details group by dept;

-- total salary of employees in each department.

select Dept, sum(salary) as Total_Salary from emp_details group by Dept;

-- total number of employees in each city group by the number of employee id

select count(emp_id), city from emp_details group by city
order by count(emp_id) desc;

-- number of employees joining the company each year

select count(emp_id), year(doj) as year from emp_details group by year(doj)
order by count(emp_id) desc; 

create table sales (product_id int , sell_price float, quantity int, state varchar(20));

describe sales;

insert into sales values
(121, 320.0, 3, 'California'),
(121, 320.0, 6, 'Texas'),
(121, 320.0, 4, 'Alaska'),
(123, 290.00, 2, 'Texas'),
(123, 290.00, 6, 'California'),
(123, 290.00, 5, 'Alaska'),
(121, 320.0, 7, 'Ohio'),
(121, 320.0, 2, 'Arizona'),
(121, 320.0, 8, 'Colorado');

select * from sales;

select product_id, sum(sell_price * quantity) as revenue
from sales group by product_id;

create table c_product(product_id int, cost_price float);

insert into c_product
values(121, 270.0),
(123, 250.0);

use employees;
select * from c_product;

select c.product_id, sum((s.sell_price - c.cost_price) * s.quantity) as profit
from sales as s inner join c_product as c 
where s.product_id = c.product_id
group by c.product_id;

select * from emp_details;

use employees;
select Dept, avg(salary) as avg_salary
from emp_details
group by Dept
having avg(salary) < 100000;

use employees;

select * from emp_details;

-- find the cities where there are more than 2 employees
select count(emp_id), city from emp_details
group by city
having count(emp_id) > 2;







