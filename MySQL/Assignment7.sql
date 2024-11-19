--  using the database created for the last assignment
use  population2;

-- (1) Add a new column called DOB in Persons table with data type as Date. 
alter table persons
add column DOB date;

# since the inser function will not work while adding DOB to the existing data, I am using update function for each of the rows
update persons
set DOB = '1985-06-15'
where Id = 1;

update persons
set DOB = '1990-04-20'
where Id = 2;

update persons
set DOB = '1978-12-05'
where Id = 3;

update persons
set DOB = '1989-09-15'
where Id = 4;

update persons
set DOB = '1982-03-22'
where Id = 5;

update persons
set DOB = '1991-07-14'
where Id = 6;

update persons
set DOB = '1983-01-10'
where Id = 7;

update persons
set DOB = '1987-11-08'
where Id = 8;

update persons
set DOB = '1988-05-18'
where Id = 9;

update persons
set DOB = '2003-08-30'
where Id = 10;

update persons
set DOB = '1986-02-14'
where Id = 11;

update persons
set DOB = '1992-11-25'
where Id = 12;

update persons
set DOB = '1975-07-08'
where Id = 13;

update persons
set DOB = '1980-05-30'
where Id = 14;

update persons
set DOB = '1994-09-10'
where Id = 15;

update persons
set DOB = '1981-03-17'
where Id = 16;

update persons
set DOB = '1989-12-22'
where Id = 17;

update persons
set DOB = '1993-06-05'
where Id = 18;

select * from persons;

-- (2) Write a user-defined function to calculate age using DOB. 
delimiter // 
create function Age_calculator( DOB date)
returns integer
deterministic
begin
declare age int;
set age = year(current_date) - year (DOB);
# adjusting if the birthday hasn't happened in the current year
if (month(current_date)< month(DOB)) or (month(current_date)= month(DOB) and (day(current_date)< day(DOB))) then
set age = age-1;
end if;
return age;
end //
delimiter ;

-- (3) Write a select query to fetch the Age of all persons using the function that has been created. 
Select Id,Fname, Lname, Age_Calculator(DOB) as Age from persons;

-- (4) Find the length of each country name in the Country table.
select Country_name,length(Country_name) as Name_length from country;

-- (5) Extract the first three characters of each country's name in the Country table. 
select Country_name, substring(Country_name,1,3) as Short_Name from Country;

-- (6) Convert all country names to uppercase and lowercase in the Country table.
select Country_name,ucase(Country_name) as Uppercase,lcase(Country_name) as Lowercase from country;


