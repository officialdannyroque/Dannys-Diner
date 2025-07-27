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
SELECT 
    customer_id,
    SUM(price) AS total_sales
FROM dannys_diner.menu
INNER JOIN dannys_diner.sales
USING (product_id)
GROUP BY customer_id
ORDER BY customer_id;

**Result:**

| customer_id | total_sales |
|-------------|-------------|
| A           | 76          |
| B           | 74          |
| C           | 36          |



