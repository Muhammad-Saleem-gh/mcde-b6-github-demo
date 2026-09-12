--Section 4 — GROUP BY & Aggregates

--Task 20: Product count per category
SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM production.products p
JOIN production.categories c ON p.category_id = c.category_id
GROUP BY c.category_name

--Task 21: Average list price per brand
SELECT b.brand_name, AVG(p.list_price) AS avg_price
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
GROUP BY b.brand_name;

--Task 22: Order count per store
SELECT st.store_name, COUNT(o.order_id) AS total_orders
FROM sales.orders o
JOIN sales.stores st ON o.store_id = st.store_id
GROUP BY st.store_name;

--Task 23: Total revenue per order
SELECT o.order_id,
       SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
GROUP BY o.order_id;

--Task 24: Customer order counts
SELECT CONCAT(c.first_name, ' ', c.last_name) AS customer_name,
       COUNT(o.order_id) AS order_count
FROM sales.customers c
JOIN sales.orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.first_name, c.last_name
ORDER BY order_count DESC;


--Task 25: Brand with highest average price
SELECT TOP 1 b.brand_name, AVG(p.list_price) AS avg_price
FROM production.products p
JOIN production.brands b ON p.brand_id = b.brand_id
GROUP BY b.brand_name
ORDER BY avg_price DESC;


--Task 26: Categories with >50 products
SELECT c.category_name, COUNT(p.product_id) AS product_count
FROM production.products p
JOIN production.categories c ON p.category_id = c.category_id
GROUP BY c.category_name
HAVING COUNT(p.product_id) > 50;


--Task 27: Store revenue across all orders
SELECT st.store_name,
       SUM(oi.quantity * oi.list_price * (1 - oi.discount)) AS total_revenue
FROM sales.orders o
JOIN sales.order_items oi ON o.order_id = oi.order_id
JOIN sales.stores st ON o.store_id = st.store_id
GROUP BY st.store_name;

--Task 28: Staff with >50  orders
SELECT CONCAT(s.first_name, ' ', s.last_name) AS staff_name,
       COUNT(o.order_id) AS handled_orders
FROM sales.staffs s
JOIN sales.orders o ON s.staff_id = o.staff_id
GROUP BY s.staff_id, s.first_name, s.last_name
HAVING COUNT(o.order_id) > 50;

