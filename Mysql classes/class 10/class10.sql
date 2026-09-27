use upgrade;
select * from customer_data;
select * from order_data;

## Basic SELECT, WHERE Clause & Filtering (8 Questions)
-- 1.	Retrieve all columns for customers who are older than 60 years
select * from customer_data where age > 60;

-- 2.	Find all orders where Ship Mode is 'First Class' or 'Same Day'.
select * from order_data where `ship mode` in('first class','same day');

-- 3.	List customers whose Location is 'California' or 'New York' and have Subscription Status = 'Yes'.
select `customer id`,location,`subscription status`  from customer_data where location in('california','new york') and `subscription status` = 'yes' ;

-- 4.	Find all orders placed in 2023 (use Order Date).

select * from order_data where `order date`like '%2023';
ALTER TABLE order_data MODIFY COLUMN `order date` DATE;
UPDATE order_data SET `order date` = STR_TO_DATE(`order date`, '%d-%m-%Y');
ALTER TABLE order_data MODIFY COLUMN `order date` DATE;
select * from order_data where year(`order date`) = '2023';

-- 5.	Retrieve customers with Review Rating greater than or equal to 4.5.
select `customer id`,`review rating` from customer_data where `review rating`>= 4.5;

-- 6. find orders where Discount Percent > 4 and Quantity > 5.
select * from order_data where `Discount Percent` > 4 and `Quantity` > 5;

-- 7.	List all female customers who made a Purchase Amount (USD) greater than 100.

select * from customer_data where gender='female' and `Purchase Amount (USD)`>100;

-- 8.	Find orders where Segment is 'Consumer' and Category is 'Technology'.
select * from order_data where Segment='consumer' and category ='technology';

## 2. Aggregate Functions (COUNT, SUM, AVG, MIN, MAX) (8 Questions)

-- 1.	Count the total number of customers in the dataset.
select distinct count(`customer id`) over ()  as count_cusstomer from customer_data;

-- 2.	Calculate the total revenue (List Price * Quantity) across all orders.
select `list price`*quantity as total_revenue from order_data;

-- 3.	Find the average Review Rating of all customers.
select  distinct avg(`review rating`) over() as avg_rating from customer_data ;


