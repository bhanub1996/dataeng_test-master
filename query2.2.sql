 #Find out the top 3 car manufacturers that customers bought by sales numbers in the current month
select count(*) as sales_count, car_manufacturer from sales WHERE DATE_PART('month',date) = DATE_PART('month',now()) and DATE_PART('year',date) = DATE_PART('year',now()) GROUP BY car_manufacturer ORDER BY sales_count limit 3;




