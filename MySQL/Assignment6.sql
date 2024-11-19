--  using the database created for the last assignment
use  population2;

-- (1)Perform inner join, Left join, and Right join on the tables. 
#Inner join
select c.Country_name, c.Population, c.Area_,p.Fname, p.Lname, p.Population, p.Rating from Country c
inner join Persons p on c.Id = p.Country_Id;

#Left join
select c.Country_name, c.Population, c.Area_,p.Fname, p.Lname, p.Population, p.Rating from Country c
left join Persons p on c.Id = p.Country_Id;

#Rignt join
select c.Country_name, c.Population, c.Area_,p.Fname, p.Lname, p.Population, p.Rating from Country c
right join Persons p on c.Id = p.Country_Id;

-- (2)List all distinct country names from both the Country and Persons tables. 
select Country_name as Country_names from Country
union
select Country_name as Country_names from Persons;

-- (3)List all country names from both the Country and Persons tables, including duplicates. 
select Country_name as Country_names from Country
union all
select Country_name as Country_names from Persons;

-- (4)Round the ratings of all persons to the nearest integer in the Persons table.
select rating,round(rating,0) as Rounded_rating from persons;

