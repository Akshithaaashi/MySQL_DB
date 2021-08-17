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