-- MySQL Capstone Project 

-- Topic : Library Management System You are going to build a project based on Library Management System. 
-- It keeps track of all information about books in the library, their cost, status and total number of books available in the library. 
-- Create a database named library and following TABLES in the database: 
--  1. Branch 2. Employee 3. Books 4. Customer 5. IssueStatus 6. ReturnStatus

-- creating and using the database LIBRARY
create database LIBRARY;
use LIBRARY;
 
 -- Create Branch table
create table Branch (
	Branch_no int auto_increment primary key ,
	Manager_Id int,
	Branch_address varchar(500),
	Contact_no varchar(12));
    
 -- Create Employee table
create table Employee (
    Emp_Id int auto_increment primary key,
    Emp_name varchar(100),
    Position varchar(50),
    Salary decimal(10, 2),
    Branch_no int,
    foreign key(Branch_no) references Branch(Branch_no)); 
    
  -- Create Books table
create table Books (
    ISBN varchar(20) primary key,
    Book_title varchar(500),
    Category varchar(100),
    Rental_Price decimal (10, 2),
    Status enum('yes', 'no'),
    Author varchar(100),
    Publisher varchar(100));  
    
    -- Create Customer table
create table Customer (
    Customer_Id int primary key auto_increment,
    Customer_name varchar(100),
    Customer_address varchar(500),
    Reg_date date);


-- Create IssueStatus table
create table IssueStatus (
    Issue_Id int primary key auto_increment,
    Issued_cust int,
    Issued_book_name varchar(255),
    Issue_date date,
    Isbn_book varchar(20),
   foreign key(Issued_cust) references Customer(Customer_Id),
   foreign key (Isbn_book) references Books(ISBN));
   
   -- Create ReturnStatus table
create table ReturnStatus (
    Return_Id int primary key auto_increment,
    Return_cust int,
    Return_book_name varchar(500),
    Return_date date,
    Isbn_book2 varchar(20),
   foreign key (Return_cust) references Customer (Customer_Id),
   foreign key(Isbn_book2) references Books (ISBN));
    
-- Inserting data into the tables
-- 1.Insert data into Branch
insert into Branch (Manager_Id, Branch_address, Contact_no) values
(1, '123 Main St, City A', '9876543210'),
(2, '456 Side St, City B', '9876543211'),
(3, '789 Cross St, City C', '9876543212'),
(4, '101 Hill St, City D', '9876543213'),
(5, '202 Pine St, City E', '9876543214'),
(6, '303 Lake St, City F', '9876543215'),
(7, '404 Valley St, City G', '9876543216'),
(8, '505 River St, City H', '9876543217'),
(9, '606 Ocean St, City I', '9876543218'),
(10, '707 Desert St, City J', '9876543219');

select * from Branch;

-- 2.Insert data into Employee
insert into Employee (Emp_name, Position, Salary, Branch_no) values
('Victor', 'Manager', 60000, 1),
('Gopan', 'Librarian', 40000, 1),
('Manoj', 'Manager', 70000, 2),
('David', 'Assistant', 35000, 2),
('Mohan', 'Librarian', 45000, 3),
('Sneha', 'Manager', 80000, 4),
('Antony', 'Librarian', 42000, 5),
('Aalia', 'Assistant', 39000, 6),
('Binoy', 'Manager', 55000, 7),
('Megha', 'Librarian', 46000, 8),
('Rahul', 'Assistant', 38000, 1),
('Ravi', 'Clerk', 32000, 1),
('Priya', 'Librarian', 40000, 1),
('Anu', 'Librarian', 43000, 2),
('Joseph', 'Assistant', 37000, 2),
('Sheetal', 'Clerk', 31000, 2),
('Kavya', 'Assistant', 36000, 3),
('Suresh', 'Clerk', 33000, 3),
('Aditi', 'Assistant', 37000, 3),
('Raj', 'Clerk', 32000, 3),
('Pooja', 'Clerk', 34000, 4),
('Vinod', 'Assistant', 41000, 4),
('Nithin', 'Clerk', 31000, 5),
('Geetha', 'Assistant', 37000, 5),
('Roshan', 'Clerk', 30000, 6),
('Aarav', 'Assistant', 39000, 6),
('Meera', 'Assistant', 40000, 7),
('Ramesh', 'Clerk', 33000, 7),
('Akhil', 'Clerk', 32000, 8),
('Arjun', 'Assistant', 39000, 8),
('Neha', 'Manager', 62000, 1),
('Sanjay', 'Clerk', 34000, 1),
('Ankit', 'Assistant', 39000, 2),
('Ishita', 'Manager', 71000, 3),
('Rohan', 'Clerk', 35000, 3),
('Sonal', 'Clerk', 32000, 4),
('Varun', 'Assistant', 38000, 4),
('Divya', 'Manager', 64000, 5),
('Tarun', 'Clerk', 31000, 6),
('Nidhi', 'Assistant', 40000, 7),
('Harsha', 'Clerk', 31000, 8),
('Priyanka', 'Assistant', 37000, 8),
('Ashwin', 'Manager', 70000, 9),
('Ritika', 'Assistant', 36000, 9),
('Nisha', 'Clerk', 30000, 9),
('Rahul', 'Assistant', 37000, 9),
('Shreya', 'Librarian', 42000, 9),
('Kiran', 'Clerk', 31000, 9);

