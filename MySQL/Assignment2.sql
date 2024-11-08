-- Creating Database "Sales"
create database Sales;
use Sales;

-- Creating table "Orders"
create table Orders(
Order_Id int auto_increment primary key,
Customer_name varchar (100) not null,
Product_Category varchar (100) not null,
Ordered_item varchar(150) not null,
Contact_No varchar (15) default 'Not Provided'
);

-- 1. Add a new column named “order_quantity” to the orders table.
alter table Orders
add column order_quantity varchar(10) ;
 
 -- 2. Rename the orders table to the sales_orders table.
 rename table Orders to sales_orders;
 
 -- 3. Insert 10 rows into the sales_orders table
 insert into  Sales_Orders (Customer_name, Product_Category, Ordered_item, Contact_No, order_quantity)
 values ( 'John', 'Electronics', 'Laptop', '9012345678', 2),
( 'Victor', 'Home Appliances', 'Microwave', '91202345678', 1),
('Gopan', 'Furniture', 'Chair', '9201345678', 4),
( 'Manoj', 'Books', 'Novel', '9301245678', 3),
( 'Mohan', 'Clothing', 'T-Shirt', '9401235678', 5),
( 'Antony', 'Electronics', 'Headphones', '9501234678', 2),
( 'Sneha', 'Beauty', 'Perfume', '9601234578', 1),
( 'Binoy', 'Groceries', 'Rice Bag', '9701234568', 6),
( 'Megha', 'Stationery', 'Notebook', '9801234567', 3),
( 'Deepa', 'Toys', 'Doll', '9901234567', 2);

-- 4. Retrieve customer_name and Ordered_Item from the sales_orders table.
select Customer_name, Ordered_item from sales_orders;

-- 5. Use the update command to change the name of the product for any row
update Sales_Orders
set Ordered_item = 'Smartphone'
WHERE Customer_name = 'Antony'  ;

-- 6. Delete the sales_orders table from the database.
drop table sales_orders;
