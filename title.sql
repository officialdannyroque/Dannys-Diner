## 1. What is the total amount each customer spent at the restaurant?

```sql
SELECT customer_id,
       SUM(price) AS total_sales
FROM dannys_diner.menu
INNER JOIN dannys_diner.sales USING(product_id)
GROUP BY 1
ORDER BY 1;
