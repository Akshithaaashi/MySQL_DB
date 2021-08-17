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
#uc4
select * from emp_payroll;

#UC5
select salary from  emp_payroll where name='Sankar'; #Selecting Sankar entry
#Selecting Employee from Date range
select * from emp_payroll where start between cast('2021-03-07' as date) and date(now());

#UC6 - Addemp_payroll the Gender column in table and update to the name
Alter table emp_payroll add gender char(1) after name;
describe emp_payroll;
SET SQL_SAFE_UPDATES=0;
update emp_payroll set gender='M'
where name='Arjun' or name='Shubam'or name='Sankar' or name='SAHIL';
update emp_payroll set gender='F'
where name='Akshitha' or name='Aishu';
select * from emp_payroll;
