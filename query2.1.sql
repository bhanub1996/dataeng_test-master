# find out the top 3 car manufacturers that customers bought by sales(Total Amount/Revenue per manufacturer) in the current month
select car_manufacturer, sum(price) as Total_sales from sales WHERE DATE_PART('month',date) = DATE_PART('month',now()) and DATE_PART('year',date) = DATE_PART('year',now()) GROUP BY car_manufacturer ORDER BY Total_sales LIMIT 3

