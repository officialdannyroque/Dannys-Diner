WITH product_spend AS (SELECT customer_id, s.product_id, price * COUNT(s.product_id) AS spend
						FROM sales s
						INNER JOIN menu m
						ON s.product_id = m.product_id
						GROUP BY customer_id, s.product_id, price)


SELECT customer_id, SUM(spend) AS total_spend
FROM product_spend
GROUP BY customer_id
ORDER BY customer_id
