-- creating Database
create database Management;
use Management;

-- Creating table named Managers
create table Managers (
Manager_Id int auto_increment primary key,
First_name varchar(100) not null,
Last_Name varchar(100) not null,
DOB date not null,
Age char (2) check ( Age between 18 and 60) ,
Last_update timestamp default current_timestamp,
Gender varchar(6) check (gender in ('Male','Female')), 
Department varchar (50) not null,
Salary varchar (10) not null);

-- 1. Insert 10 rows
insert into Managers (First_name, Last_Name, DOB, Age, Gender, Department, Salary)
values ('John', 'Smith', '1985-06-15', '39', 'Male', 'Finance', '75000'),
('Victor', 'Hugo', '1990-04-20', '34', 'Male', 'Human Resources', '65000'),
('Gopan', 'Kumar', '1978-12-05', '46', 'Male', 'Operations', '82000'),
('Manoj', 'Sukumar', '1989-09-15', '35', 'Male', 'Marketing', '72000'),
('Mohan', 'Das', '1982-03-22', '42', 'Male', 'IT', '91000'),
('Sneha', 'Johnson', '1991-07-14', '33', 'Female', 'Finance', '68000'),
('Antony', 'Williamson', '1983-01-10', '41', 'Male', 'Sales', '75000'),
('Aaliya', 'Martin', '1987-11-08', '37', 'Female', 'Legal', '79000'),
('Binoy', 'Davis', '1988-05-18', '36', 'Male', 'Product Development', '86000'),
('Megha', 'Raj', '2003-08-30', '21', 'Female', 'Customer Support', '35000');
select * from Managers;

-- 2. Write a query that retrieves the name and date of birth of the manager with Manager_Id 1
select First_name, Last_Name, DOB from Managers where Manager_Id =1;

-- 3. Write a query to display the annual income of all managers.
select Salary*12 as Annual_Income from Managers;

--  4. Write a query to display records of all managers except ‘Aaliya’.
select * from Managers where First_name!= 'Aaliya';

-- 5. Write a query to display details of managers whose department is IT and earns more than 25000 per month
select * from Managers where Department = 'IT' and Salary>25000;

--  6. Write a query to display details of managers whose salary is between 10000 and 35000.
select * from Managers where Salary between 10000 and 35000;
