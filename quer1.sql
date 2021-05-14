#I want to know the list of our customers and their spending
select customer_name, sum(price) as cust_spending from sales group by customer_name;