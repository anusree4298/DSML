-- Creating Database 
create database population2;
use  population2;

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
('Megha', 'Raj', 120000, 4.1,10,'Brazil'); 

-- (1) Write an SQL query to print the first three characters of Country_name from the Country table. 
# using substring function
select Country_name, substring(Country_name,1,3) as Short_Country_Name from Country;

-- (2)  Write an SQL query to concatenate first name and last name from Persons table. 
# using concat function
select concat(Fname,' ',Lname) as full_name from Persons;

-- (3) Write an SQL query to count the number of unique country names from Persons table.
# using Count and Distinct function
select count(distinct Country_name) as Distinct_Country_count from Persons;

-- (4) Write a query to print the maximum population from the Country table. 
# using Max function
select max(Population) as Maximum_Population from Country;

-- (5) Write a query to print the minimum population from Persons table
 # using Min function
select min(Population) as Minimum_Population from Persons;

-- (6) Insert 2 new rows to the Persons table making the Lname NULL. Then write another query to count Lname from Persons table. 
# using count function to find initial count 
select count(Lname) as Lname_count from Persons;
# initial count =10

# inserting new values 
insert into Persons (Fname, Lname, Population, Rating, Country_Id, Country_name)
values('Deepa', NULL, 106000, 4.8, 1, 'USA'),
('Vicky', NULL, 400080, 2.9, 2, 'Canada');

# using count function to find final count 
select count(Lname) as Lname_count from Persons;
# final count =10
#count remains the same as the count function does not count the null values

-- (7) Write a query to find the number of rows in the Persons table. 
# using count function
 select count(*) as Number_of_Rows from Persons;

-- (8) Write an SQL query to show the population of the Country table for the first 3 rows. (Hint: Use LIMIT) 
# using limit function
select Population from Country limit 3;

-- (9) Write a query to print 3 random rows of countries. (Hint: Use rand() function and LIMIT)
select * from country order by rand()  limit 3;

-- (10) List all persons ordered by their rating in descending order. 
select * from Persons order by rating  desc;

-- (11) Find the total population for each country in the Persons table.
select country_name ,sum(population) as Total_population from persons group by country_name;

-- (12) Find countries in the Persons table with a total population greater than 50,000 
select country_name ,sum(population) as Total_population from persons group by country_name having Total_population >50000;


-- (13) List the total number of persons and average rating for each country, but only for countries with more than 2 persons, ordered by the average rating in ascending order.

# since I dont have more than 2 persons in the same country I am adding more values to fullfil the requirement for academic purpose.
insert into Persons (Fname, Lname, Population, Rating, Country_Id, Country_name)
values('Phoebe', 'Buffay', 10000, 3.8, 1, 'USA'),
('Chandler', 'Bing', 20000, 2.7, 2, 'Canada'),
('Joseph', 'Tribbiani', 5000, 3.8, 3, 'UK'),
('Rose', 'Geller', 100000, 2.2, 4, 'UK'),
('Rachel', 'Green', 30000, 2.5, 5, 'UK'),
('Monica', 'Geller', 4000, 3.9, 2, 'Canada');

#ans
select (country_name ),count(country_name) as person_count, avg(rating) as avg_rating from persons group by country_name having person_count>2 order by avg_rating asc ;
