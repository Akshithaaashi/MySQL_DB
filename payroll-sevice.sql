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

#UC7-To find Aggregate values
select salary from emp_payroll;
#To find Aggregate Sum
select sum(salary) from emp_payroll;
select sum(salary) from emp_payroll where gender='F' group by gender;
select sum(salary) from emp_payroll where gender='M' group by gender;
#To find Maximum
select max(salary) from emp_payroll;
select max(salary) from emp_payroll where gender='F' group by gender;
select max(salary) from emp_payroll where gender='M' group by gender;
#To find Minimum
select min(salary) from emp_payroll;
select min(salary) from emp_payroll where gender='F' group by gender;
select min(salary) from emp_payroll where gender='M' group by gender;
#To find Aggregate Average
select avg(salary) from emp_payroll;
select avg(salary) from emp_payroll where gender='F' group by gender;
select avg(salary) from emp_payroll where gender='M' group by gender;
#To find Count
select count(salary) from emp_payroll;
select count(salary) from emp_payroll where gender='F' group by gender;
select count(salary) from emp_payroll where gender='M' group by gender;

#Uc8 Add department of employee
alter table emp_payroll 
add phone varchar(20), 
add address varchar(200) default 'address1' ,
add department varchar(20)  not null ;

update emp_payroll 
set 
	department='Finance' 
where
	name in ('SAHIL');

select * from emp_payroll;     

#Uc9 Extexd Employee Pay
alter table emp_payroll 
add basic_pay int, 
add deductions int,
add taxable_pay int  ,
add tax int,
add net_pay int;

delete from emp_payroll where id in (1,2,3,4,5,6);

insert into emp_payroll (name,department,gender,basic_pay
,deductions,taxable_pay,tax,net_pay,start,salary) values
	('Aishu','Marketing','F',3000000,1000000,
    2000000,500000,1500000,'2021-07-08',751585235);
    
insert into emp_payroll (name,department,gender,basic_pay
,deductions,taxable_pay,tax,net_pay,start,salary) values
	('Akshitha','Sales','F',3000000,
    0,0,0,0,'2021-06-01','97777');
    
#UC10-To add two entities by same name in the Table
insert into emp_payroll (name,gender,start,department,basic_pay,deductions,taxable_pay,tax,net_pay,salary)
values('Terisa','F','2018-07-08','Marketing',300000,100000,200000,500000,1000000,546438664);
select * from emp_payroll;
insert into emp_payroll (name,gender,start,department,basic_pay,deductions,taxable_pay,tax,net_pay,salary)
values('Terisa','F','2018-01-06','Sales',300000,0,0,0,0,0);
select * from emp_payroll;

#UC11-Implementing ER Diagram into Payroll Service DB

alter table emp_payroll drop column department;
create table department(
	id int auto_increment not null,
	dept_name varchar(21) not null,
    primary key (id)
);
insert into department (dept_name) values ('Sales'),('Marketing'),('Finance');
select * from department;
create table employee(
	id int auto_increment not null,
	name varchar(21) not null,
    salary int not null,
    start date not null,
    primary key (id)
);
select * from employee;
create table employee_department(
employee_id int not null,
department_id int not null,
foreign key (employee_id) references employee(id),
foreign key (department_id) references department(id),
primary key (employee_id, department_id)
);
select * from employee_department;

#UC12-Adding extra table
create table payroll(
	id int primary key auto_increment not null,
	basic_pay int,
    deductions int,
    taxable_pay int,
    income_tax int,
    emp_id int,
    foreign key (emp_id) references employee(id)
);
select * from payroll;