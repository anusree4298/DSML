-- Creating Database "School"
create database School;
use School;
-- Creating table "STUDENT"
create table STUDENT(
Roll_No int auto_increment primary key,
Student_Name varchar(75) not null,
Marks int check(Marks between 0 and 100),
Grade char(1) check (Grade in ('A', 'B', 'C', 'D', 'E', 'F'))
);
-- Insering data to the table
insert into STUDENT (Student_Name,Marks,Grade)
values ('John','85','B'),('Victor','78','C'),('Gopan','95','A'),('Manoj','94','A'),('Mohan','89','B'),
	   ('Antony','68','D'),('Sneha','44','F'),('Binoy','55','E'),('Megha','58','E'),('Deepa','75','D');

-- (1) Displaying the table using SELECT command
select * from STUDENT;
-- (2) Adding a column named Contact to the STUDENT table
alter table STUDENT 
add Contact varchar(15) default 'Not Provided';
-- (3) Removing the Grade column from the Student table.
alter table STUDENT
drop column Grade;
-- (4) Renaming the table to CLASSTEN
rename table STUDENT to CLASSTEN;
-- (5) Delete all rows from the table
truncate table CLASSTEN;
-- (6) Remove the table from the database.
drop table CLASSTEN;
