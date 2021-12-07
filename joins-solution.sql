-- Tasks
-- 1. Get all customers and their addressess.
  SELECT * FROM "customers"
  JOIN "addresses"
  	ON "addresses"."customer_id"="customers"."id";
    
-- 2. Get all orders and their line items (orders, quantity and product).

SELECT "line_items"."order_id", "line_items"."product_id", "line_items"."quantity" 
FROM "line_items"
JOIN "orders" 
ON "line_items"."order_id"="orders"."id";

--3. Which warehouses have cheetos?
SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product"
ON "warehouse"."id"="warehouse_product"."warehouse_id"
WHERE "warehouse_product"."product_id"=5;

--4. Which warehouses have diet pepsi?
SELECT "warehouse" FROM "warehouse"
JOIN "warehouse_product"
ON "warehouse"."id"="warehouse_product"."warehouse_id"
WHERE "warehouse_product"."product_id"=6;

--5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT "customers".*, count(*) FROM "customers"
JOIN "addresses"
ON "customers"."id"="addresses"."customer_id"
JOIN "orders"
ON "addresses"."id"="orders"."address_id"
GROUP BY "customers"."id";

--6. How many customers do we have?
SELECT count(*) FROM "customers";

--7. How many products do we carry?
SELECT count(*) FROM "products";

--8. What is the total available on-hand quantity of diet pepsi?
SELECT sum("warehouse_product"."on_hand") FROM "warehouse_product"
JOIN "products"
ON "warehouse_product"."product_id"="products"."id"
WHERE "warehouse_product"."product_id"=6;
