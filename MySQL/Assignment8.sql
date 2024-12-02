
#-----------------------------------------------------------------------------------------------------------------------------------------------
-- part 1: Subqueries 
#-----------------------------------------------------------------------------------------------------------------------------------------------

use population;
select * from persons;
select * from country;

-- 1. Find the number of persons in each country.
select count(Fname) as 'People Count',Country_name as 'Country' from persons  
where Country_name in (select Country_name from country) group by Country_name;
#or 
select count(Fname) as 'People Count',Country_name as 'Country' from persons group by Country_name;


-- 2. Find the number of persons in each country sorted from high to low. 
select count(Fname) as 'People_Count',Country_name as 'Country' from persons  
where Country_name in (select Country_name from country) group by Country_name order by count(Fname) desc;
#or 
select count(Fname) as 'People_Count',Country_name as 'Country' from persons  
group by Country_name order by count(Fname) desc;


-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0 
select avg(rating) as Average_rating ,Country_name as Country from persons  group by Country_name having avg(rating)>3;

-- 4. Find the countries with the same rating as the USA. (Use Subqueries) 
select avg(rating) as Average_rating ,Country_name as Country from persons group by country_name
having avg(rating)= (select avg(rating) from persons where country_name ='USA'); 

-- 5. Select all countries whose population is greater than the average population of all nations. 
select Country_name,population from country having population > (select avg(population) from country);

-- # -- #-- # -- #-- # -- #-- # -- #-- # -- #-- # -- #-- # -- #-- # -- #-- # -- #-- # -- #-- # -- #-- # -- #-- # -- #-- # -- #-- # -- #-- #-- # -- #

#-----------------------------------------------------------------------------------------------------------------------------------------------
-- Part 2 :Views
#-----------------------------------------------------------------------------------------------------------------------------------------------

-- Create a database named Product 
create database Product;
use Product;

-- create a table called Customer
create table Customer(
Customer_Id int auto_increment primary key,
First_name varchar (100) not null,
Last_name varchar (100),
Email varchar (100) unique not null,
Phone_no varchar (100),
Address varchar (250),
City varchar (100),
State varchar (100),
Zip_code varchar (10),
Country varchar (100));

-- inserting values 
insert into Customer(First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
values ('John', 'Smith', 'john.smith@example.com', '1234567890', '123 Elm Street', 'New York', 'NY', '10001', 'USA'),
('Victor', 'Hugo', 'victor.hugo@example.com', '9876543210', '456 Maple Avenue', 'Los Angeles', 'California', '90001', 'USA'),
('Gopan', 'Kumar', 'gopan.kumar@example.com', '4561237890', '789 Pine Road', 'London', 'England', 'SW1A 1AA', 'UK'),
('Manoj', 'Sukumar', 'manoj.sukumar@example.com', '3216549870', '123 Sunset Boulevard','San Diego', 'California', '92037', 'USA'),
('Mohan', 'Das', 'mohan.das@example.com', '6549871234', '654 Cedar Street', 'Sydney', 'New South Wales', '2000', 'Australia'),
('Sneha', 'Johnson', 'sneha.johnson@example.com', '9873216540', '789 Ocean Avenue','Sacramento', 'California', '95814', 'USA'),
('Antony', 'Williamson', 'antony.williamson@example.com', '1472583690', '321 Horizon Lane', 'Chicago', 'Illinois', '60601', 'USA'),
('Aaliya', 'Martin', 'aaliya.martin@example.com', '8523697410', '456 Alpine Road', 'Boston', 'Massachusetts', '02115', 'USA'),
('Binoy', 'Davis', 'binoy.davis@example.com', '9638527410', '789 Summit Street', 'Seoul', 'Seoul', '04524', 'South Korea'),
('Megha', 'Raj', 'megha.raj@example.com', '7418529630', '123 Valley Boulevard', 'San Jose', 'California', '95123', 'USA'),
('Phoebe', 'Buffay', 'phoebe.buffay@example.com', '9517532580', '321 Laugh Lane', 'New York', 'NY', '10002', 'USA'),
('Chandler', 'Bing', 'chandler.bing@example.com', '1231231234', '123 Joke Street', 'Oakland', 'California', '94601', 'USA'),
('Joseph', 'Tribbiani', 'joseph.tribbiani@example.com', '2342342345', '321 Actor Avenue', 'New York', 'New York', '10001', 'USA'),
('Rose', 'Geller', 'rose.geller@example.com', '3453453456', '456 Science Road', 'San Francisco', 'California', '94102', 'USA'),
('Rachel', 'Green', 'rachel.green@example.com', '4564564567', '123 Fashion Lane', 'London', 'England', 'SW1A 1AD', 'UK'),
('Monica', 'Geller', 'monica.geller@example.com', '5675675678', '321 Chef Street', 'Miami', 'Florida', '33101', 'USA');

select * from customer;

-- 1. Create a view named customer_info for the Customer table that displays Customer’s Full name and email address. Then perform the SELECT operation for the customer_info view.

create view customer_info as 
select concat(First_name,' ', Last_name) as 'Full name',Email as 'Email Address' from Customer;
select * from customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US. 

create view US_Customers as
select concat(First_name,' ', Last_name)  as 'Full name' ,Email  as 'Email Address' ,Phone_no  as 'Phone Number', Address, City, State, Zip_code  as 'Zip Code' from Customer where Country ='USA';
select * from US_Customers;

-- 3. Create another view named Customer_details with columns full name(Combine first_name and last_name), email, phone_no, and state. 

create view Customer_details as
select Customer_Id, concat(First_name,' ', Last_name)  as 'Full name' ,Email  as 'Email Address' ,Phone_no , State from Customer;
select * from Customer_details;

-- 4. Update phone numbers of customers who live in California for Customer_details view. 

#approach 1 : to update common phone number for all the cutomers  California

update Customer_details 
set Phone_no  = '9874561230'
where state = 'California';

#approach 2  : to update seperate phone numbers of each customer from California

-- creating a view for Identifying the customers from only California 
create view Customer_details_California as
select Customer_Id,concat(First_name,' ', Last_name)  as 'Full name',State from Customer where state = 'California';
select * from Customer_details_California;

update Customer_details 
set Phone_no = case
when Customer_Id =2 then 0123456789
when Customer_Id =4 then 1234567890
when Customer_Id =6 then 2345678901
when Customer_Id =10 then 3456789012
when Customer_Id =12 then 4567890123
when Customer_Id =14 then 5678901234
else Phone_no
end
where state ='California';

-- 5. Count the number of customers in each state and show only states with more than 5 customers. 
select count(State) as Customer_Count,State from Customer group by State having count(State) >5;

-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.
select count(State) as Customer_Count ,State from Customer_Details group by State;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
select * from Customer_Details order by State asc;

-- #-- # -- #-- #-- # -- #-- #-- # -- #-- #-- # -- #-- #-- # -- #-- #-- # -- #-- #-- # -- #-- #-- # -- #-- #-- # -- #-- #-- # -- #-- #-- # -- #