-- 	1. List all products with their sale price and category.
SELECT product,sale_price, category
FROM bproducts;

-- 	2. Find the total number of products in the dataset.
SELECT COUNT(*) AS total_products
FROM bproducts;

-- 	3. Show the product with the highest sale price.
SELECT product, sale_price
FROM bproducts
order by sale_price desc 
limit 1;

-- 	4. Find the average rating of all products.
SELECT AVG(rating) AS AVG_RATING
FROM bproducts;

-- 	5. Count how many unique categories are present.
SELECT COUNT(distinct category) AS dif_categories
FROM bproducts;


-- 	6. Show the total number of products in each category.
SELECT category , COUNT(*) AS total_products
FROM bproducts
GROUP BY category;

-- 	7. Calculate the average sale price for each brand.
SELECT brand , AVG(sale_price) AS avg_price
FROM bproducts
GROUP BY brand;

-- 	8. Find the total revenue for each category. (Revenue = quantity × sale_price)
SELECT t1.category, sum(t2.quantity * t1.sale_price) AS revenue
FROM products AS t1
JOIN orders AS T2
ON t1.product_id = t2.product_id
GROUP BY category
ORDER BY revenue desc;

-- 	9. List the top 5 customers who spent the most overall.
SELECT t3.name, sum(t2.quantity * t1.sale_price) AS overall_spent
FROM products AS t1
JOIN orders AS t2
ON t1.product_id = t2. product_id
JOIN customers AS t3
ON t2.customer_id = t3.customer_id
group by t3.name
order by overall_spent desc 
limit 5;

-- 	10. Find the average discount percentage for each category. 
SELECT category, avg((market_price - sale_price) / market_price * 100) AS avg_dis
FROM products
group by category
ORDER BY avg_dis desc;

-- 11. Find the best-selling product by total quantity sold.

SELECT t1.product, sum(quantity) AS total_quantity
FROM products t1
JOIN orders t2
on t1.product_id = t2.product_id
GROUP BY t1.product
ORDER BY total_quantity DESC
LIMIT 1;

-- 12. Show monthly sales revenue for the year 2025.

SELECT DATE_FORMAT(t2.order_date,'%Y-%m') AS MONTH , sum(t2.quantity * t1.sale_price) as total_revenue
FROM products AS t1
JOIN orders AS t2
ON t1.product_id = t2.product_id
WHERE year(t2.order_date) = '2025' 
GROUP BY MONTH
ORDER BY MONTH ASC;

-- 13. Products that have never been ordered
SELECT t1.product
FROM products t1
LEFT JOIN orders t2 
ON t1.product_id = t2.product_id
WHERE t2.order_id IS NULL;


-- 14. List the top 3 brands by total revenue.
SELECT t1.brand, sum(t2.quantity * t1.sale_price) AS total_revenue
FROM products AS t1
JOIN orders AS t2
ON t1.product_id = t2.product_id
GROUP BY t1.brand
ORDER BY total_revenue desc
LIMIT 3;

-- 15. Find customers who have ordered more than 5 unique products.

SELECT t2.name, t2.customer_id, COUNT(distinct t1.product_id) AS unique_products
FROM orders AS t1
JOIN customers AS t2
ON t1.customer_id = t2.customer_id
GROUP BY t2.name, t2.customer_id
having unique_products > '5' 
ORDER BY t2.customer_id asc;

-- 16. Identify the brand with the highest total revenue.

SELECT t1.brand, sum(t2.quantity * t1.sale_price) AS total_revenue
FROM products AS t1
JOIN orders AS t2
ON t1.product_id = t2.product_id
GROUP BY t1.brand
ORDER BY total_revenue DESC 
LIMIT 1;

-- 17. Show the highest-rated product in each category.

SELECT category , MAX(rating)
FROM products 
GROUP BY category ;

SELECT category,product,rating
FROM products t1
WHERE rating = (SELECT  MAX(rating)
				FROM products t2
				WHERE t2.category = t1.category ) ;


-- 18. Find the total revenue contributed by each city.
SELECT t3.city, sum(t2.quantity * t1.sale_price) AS total_revenue
FROM products AS t1
JOIN orders AS t2
ON t1.product_id = t2.product_id
JOIN customers AS t3
ON t2.customer_id = t3.customer_id
GROUP BY t3.city;

-- 19. Find the product(s) whose sale price is above the average sale priceof all products.

SELECT * 
FROM products 
WHERE sale_price > (SELECT AVG(sale_price)
					FROM products);
-- 20. Find customers whose total spending is above the average spending of all customers.

SELECT AVG(total) from (SELECT sum(t2.quantity * t1.sale_price) AS total
						FROM products AS t1
						JOIN orders AS t2
						ON t1.product_id = t2.product_id
						group by t2.customer_id) AS AVG;



SELECT t6.customer_id,t6.name, sum(t5.quantity * t4.sale_price) AS TOTAL_SPENDING
FROM products AS t4
JOIN orders AS t5
ON t4.product_id = t5.product_id
JOIN customers AS t6
ON t5.customer_id = t6.customer_id
GROUP BY t6.customer_id, t6.name
HAVING TOTAL_SPENDING >(SELECT AVG(TOTAL)
						FROM (SELECT sum(t2.quantity * t1.sale_price) AS total
								FROM products AS t1
								JOIN orders AS t2
								ON t1.product_id = t2.product_id
								group by t2.customer_id ) 
						AS AVG);

