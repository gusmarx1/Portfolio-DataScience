USE brazilian_ecommerce_data;

CREATE TABLE category_name (
  product_category_name VARCHAR(255) PRIMARY KEY,
  product_category_name_english VARCHAR(255)
);
CREATE TABLE customers  (
  customer_id VARCHAR(50) PRIMARY KEY,
  customer_unique_id VARCHAR(50),
  customer_zip_code_prefix INTEGER,
  customer_city VARCHAR(255),
  customer_state VARCHAR(2)
);
CREATE TABLE sellers (
  seller_id  VARCHAR(50) PRIMARY KEY,
  seller_zip_code_prefix INTEGER,
  seller_city VARCHAR(255),
  seller_state VARCHAR(2)
);
CREATE TABLE products (
  product_id VARCHAR(50) PRIMARY KEY,
  product_category_name VARCHAR(255),
  product_name_lenght INTEGER,
  product_description_lenght INTEGER,
  product_photos_qty INTEGER,
  product_weight_g DECIMAL(10,2),
  product_length_cm DECIMAL(10,2),
  product_height_cm DECIMAL(10,2),
  product_width_cm DECIMAL(10,2),
  FOREIGN KEY (product_category_name) REFERENCES category_name(product_category_name)
);
CREATE TABLE orders (
  order_id  VARCHAR(50) PRIMARY KEY,
  customer_id VARCHAR(50),
  order_status INTEGER,
  order_purchase_timestamp DATETIME,
  order_approved_at	DATETIME,
  order_delivered_carrier_date DATETIME,
  order_delivered_customer_date DATETIME,
  order_estimated_delivery_date DATETIME,
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
  order_id VARCHAR(50),
  order_item_id INTEGER,
  product_id VARCHAR(50),
  seller_id VARCHAR(50),
  shipping_limit_date DATETIME,
  price DECIMAL(10,2),
  freight_value DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(order_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id),
  FOREIGN KEY (seller_id) REFERENCES sellers(seller_id),
  PRIMARY KEY (order_id, order_item_id)
);
CREATE TABLE order_payments (
  order_id  VARCHAR(50),
  payment_sequential INTEGER,
  payment_type VARCHAR(255),
  payment_installments INTEGER,
  payment_value DECIMAL(10,2),
  PRIMARY KEY (order_id, payment_sequential),
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
CREATE TABLE order_review (
  review_id  VARCHAR(50) PRIMARY KEY,
  order_id VARCHAR(50),
  review_score INTEGER,
  review_comment_title TEXT,
  review_comment_message TEXT,
  review_creation_date DATETIME,
  review_answer_timestamp DATETIME,
  FOREIGN KEY (order_id) REFERENCES orders(order_id)
);
