-- SUb query : Query inside another query
--sub query : outer query + operator + inner query
-- Find max sales
select max(sales) from superstore_sales;

-- find which customer is giving max sales
select * from superstore_sales
where sales = (select max(sales) from superstore_sales);

-- find which customer is giving min sales
select * from superstore_sales
where sales= (select min(sales) from superstore_sales);

-- find all the customers where sales is greater than avg_sales

select * from superstore_sales
where sales >(select avg(sales) from superstore_sales );

-- find the customer who is giving highest sales in west region
select * from superstore_sales
where sales = (select max(sales) from superstore_sales
	where region='West');

-- find all the customers who are giving highest sales in evry region
select * from superstore_sales
where (region,sales) in
(select region,max(sales) from superstore_sales group by region);

-- find only the count of above command
-- find all the customers who are giving highest sales in evry region
select count(*) from superstore_sales
where (region,sales) in
(select region,max(sales) from superstore_sales group by region);


-- find all the customers who are giving minimum sales in each category
select * from superstore_sales
where (category,sales) in 
(select category,min(sales) from superstore_sales group by category);


-- find all the customers except those getting max sales
select * from superstore_sales
where sales !=(select max(sales) from superstore_sales);

-- find all the customers except those who gave highest sales in every region
select * from superstore_sales
where (region,sales) not in 
(select region,max(sales) from superstore_sales
	group by region);