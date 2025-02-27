select COUNT(sales) as no_sales, item, category 
from orders
group by item, category
order by category, no_sales;

SELECT category, COUNT(sales) as total_sales
FROM orders
GROUP BY category
ORDER BY category, total_sales;



SELECT category, COUNT(sales) as no_sales, 
       ROUND(SUM(sales), 2) as val_sales,
       round(val_sales/no_sales, 2) as price, item
FROM orders
GROUP BY category, item
ORDER BY category, no_sales;

## nu kigger vi på marketing kanaller
select category, sales, channel 
from orders
order by category
limit 50;

select channel, category, item, round(avg(sales), 2) as avg_sales
FROM orders
group by channel, category, item
order BY channel, category;

select DISTINCT channel from orders;
select DISTINCT channel_group from orders;