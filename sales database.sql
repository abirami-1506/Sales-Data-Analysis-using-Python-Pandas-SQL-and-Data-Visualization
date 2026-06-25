*/
=================================================
SALES DATA ANALYSIS USING SQL
=================================================

Project Objective:
Analyze sales data to identify sales performance,
regional trends, category-wise revenue, and key
business insights.

Operations Performed:
1. Database Creation
2. Table Creation
3. Data Import and Validation
4. Data Exploration
5. Total Sales Analysis
6. Region-wise Sales Analysis
7. Category-wise Performance Analysis
8. Product Performance Analysis
9. Revenue Calculation
10. Business Insights Generation

Key SQL Concepts Used:
- SELECT
- WHERE
- GROUP BY
- ORDER BY
- SUM()
- COUNT()
- AVG()
- Aggregate Functions

Outcome:
Generated meaningful insights from sales data to
support business decision-making.
================================================
/*



create database sales_db;
use sales_db;

create table sales (order_id int,
customer_name varchar(100),
order_date date,
category varchar(50),
sub_category varchar(50),
product_name varchar(50),
quantity int,
unit_price int,
total int,
region varchar(50));
 
 #select
 select * from sales limit 15;
 
select customer_name,category,sub_category,product_name,unit_price from sales;

 #COUNT
  select count(*) from sales;
  select count(*) from sales where region='south';
 
 #WHERE
 select * from sales where region='south';
 select customer_name,category,sub_category,product_name,unit_price,total from sales where total>5000;
 select * from sales where category='clothing';
 
 #ORDER BY
 select * from sales order by total;
 select * from sales order by total desc ;
 
 #GROUP BY
 select region,sum(total) as total_sales from sales group by region;
 select category,sum(quantity) as total_quantity from sales group by category;
 
 #AGGREGATE FUNCTIONS
 
 #SUM
 select sum(total) as total_sales from sales;
 
 #AVG
 select avg(unit_price) as avg_unit_price from sales;
 
 #MAX & MIN
 select max(total) as hightest_total from sales;
 select min(total) as lowest_total from sales;
select region,avg(total) as avg_sales from sales group by region order by avg_sales desc;

#TOP CUSTOMER
select customer_name,sum(total) as total_sales from sales group by customer_name order by total_sales desc limit 1;

#SUB QUERIES

#HIGHEST SALES:
select* from sales where total =(select max(total) from sales);

# CUSTOMER WITH TOTAL SALES ABOVE  10000:
SELECT customer_name, SUM(total) AS total_sales FROM sales GROUP BY customer_name HAVING SUM(total) > ( SELECT AVG(total) FROM sales);

select customer_name,sum(total) as total_sales from sales 
group by customer_name having sum(total)>
(select avg(total) from sales);


#JOINS
 create table customers(
 customer_name varchar(100),
 city varchar(50),
 age int);
 
insert into customers values
('Lynn Garrison','Texas',32),
('Misty Herrera','Nashvile',29),
('Angela Rivera','Florida',39),
('Debbie Turner','California',47),
('Roy Stewart','Florida',45),
('David Norris','Toranto',35);
select* from customers;

#INNER JOIN
select s.customer_name,s.total,c.city from sales s join customers c 
on s.customer_name=c.customer_name;

#LEFT JOIN
select s.customer_name,s.total,c.city from sales s left join customers c on s.customer_name=c.customer_name;

#RIGHT JOIN
select s.customer_name,s.total,c.city from sales s right join customers c on s.customer_name=c.customer_name;

#RANK()
select customer_name,total,rank() over (order by total desc) as sales_rank from sales;

#ROW NUMBER()
select customer_name,total,row_number() over (order by total desc) as 
sales_row_num from sales;

#CASE
select customer_name,total,case 
when total >=10000 then 'high'
 when total>=5000 then 'mid'
 else 'low' 
 end as sales_case from sales;
 
