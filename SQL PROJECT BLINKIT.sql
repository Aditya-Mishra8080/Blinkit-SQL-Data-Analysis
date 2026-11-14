CREATE DATABASE BlinkitDB;
USE BlinkitDB;
-- 1. CUSTOMERS
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    email VARCHAR(100)
);

-- 2. CATEGORIES
CREATE TABLE Categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

-- 3. PRODUCTS
CREATE TABLE Products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    price DECIMAL(10,2),
    FOREIGN KEY (category_id)
    REFERENCES Categories(category_id)
);

-- 4. ORDERS
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    payment_method VARCHAR(30),
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id)
    REFERENCES Customers(customer_id)
);

-- 5. ORDER ITEMS
CREATE TABLE Order_Items (
    item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id)
    REFERENCES Orders(order_id),
    FOREIGN KEY (product_id)
    REFERENCES Products(product_id)
);


-- CUSTOMERS (10)
INSERT INTO Customers VALUES
(1,'Rahul Sharma','Varanasi','rahul@gmail.com'),
(2,'Amit Verma','Delhi','amit@gmail.com'),
(3,'Priya Singh','Mumbai','priya@gmail.com'),
(4,'Neha Gupta','Lucknow','neha@gmail.com'),
(5,'Rohit Kumar','Pune','rohit@gmail.com'),
(6,'Anjali Mishra','Varanasi','anjali@gmail.com'),
(7,'Vikas Yadav','Jaipur','vikas@gmail.com'),
(8,'Sneha Patel','Ahmedabad','sneha@gmail.com'),
(9,'Karan Mehta','Bangalore','karan@gmail.com'),
(10,'Pooja Das','Kolkata','pooja@gmail.com');

-- CATEGORIES (5)
INSERT INTO Categories VALUES
(1,'Grocery & Kitchen'),
(2,'Dairy & Breakfast'),
(3,'Snacks & Drinks'),
(4,'Personal Care'),
(5,'Household Essentials');

-- PRODUCTS (10)
INSERT INTO Products VALUES
(101,'Aashirvaad Atta',1,250),
(102,'Fortune Rice',1,180),
(103,'Amul Milk',2,66),
(104,'Amul Butter',2,58),
(105,'Lays Chips',3,20),
(106,'Coca Cola',3,40),
(107,'Dove Shampoo',4,180),
(108,'Colgate Toothpaste',4,95),
(109,'Surf Excel',5,120),
(110,'Vim Dishwash',5,50);

-- ORDERS (10)
INSERT INTO Orders VALUES
(1001,1,'2026-01-01','UPI','Delivered'),
(1002,2,'2026-01-02','Card','Delivered'),
(1003,3,'2026-01-03','Cash','Pending'),
(1004,4,'2026-01-04','UPI','Delivered'),
(1005,5,'2026-01-05','Card','Cancelled'),
(1006,1,'2026-01-06','UPI','Delivered'),
(1007,6,'2026-01-07','Cash','Delivered'),
(1008,7,'2026-01-08','UPI','Pending'),
(1009,8,'2026-01-09','Card','Delivered'),
(1010,9,'2026-01-10','UPI','Shipped');

-- ORDER ITEMS (15)
INSERT INTO Order_Items VALUES
(1,1001,101,2),
(2,1001,103,2),
(3,1002,105,5),
(4,1002,106,2),
(5,1003,107,1),
(6,1004,102,3),
(7,1004,104,2),
(8,1005,109,1),
(9,1005,110,2),
(10,1006,101,1),
(11,1006,108,2),
(12,1007,103,3),
(13,1008,105,4),
(14,1009,107,2),
(15,1010,106,3);


SELECT * FROM CATEGORIES;
SELECT * FROM ORDERS;
SELECT * FROM ORDER_ITEMS;
SELECT * FROM PRODUCTS;
SELECT * FROM CUSTOMERS;


-- Question Solved 
-- Ques-1 Display all customer records.
SELECT * FROM CUSTOMERS;

-- Ques-2 Display only customer name and city.
select customer_name, city from customers;

-- Ques-3 Display all product names and prices.
select product_name , price from products;

-- Ques-4 Find products whose price is greater than 100.
select * from products where price > 100;

-- Ques-5 Find customers from Varanasi.
select * from customers where city = "varanasi";

-- Ques6 Find products whose price is less than 100.
select * from products where price < 100;

-- Ques-7 Find products with price greater than 100 and less than 500.
select * from products where price > 100 and price <500;

-- Ques-8 Find customers from Delhi or Mumbai.
select * from customers where city = "Delhi" or city = "Mumbai";

-- Ques-9 Display orders that are not Delivered.
select * from orders where not orders_status = "delivered";

-- Ques-10  Display unique customer cities.
select distinct city from customers;

-- Ques-11 Display unique payment methods.
select distinct payment_method from orders;

-- Ques-12 Find products whose prices are between ₹50 and ₹200.
select * from products where price between 50 and 200;

-- Ques-13 Find customers from Varanasi, Delhi and Mumbai.
select * from customers where city in ("varanasi", "delhi" , "Mumbai");

