-- creating databse 
create database teachersdb;
use teachersdb;

-- 1. Create a table named teachers with fields id, name, subject, experience and salary and insert 8 rows. 
create table teachers(
Teacher_id int auto_increment primary key,
Name varchar(50) not null,
Subject varchar(100),
Experience int,
Salary decimal(10,2));

insert into teachers(Name,Subject,Experience,Salary)
values ('John Smith','Mathematics',6,55000.00),
('Victor Hugo','English',8,62000.00),
('Gopakumar','Malayalam',9,68000.00),
('Manojkumar','Geography',5,61000.00),
('Mohan Das','Sports',7, 47000.00),
('Sneha Johnson','Chemistry',3,35000.00),
('Antony Williamson','Physics',4,45000.00),
('Aaliya Martin','Biology',2,30000.00);

select * from teachers;

-- 2. Create a before insert trigger named before_insert_teacher that will raise an error “salary cannot be negative” 
-- if the salary inserted to the table is less than zero. 

delimiter //
create trigger before_insert_teacher
before insert on teachers
for each row
begin
if new.salary < 0 then
signal sqlstate '45000'
set message_text = 'Salary cannot be negative';
end if;
end //
delimiter ;

#check
insert into teachers(Name,Subject,Experience,Salary)
values ('Binoy Davis','Hindi',2,-28000.00);

-- 3.Create an after insert trigger named after_insert_teacher that inserts a row with teacher_id,action, timestamp to a table called teacher_log when a new entry gets inserted to the teacher table. 
--   teacher_id -> column of teacher table, action -> the trigger action, timestamp -> time at which the new row has got inserted.

create table teacher_log(
Log_id int auto_increment primary key,
Teacher_id int,
Action varchar(100),
Timestamp datetime);

delimiter //
create trigger  after_insert_teacher
after insert on teachers 
for each row 
begin 
insert into teacher_log(Teacher_id,Action,Timestamp)
values (new.Teacher_id,concat('New teacher added:', new.Name),now());
end //
delimiter ;


#check
insert into teachers(Name,Subject,Experience,Salary)
values ('Binoy Davis','Hindi',2,28000.00);

select * from teacher_log;

-- 4. Create a before delete trigger that will raise an error when you try to delete a row that has experience greater than 10 years. 

# inserting values according to the requirement

insert into teachers(Name,Subject,Experience,Salary)
values ('Megha Raj','Chemistry',11,70000.00),
('Phoebe Buffay','Music',12,72000.00),
('Chandler Bing','Accountancy',13,'82000.00');

# creating the trigger

delimiter //
create trigger before_delete_teacher
before delete on teachers
for each row
begin
if old.Experience >10 then
signal sqlstate '45000'
set message_text = 'Teachers with experience more than 10 years cannot be deleted';
end if ;
end //
delimiter ;

#check
delete from teachers where Teacher_id = 12;

-- 5. Create an after delete trigger that will insert a row to teacher_log table when that row is deleted from teacher table.

delimiter //
create trigger After_delete_teacher
after delete on teachers 
for each row
begin
insert into teacher_log(Teacher_id,Action,Timestamp)
values (old.Teacher_id,concat('Deleted from list:', old.Name),now());
end //
delimiter ;

#check
delete from teachers where Teacher_id = 6;
select * from teacher_log;