select * from Employee;

-- 3. Insert data into Books
insert into Books (ISBN, Book_title, Category, Rental_Price, Status, Author, Publisher) values
('978-0-01', 'History of the World', 'History', 30.00, 'yes', 'Author A', 'Publisher A'),
('978-0-02', 'Modern Physics', 'Science', 40.00, 'yes', 'Author B', 'Publisher B'),
('978-0-03', 'Advanced Chemistry', 'Science', 35.00, 'no', 'Author C', 'Publisher C'),
('978-0-04', 'Ancient Civilizations', 'History', 25.00, 'yes', 'Author D', 'Publisher D'),
('978-0-05', 'World War II', 'History', 20.00, 'no', 'Author E', 'Publisher E'),
('978-0-06', 'Fictional Realms', 'Fiction', 15.00, 'yes', 'Author F', 'Publisher F'),
('978-0-07', 'Romantic Tales', 'Fiction', 12.00, 'yes', 'Author G', 'Publisher G'),
('978-0-08', 'Economic Principles', 'Economics', 50.00, 'no', 'Author H', 'Publisher H'),
('978-0-09', 'Programming Basics', 'Technology', 45.00, 'yes', 'Author I', 'Publisher I'),
('978-0-10', 'Data Science', 'Technology', 55.00, 'no', 'Author J', 'Publisher J');

select * from Books;

-- 4.Insert data into Customer
insert into Customer (Customer_name, Customer_address, Reg_date) values
('Anna', '21 Birch St, City X', '2021-12-01'),
('Rose', '34 Maple St, City Y', '2022-01-15'),
('Clara', '45 Oak St, City Z', '2023-06-10'),
('Jack', '56 Elm St, City A', '2023-02-18'),
('Eva', '67 Cedar St, City B', '2021-10-05'),
('Felix', '78 Walnut St, City C', '2020-09-12'),
('Georgia', '89 Cherry St, City D', '2023-03-22'),
('Henry', '90 Ash St, City E', '2021-08-14'),
('Gregory', '12 Spruce St, City F', '2023-06-15'),
('Thomas', '34 Willow St, City G', '2021-11-20');

select * from Customer;

-- 5. Insert data into IssueStatus
insert into IssueStatus (Issued_cust, Issued_book_name, Issue_date, Isbn_book) values
(1, 'History of the World', '2023-06-01', '978-0-01'),
(3, 'Modern Physics', '2023-06-10', '978-0-02'),
(5, 'Ancient Civilizations', '2023-03-15', '978-0-04'),
(6, 'Romantic Tales', '2023-07-05', '978-0-07'),
(9, 'Programming Basics', '2023-06-15', '978-0-09');

select * from IssueStatus;

-- 6. Insert data into ReturnStatus
insert into  ReturnStatus (Return_cust, Return_book_name, Return_date, Isbn_book2) values
(3, 'Modern Physics', '2023-06-25', '978-0-02'),
(5, 'Ancient Civilizations', '2023-03-25', '978-0-04'),
(6, 'Romantic Tales', '2023-07-15', '978-0-07');

select * from ReturnStatus;

-- Displaying all the tables 

select * from Branch;
select * from Employee;
select * from Books;
select * from Customer;
select * from IssueStatus;
select * from ReturnStatus;

-- ---------------------------------------------QUERIES---------------------------------------------------------------------------------------

-- 1. Retrieve the book title, category, and rental price of all available books. 
select  Book_title, Category, Rental_Price from Books where status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary. 
select  Emp_name as  Employee_name , Salary from Employee order by Salary desc;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.
select  I.Issued_book_name as Book_Title ,C.Customer_name from IssueStatus I join  Customer C on I.Issued_cust =C.Customer_id ;

-- 4. Display the total count of books in each category. 
select Category,count(Book_title) as Count_of_books from books group by Category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000. 
select  Emp_name as Employee_name, Position from Employee where  Salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet. 
select C.Customer_name from Customer C 
left join IssueStatus I on I.Issued_cust = C.Customer_id  where  reg_date < '2022-01-01' and Issue_Id is NULL;

-- 7. Display the branch numbers and the total count of employees in each branch.
select B.Branch_no as Branch_number,count(E.branch_no)as Count_of_Employees 
from Branch B join Employee E on B.Branch_no = E.Branch_no group by B.branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.
select C.Customer_name from Customer C 
join IssueStatus I on I.Issued_cust =C.Customer_id where month(I.Issue_date) =6 and year(I.Issue_date) =2023;

-- 9. Retrieve book_title from book table containing history. 
select Book_title from books where Book_title like '%history%';

-- 10.Retrieve the branch numbers along with the count of employees for branches having more than 5 employees 
select B.Branch_no as Branch_number,count(E.branch_no)as Count_of_Employees 
from Branch B join Employee E on B.Branch_no = E.Branch_no group by B.branch_no  having count(E.branch_no) >5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses. 
select E.Emp_name as Manager_name ,B.Branch_no as Branch_number, B.Branch_address as  Branch_address 
 from employee E join Branch B on  B.Branch_no = E.Branch_no where position = 'Manager';
 
-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25. 
 select C.Customer_name, B.Book_title   from  customer C join IssueStatus I on I.Issued_cust =C.Customer_id 
 join books B on I.Issued_book_name = B.Book_title  where B.rental_price>25;
 
