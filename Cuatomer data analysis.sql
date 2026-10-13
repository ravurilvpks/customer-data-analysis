use project_customer_segmentation;
select * from customer;
-- Query 1
-- How is the shopping distribution according to gender?
select 
gender, count(*) as total_transactions
from customer
group by gender;
-- Query 2
-- Which gender did we sell more products to?
select
gender,
sum(quantity) as total_products_sold
from customer group by gender
order by total_products_sold desc;
-- Query 3
-- Which gender generated more revenue?
select 
gender,
sum (revenue) as total_revenue
from customer 
group by gender
order by total_revenue;
-- Query 4
-- Distribution of purchase categories relative to other columns
-- Category-wise sales:
select category,
sum(quantity) as total_product_sold,
sum(revenue) as total_revenue
from customer group by category
order by total_revenue desc;
-- Category + Gender
select 
category,gender,
sum(quantity) as products_sold,
sum( revenue) as revenue
from customer group by category, gender 
order by category, revenue desc;
-- Query 5
-- How is the shopping distribution according to age?
select
  case 
      when age <20 then 'Under 20'
      when age between 20 and 29 then '20-29'
      when age between 30 and 39 then '30-39'
      when age between 40 and 49 then '40-49'
      when age between 50 and 59 then '50-59'
      else '60+'
      end as age_group,
      count(*) as total_tansactions
      from customer 
      group by age_group
      order by age_group;
-- Query 6
-- Which age category didi we sell more products to?
select
  case 
      when age <20 then 'Under 20'
      when age between 20 and 29 then '20-29'
      when age between 30 and 39 then '30-39'
      when age between 40 and 49 then '40-49'
      when age between 50 and 59 then '50-59'
      else '60+'
      end as age_group,
      sum(quantity) as total_products_sold
      from customer
      group by age_group 
      order by total_products_sold desc;
-- Query 7
-- Which age category generated more revenue?
select
  case 
      when age <20 then 'Under 20'
      when age between 20 and 29 then '20-29'
      when age between 30 and 39 then '30-39'
      when age between 40 and 49 then '40-49'
      when age between 50 and 59 then '50-59'
      else '60+'
      end as age_group,
      sum(revenue) as total_revenue
      from customer
      group by age_group
      order  by total_revenue desc;
-- Query 8
-- Distribution of purchase categories relative to other columnns
select
  case 
      when age <20 then 'Under 20'
      when age between 20 and 29 then '20-29'
      when age between 30 and 39 then '30-39'
      when age between 40 and 49 then '40-49'
      when age between 50 and 59 then '50-59'
      else '60+'
      end as age_group,
      category,
      sum(quantity) as products_sold,
      sum(revenue) as revenue
      from customer 
      group by age_group, category
      order by age_group, revenue desc;
-- Query 9
-- Does payment method have a relaytion with other columns?
-- Payment + Gender
select
   payment_method,
   gender,
   count(*) as transactions,
   sum(revenue) as revenue
   from customer 
   group  by payment_method, gender
   order by payment_method, revenue desc;
-- Payment + Category
select
   payment_method,
   category,
   count(*) as transactions,
   sum(revenue) as revenue
   from customer 
   group  by payment_method,category
   order by payment_method, revenue desc;
-- Query 10
-- How is the disribution of the payment method?
select 
   payment_method,
   count(*) as total_transactions
   from customer 
   group by payment_method
   order by total_transactions desc;