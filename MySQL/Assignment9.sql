-- creating database 
create database Workersdb;
use Workersdb;

-- creating workers table
create table workers(
Worker_Id int auto_increment primary key, 
FirstName varchar(25), 
LastName varchar(25), 
Salary decimal(10,2), 
JoiningDate DATETIME, 
Department varchar(25));

insert into workers(FirstName,LastName,Salary, JoiningDate,Department)
values ('John', 'Smith', 55000.00, '2023-01-15 09:00:00', 'HR'),
('Victor', 'Hugo', 62000.00, '2022-05-12 09:30:00', 'Finance'),
('Gopan', 'Kumar', 48000.00, '2021-07-08 10:00:00', 'Engineering'),
('Manoj', 'Sukumar', 51000.00, '2023-03-22 11:00:00', 'Sales'),
('Mohan', 'Das', 47000.00, '2020-11-01 08:45:00', 'IT'),
('Sneha', 'Johnson', 58000.00, '2023-06-30 09:15:00', 'Marketing'),
('Antony', 'Williamson', 60000.00, '2019-04-10 14:00:00', 'HR'),
('Aaliya', 'Martin', 53000.00, '2021-08-25 10:30:00', 'Finance'),
('Binoy', 'Davis', 45000.00, '2022-01-18 09:45:00', 'Engineering'),
('Megha', 'Raj', 49000.00, '2020-02-14 09:00:00', 'Sales'),
('Phoebe', 'Buffay', 70000.00, '2018-09-10 08:00:00', 'Marketing'),
('Chandler', 'Bing', 68000.00, '2017-03-20 07:45:00', 'IT'),
('Joseph', 'Tribbiani', 62000.00, '2019-12-01 10:00:00', 'HR'),
('Rose', 'Geller', 56000.00, '2023-07-12 08:15:00', 'Engineering'),
('Rachel', 'Green', 72000.00, '2022-10-05 11:15:00', 'Sales'),
('Monica', 'Geller', 75000.00, '2021-12-22 13:00:00', 'Finance');

select * from workers;

#---------------------------------------------------------------------------------------------------------------------------

-- 1. Create a stored procedure that takes in IN parameters for all the columns in the Worker table .
--    adds a new record to the table  and then invokes the procedure call. 

delimiter //
create procedure add_new_worker( 
 in FirstName varchar(25), 
 in LastName varchar(25), 
 in Salary decimal(10,2), 
 in JoiningDate DATETIME, 
 in Department varchar(25))
 begin 
 insert into workers (FirstName,LastName,Salary, JoiningDate,Department)
 values (FirstName,LastName,Salary, JoiningDate,Department);
 end //
 delimiter ;
 
 call add_new_worker('Sam','Adams',55000.00,'2023-01-01 09:00:00','IT');

# check
 select * from workers;
 
 #---------------------------------------------------------------------------------------------------------------------------
 
 -- 2. Write stored procedure takes in an IN parameter for WORKER_ID and an OUT parameter for SALARY.
 --    It should retrieve the salary of the worker with the given ID and returns it in the p_salary parameter. 
 --    Then make the procedure call. 
 
 delimiter //
 create procedure GetSalary( in workerid int,out p_salary decimal(10,2))
 begin
 select salary into p_salary  
 from workers 
 where workerid= Worker_Id  ;
 end //
 delimiter ;
  
 set @p_salary =0;
 call GetSalary(3,@p_salary);
 select @p_salary as p_salary;
 
 # check
select (Salary) from workers where Worker_Id =3;
 
 #---------------------------------------------------------------------------------------------------------------------------
 
-- 3. Create a stored procedure that takes in IN parameters for WORKER_ID and DEPARTMENT.
--     It should update the department of the worker with the given ID. Then make a procedure call. 
   
 delimiter //
 create procedure UpdateDepartment( in workerid int, in Department_name varchar(25))
 begin
 update workers 
 set Department = Department_name
 where workerid= Worker_Id  ;
 end //
 delimiter ;
 
 call UpdateDepartment(4,'Engineering');
 
# check
 select * from workers where Worker_Id = 4 ;
 
 #-----------------------------------------------------------------------------------------------------------------------------
 
 --  4. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_workerCount. 
 --   It should retrieve the number of workers in the given department and returns it in the p_workerCount parameter. Make procedure call.
 
 delimiter //
 create procedure GetworkerCount( in Department_name varchar(25),out p_workerCount int )
 begin
 select count(*) into p_workerCount
 from workers 
 where Department_name= Department ;
 end //
 delimiter ;
 
 set @p_workerCount =0;
 call GetworkerCount('HR',@p_workerCount);
 select @p_workerCount as p_workerCount;

# check
select count(*) from workers where Department= 'HR';

#----------------------------------------------------------------------------------------------------------------------------

-- 5. Write a stored procedure that takes in an IN parameter for DEPARTMENT and an OUT parameter for p_avgSalary. 
--   It should retrieve the average salary of all workers in the given department and returns it in the p_avgSalary parameter and call the procedure

delimiter //
create procedure GetAvgSalary( in Department_name varchar(25),out p_avgSalary decimal(10,2))
begin
select avg(Salary) into p_avgSalary 
from workers
where Department_name = Department;
end //
Delimiter ;

set @p_avgSalary =0;
call GetAvgSalary('IT',@p_avgSalary);
select @p_avgsalary as p_avgSalary;

# check
select avg(Salary) from workers where Department= 'IT';