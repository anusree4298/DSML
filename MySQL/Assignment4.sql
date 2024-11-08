-- Creating Database 
create database population;
use  population;

-- Create a table named Country
create table Country(
Id int auto_increment primary key,
Country_name varchar (100),
Population int,
Area_ int);

insert into Country(Country_name, Population, Area_)
values( 'USA', 331000000, 9834000),
('Canada', 38000000, 9985000),
('UK', 67000000, 243000),
('India', 1380000000, 3287000),
('Australia', 25600000, 7692000),
('Germany', 83000000, 357000),
('France', 67000000, 643800),
('Japan', 125000000, 377000),
('South Korea', 52000000, 100210),
('Brazil', 212000000, 8516000);

-- Create another table named Persons
create table Persons(
Id int auto_increment primary key,
Fname varchar (100) not null,
Lname varchar (100),
Population int,
Rating decimal(2,1),
Country_Id int,
Country_name varchar (100),
foreign key (Country_Id) references Country(Id)
);

insert into Persons(Fname, Lname, Population, Rating, Country_Id, Country_name)
values('John', 'Smith', 100000, 4.5, 1, 'USA'),
('Victor', 'Hugo', 200000, 3.9, 2, 'Canada'),
('Gopan', 'Kumar', 50000, 4.8, 3, 'UK'),
('Manoj', 'Sukumar', 1000000, 4.2, 4, 'India'),
('Mohan', 'Das', 300000, 3.5, 5, 'Australia'),
('Sneha', 'Johnson', 150000, 4.7, 6, 'Germany'),
('Antony', 'Williamson',  250000, 4.0, 7, 'France'),
('Aaliya', 'Martin', 80000, 3.8, 8, 'Japan'),
('Binoy', 'Davis', 90000, 4.9, 9, 'South Korea'),
('Megha', 'Raj', 120000, 4.1, NULL, NULL); 

-- (1)List the distinct country names from the Persons table 
select distinct Country_name from Persons;

-- (2)Select first names and last names from the Persons table with aliases. 
select Fname as First_name , Lname as Last_name from Persons; 

-- (3)Find all persons with a rating greater than 4.0. 
select * from Persons where Rating > 4.0;

-- (4)Find countries with a population greater than 10 lakhs. 
select * from Country where Population > 1000000;

-- (5)Find persons who are from 'USA' or have a rating greater than 4.5. 
select * from Persons where Country_name= 'USA'  or Rating > 4.5;

-- (6)Find all persons where the country name is NULL. 
select * from Persons where Country_name is null;

-- (7)Find all persons from the countries 'USA', 'Canada', and 'UK'. 
select * from Persons where Country_name in ('USA', 'Canada','UK');

-- (8)Find all persons not from the countries 'India' and 'Australia'. 
select * from Persons where Country_name not  in ('India','Australia');

-- (9)Find all countries with a population between 5 lakhs and 20 lakhs. 
select * from Country where Population between 500000 and 2000000;

-- 10)Find all countries whose names do not start with 'C'.
select * from Country where Country_name not like'C%';
