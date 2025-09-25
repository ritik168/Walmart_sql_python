-- create table in postgresql


create table walmart
(
  invoice_id numeric primary key,
  Branch varchar(20),
  City	varchar(25),
  category varchar(25),
  unit_price varchar(10),
  quantity numeric,
  date date,
  time time,
  payment_method varchar(20),
  rating numeric,
  profit_margin float

);


select * from walmart

-- Data Loadings

drop table walmart

select * from walmart

select count(*) from walmart

select payment_method,count(*) from walmart
group by payment_method
select count(distinct branch ) from walmart


select max(quantity) from walmart


-- Business Problem

-- Q.1 Find different payment method and number of transction , number of quantity sold.

select * from walmart 

select  payment_method,count(*) as no_payments,sum(quantity) as no_qty_sold
from walmart
group by payment_method

-- Q.2 identified the highest_rated in each branch,displaying the branch,category
-- Avg Rating

select * from walmart
select branch,count(*) ,avg(rating) as highest_rated,
rank() over (partition by branch order by avg(rating) desc) as rank
from walmart
group by branch,category


-- Q.3 Identify the busiest day for each branch based on the number of transaction?

select * from walmart


select extract(day from date) as busiest_day,branch,count(*) as no_transactions
from walmart
group by branch,date


-- Q,4 Calculate the total number of items sold per payment methodand tota;l quantity?

select * from walmart
select payment_method,count(*) as no_payments,sum(quantity) as no_qty_sold
from walmart
group by payment_method


-- Q.5 Determine the average ,minimum,maximum rating of products for each city
-- List the city,average_ating,min_rating,max_rating.


select * from walmart
select avg(rating) as avg_rating,max(rating) as max_rating,min(rating) as min_rating,category,city
from walmart
group by category,city


--Q.6 calculate the total profit  for each category by considering total_profit as 
-- unit price* quantity*profit margin
-- List category and total profit order from highest to lowest profit.

select * from walmart

select category,
sum(total) as total_revenue,
sum(total * profit_margin) as profit
from walmart
group by 1

-- Q.7 Determine the most common payment method for each branch
-- Display branch and preferred_payment meyhod.

select * from walmart
select payment_method,branch ,count(*) as total_trans,
rank() over(partition by branch order by count(*) desc) as rank 
from walmart
group by 1,2
