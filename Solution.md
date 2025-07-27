# 🍣 Danny's Diner – Case Study Solutions

Welcome to the solution write-up for the **Danny’s Diner** case study. This project explores customer behavior using SQL queries to extract insights from sales data.

We’ll walk through each question with the associated query and result set.

---

## 📌 Case Study Questions

1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What is the total items and amount spent for each member before they became a member?
9. If each $1 spent = 10 points and sushi has a 2x multiplier, how many points would each customer have?
10. In the first week after a customer joins, they earn 2x points on all items. How many points do customers A and B have at the end of January?

---

## ✅ Solutions

### 1. What is the total amount each customer spent at the restaurant?

```sql
WITH product_spend AS (SELECT customer_id, s.product_id, price * COUNT(s.product_id) AS spend
		       FROM sales s
		       INNER JOIN menu m
		       ON s.product_id = m.product_id
		       GROUP BY customer_id, s.product_id, price)

SELECT customer_id, SUM(spend) AS total_spend
FROM product_spend
GROUP BY customer_id
ORDER BY customer_id;
```

**Result set:**

| customer_id | total_sales |
|-------------|-------------|
| A           | 76          |
| B           | 74          |
| C           | 36          |

---

### 2. How many days has each customer visited the restaurant?

```sql
SELECT customer_id, COUNT(DISTINCT order_date) AS num_visits
FROM sales
GROUP BY customer_id;
```

**Result set:**

| customer_id | num_visits  |
|-------------|-------------|
| A           | 4           |
| B           | 6           |
| C           | 2           |

---

### 3. What was the first item from the menu purchased by each customer?

```sql
WITH ranked_orders AS (SELECT customer_id, product_id, order_date,
			      RANK() OVER(PARTITION BY customer_id ORDER BY order_date) AS earliest_order_rank
			      FROM sales)

SELECT 		r.customer_id, m.product_name
FROM   		ranked_orders r
INNER JOIN  	menu m
ON 		r.product_id = m.product_id
WHERE		r.earliest_order_rank = 1
ORDER BY 	customer_id;
```

**Result set:**

| customer_id | product_name |
|-------------|--------------|
| A           | curry        |
| A           | sushi        |
| B           | curry        |
| C           | ramen        |




