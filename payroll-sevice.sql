#uc1
create database payroll_services_DB;
show databases;
use payroll_services_DB;
#uc2
create table emp_payroll(
	id int unsigned not null auto_increment,
    name varchar(150) not null,
    salary double not null,
    start date not null,
    primary key (id)
);
select * from emp_payroll;

#uc3
insert into emp_payroll (name,salary, start) values
('Akshitha',4500.0,'2021-02-16'),
('Aishu',5500.0,'2021-04-02'),
('Arjun',7500.0,'2021-05-20'),
('Shubam',8750.0,'2021-01-17'),
('Sankar',6280.0,'2021-03-07'),
('SAHIL',2540.0,'2021-06-08');
