# 📊 Data Dictionary — BigBasket SQL Analysis

This document explains the structure of the database used in the BigBasket SQL analysis project.

---

## **Table: customers**
| Column Name  | Data Type | Description |
|--------------|-----------|-------------|
| customer_id  | INT       | Unique ID for each customer |
| name         | TEXT      | Full name of the customer |
| city         | TEXT      | City where the customer is located |
| join_date    | TEXT      | Date when the customer joined the platform |

---

## **Table: orders**
| Column Name  | Data Type | Description |
|--------------|-----------|-------------|
| order_id     | INT       | Unique ID for each order |
| customer_id  | INT       | References `customers.customer_id` to identify who placed the order |
| product_id   | INT       | References `products.product_id` to identify which product was purchased |
| quantity     | INT       | Number of units purchased in the order |
| order_date   | TEXT      | Date when the order was placed |

---

## **Table: products**
| Column Name    | Data Type | Description |
|----------------|-----------|-------------|
| product_id     | INT       | Unique ID for each product |
| product        | TEXT      | Name of the product |
| category       | TEXT      | Main category of the product (e.g., Fruits, Beverages, Snacks) |
| sub_category   | TEXT      | More specific sub-category within the main category |
| brand          | TEXT      | Brand name of the product |
| sale_price     | DOUBLE    | Price at which the product is sold to customers |
| market_price   | DOUBLE    | Original market price before discounts |
| type           | TEXT      | Type or packaging information (e.g., Pack, Loose, Bottle) |
| rating         | DOUBLE    | Average customer rating for the product |
| description    | TEXT      | Short description of the product |

---

✅ **Note:**  
- Primary keys: `customer_id`, `order_id`, `product_id`  
- Foreign keys:  
  - `orders.customer_id` → `customers.customer_id`  
  - `orders.product_id` → `products.product_id`  
