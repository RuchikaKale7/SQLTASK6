-----table 1 
CREATE table customer (
customer_id int primary key,
   customer_name varchar(50)
   ) 
select * from customer
 
----table 2	
CREATE table order1 (
order_id int primary key,
order_date date,
order_total_amount int	
   )

select * from order1

----table 3
CREATE table order_item (
order_item_id int primary key,
order_product_id int ,
order_item_quantity int,
order_item_price int
)
select * from order_item

----insert values in customer table
	insert into customer (customer_id, customer_name) values (1, 'Ruchika'),(2,'Samruddhi');
	insert into customer (customer_id, customer_name) values(3,'Sayali'),(4,'Vishal'),(5,'Tejas');
----insert values in order1 tbale    
	insert into order1 (order_id,order_date,order_total_amount ) values(2,'07-04-2001',90000 ),(3,'04-04-2000',80000),(4,'27-12-2004',50000),(6,'02-10-2000',60000),(7,'11-03-2011',30000);
----insert values in order_item
    insert into order_item (order_item_id ,order_product_id ,order_item_quantity ,order_item_price) values (1,101,40,400),(4,102,50,200),(8,103,60,300),(9,104,30,350),(10,105,20,450);
select * from customer as c
select * from order1 as o
select * from order_item as oi
	
-- 1. Join to Get All Order Details Including Customer Name
SELECT c.customer_name, o.order_id, o.order_date, o.order_total_amount
FROM customer c
JOIN order1 o ON c.customer_id = o.order_id;

-- 2. Join to Get Order Items with Customer and Order Details
SELECT c.customer_name, o.order_id, o.order_date, oi.order_product_id, oi.order_item_quantity, oi.order_item_price
FROM customer c
JOIN order1 o ON c.customer_id = o.order_id
JOIN order_item oi ON o.order_id = oi.order_item_id;

-- 3. Calculate Total Amount Spent by Each Customer
SELECT c.customer_name, SUM(o.order_total_amount) AS total_spent
FROM customer c
JOIN order1 o ON c.customer_id = o.order_id
GROUP BY c.customer_name;

-- 4. Get Customers Who Have Placed Orders with More Than 2 Items
SELECT c.customer_name, COUNT(oi.order_item_id) AS items_ordered
FROM customer c
JOIN order1 o ON c.customer_id = o.order_id
JOIN order_item oi ON o.order_id = oi.order_item_id
GROUP BY c.customer_name
HAVING COUNT(oi.order_item_id) > 10;

-- 5. List All Products Ordered by Each Customer
SELECT c.customer_name, oi.order_product_id
FROM customer c
JOIN order1 o ON c.customer_id = o.order_id
JOIN order_item oi ON o.order_id = oi.order_item_id
ORDER BY c.customer_name;

-- 6. Find Average Order Amount for Each Customer
SELECT c.customer_name, AVG(o.order_total_amount) AS avg_order_amount
FROM customer c
JOIN order1 o ON c.customer_id = o.order_id
GROUP BY c.customer_name;

----JOIN ALL THE TABLES
SELECT c.customer_id, c.customer_name,o.order_id,o.order_date,o.order_total_amount,oi.order_item_id ,oi.order_product_id ,oi.order_item_quantity ,oi.order_item_price
FROM customer c
FULL JOIN order1 o ON o.order_id = c.customer_id
FULL JOIN order_item oi ON o.order_id = oi.order_item_id;

