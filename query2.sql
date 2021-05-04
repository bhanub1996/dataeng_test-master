select count(car_manufacturer) as cnt from sales ORDER BY cnt limit 3;

select car_manufacture, sum(price) as Total_sales from sales WHERE MONTH(date) = MONTH(now()) and YEAR(date) = YEAR(now()) GROUP BY car_manufacture ORDER BY Total_sales LIMIT 3