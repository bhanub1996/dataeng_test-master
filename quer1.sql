select cust_name, sum(price) as cust_spending from sales group by cust_name;