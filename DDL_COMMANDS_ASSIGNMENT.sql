CREATE DATABASE company_training;
USE company_training;
CREATE TABLE departments (
department_id INT NOT NULL,
dept_name VARCHAR(80) NOT NULL,
city VARCHAR(60)
);
CREATE TABLE employees (
employee_id INT NOT NULL,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120),
department_id INT NOT NULL,
salary DECIMAL(10,2),
status VARCHAR(20)
);

-- Q1 Add a PRIMARY KEY constraint on departments.department_id.
alter table departments 
add primary key (department_id );

-- Q2 Add a PRIMARY KEY constraint on employees.employee_id.
alter table employees
add primary key(employee_id);

-- Q3 Add a new column named location of type VARCHAR(100) to the departments table.
alter table departments 
add column (location varchar(100));

-- Q4 Rename the column dept_name to department_name in the departments table, keeping its existing data type and  NOT NULL requirement.
alter table departments 
rename column dept_name to department_name; 

-- Q5 Modify employees.salary to DECIMAL(12,2) and ensure that it does not allow NULL values.
alter table employees 
modify column salary decimal (12,2) not null ;

-- Q6 Set the default value of employees.status to Active.
alter table employees 
alter column status set default 'active';

-- Q7 Add a UNIQUE constraint on employees.email.
alter table employees 
add constraint uniq_email unique(email);

-- Q8 Rename the employees table to staff.
alter table employees
rename to staff;

-- Q9 Add a FOREIGN KEY constraint on staff.department_id referencing departments.department_id.
alter table staff 
add constraint fk_key foreign key(department_id) references departments(department_id);

-- Q10 Drop the UNIQUE constraint added to staff.email in Question 7.
alter table staff 
drop constraint uniq_email ;

-- Q11 Drop the FOREIGN KEY constraint created in Question 9 without dropping the department_id column.alter
alter table staff 
drop constraint fk_key;

-- Q12 Drop the PRIMARY KEY constraint from the staff table, retaining its employee_id column.

alter table staff 
drop primary key ;

-- Q13Add the PRIMARY KEY constraint back on staff.employee_id.
alter table staff 
add constraint primary key(employee_id);

-- Q14 Drop the location column from the departments table.
alter table departments
drop column location ;

-- Q15 Rename the database from company_training to company_management using MySQL-supported DDL operations

create database company_management;
use company_management;
CREATE TABLE departments (
department_id INT NOT NULL,
dept_name VARCHAR(80) NOT NULL,
city VARCHAR(60)
);
CREATE TABLE employees (
employee_id INT NOT NULL,
employee_name VARCHAR(100) NOT NULL,
email VARCHAR(120),
department_id INT NOT NULL,
salary DECIMAL(10,2),
status VARCHAR(20)
);
drop database company_training;