-- Ques-14 Find customers whose names start with 'A'.
select * from customers where customer_name like "A%";

-- Ques-15 Find products whose names contain 'Milk'.
select * from products where product_name like "%milk"; 


--          Intermediate SQL
-- Ques-16 Display products in ascending order of price.
select * from products order by  price desc;

-- Ques-17 Display products in descending order of price.
select * from products order by price desc;

-- Ques-18 Display the top 3 expensive products.
select * from products order by price desc limit 3;

-- Ques-19 Display the first 5 customers.
select * from customers limit 5;

-- Ques-20 Find customers whose email is NULL.
select * from customers where  email is NULL;

-- Ques-21 Find customers whose email is not NULL.
select * from customers where email is not null;

-- Ques-22 Insert a new customer.
 insert into customers values
(11, "Aditya Mishra", "city", "adityamish9001@gmail.com"),
(12, "sohan Mishra", "city", "adityamish9001@gmail.com"),
(13, "pRiya singh", "city", "adityamish9001@gmail.com");

-- Ques-23 Update the city of customer ID 1 to Lucknow.
update customers set city = "America" where customer_id = 1;

-- Ques-24 Update the price of product ID 103 to ₹70
update products set price =70 where product_id = 103;

-- Ques-25 Delete customer ID 11 
delete from customers where customer_id = 11;

--  Ques-26 Add a new column called phone_number.
alter table customers add phone_No varchar(50);
select * from customers;

-- Ques-27 Modify the customer_name column size to 150.
alter table customers modify customer_name varchar(150);

-- Ques-28 Remove the phone_number column.
alter table customers drop phone_no;

-- Ques-29 Find the total number of customers.
select count(*) from customers;

-- Ques-30 Find the total number of products.
select count(*) from products;

-- Ques-31 Find the highest product price.
select max(price) from products;

-- Ques-32 . Find the lowest product price.
select min(price) from products;

-- Ques-33 Find the average product price.
select avg(price) from products;

-- Ques-34 Find the total value of all product prices.
select sum(price) as Total_value from products;

-- Ques-35 Find the number of customers in each city.
select city , count(*) from customers  group by city;

-- Ques-36 . Find the number of orders for each order status.
select order_status , count(*) from orders group by order_status;

-- Ques-37 Find cities having more than one customer.
select city, count(*) from customers group by city having count(*) > 1;

-- Ques-38 . Find payment methods used in more than one order.
select payment_method , count(*) from orders group by payment_method having count(*) > 1;

-- Ques 39 Display customer names and their order IDs.
SELECT
    c.customer_name,
    o.order_id
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id;

-- Ques-40 Display product names with category names.
select products.product_name,
Categories.category_name 
from products
inner join categories 
on products.category_id = categories.category_id;

-- Ques-41 Display order ID, product name and quantity.
select * from orders;
select * from products;
select * from order_items;

select orders.order_id, 
products.product_id,
order_items.quantity
from orders_items
inner join products
on orders_items.product_id = products.product_id;

-- Ques- 42 Display all customers, including customers who have not placed orders.
SELECT
    c.customer_name,
    o.order_id
FROM Customers c
LEFT JOIN Orders o
ON c.customer_id = o.customer_id;

-- Ques-43 Find customers who have not placed any orders.
select customers.customer_name
 from customers 
left join orders on 
customers.customer_id = orders.customer_id
 where orders.order_id 
is null;

-- Ques-44  Display all products, including products that have never been ordered.
select products.product_name,
order_items. order_id from 
order_items right join products
on order_items.product_id = products.product_id

-- Ques 45 Display customer name, order ID, product name and quantity.

SELECT c.customer_name, o.order_id, p.product_name, oi.quantity
FROM Customers c
INNER JOIN Orders o
ON c.customer_id = o.customer_id
INNER JOIN Order_Items oi
ON o.order_id = oi.order_id
INNER JOIN Products p
ON oi.product_id = p.product_id;


-- Ques 46 Display customer name, product name and category name.
SELECT
    c.customer_name,
    p.product_name,
    cat.category_name
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
JOIN Categories cat
ON p.category_id = cat.category_id;

-- Ques 47 Display all delivered orders with customer names and product names.
SELECT
    c.customer_name,
    o.order_id,
    p.product_name
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
WHERE o.order_status = 'Delivered';

-- Ques 48 Find total product quantity purchased by each customer.
SELECT
    c.customer_name,
    SUM(oi.quantity) AS total_quantity
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Order_Items oi
ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;

-- Ques 49 Find the total revenue generated by each product.
SELECT
    p.product_name,
    SUM(p.price * oi.quantity) AS total_revenue
FROM Products p
JOIN Order_Items oi
ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;


-- Ques-50 Find total sales generated by each city.
SELECT
    c.city,
    SUM(p.price * oi.quantity) AS total_sales
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
JOIN Order_Items oi
ON o.order_id = oi.order_id
JOIN Products p
ON oi.product_id = p.product_id
GROUP BY c.city;