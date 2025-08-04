USE brazilian_ecommerce_data;
# 1° Leva
#1 - Mostrando todos os valores onde o status é igual a 'delivered'
SELECT * FROM orders WHERE orders.order_status = "delivered" ORDER BY orders.order_delivered_customer_date;

#2 - Mostrando quais status temos
SELECT DISTINCT order_Status FROM orders ORDER BY order_status;

#3 - Contando a quantidade de vezes que cada status aparece
SELECT order_status, COUNT(*) AS contagem FROM orders GROUP BY order_status ORDER BY contagem DESC;

#4 - Trazendo o valor médio de cada vendedor + quantidade de vezes que vendeu algum produto 
SELECT seller_id, AVG(price) AS valor_medio, COUNT(*) AS qtde_vendida 
FROM order_items 
GROUP BY seller_id 
ORDER BY valor_medio DESC;

#5 - Buscando informações com INNER JOIN
SELECT orders.order_id, customers.customer_id, customers.customer_unique_id
FROM orders INNER JOIN customers ON orders.customer_id = customers.customer_id 
ORDER BY order_id DESC;

#6 - Calculando o tempo médio de entrega por categoria de produto
SELECT products.product_category_name, AVG(DATEDIFF(orders.order_delivered_customer_date, orders.order_purchase_timestamp)) AS tempo_med 
FROM products 
INNER JOIN order_items ON products.product_id = order_items.product_id 
INNER JOIN orders ON order_items.order_id = orders.order_id
WHERE orders.order_status = 'delivered' AND orders.order_purchase_timestamp IS NOT NULL AND orders.order_delivered_customer_date IS NOT NULL
GROUP BY products.product_category_name 
ORDER BY tempo_med DESC; 

#2° Leva
#7 - Selecionar colunas específicas
SELECT products.product_id, products.product_category_name, products.product_weight_g
FROM products
ORDER BY products.product_weight_g DESC;

#8 - Filtros com múltiplas condições
SELECT order_review.review_score, order_review.review_comment_title, order_review.review_comment_message, order_review.review_creation_date
FROM order_review
WHERE order_review.review_score < 3 AND order_review.review_comment_message IS NOT NULL
ORDER BY order_review.review_score, order_review.review_creation_date DESC;

#9 - Agrupamento com média e contagem
SELECT order_review.review_score, COUNT(*) AS qtd_review, AVG(DATEDIFF(order_review.review_answer_timestamp, order_review.review_creation_date)) AS mean_answer
FROM order_review 
GROUP BY order_review.review_score
ORDER BY qtd_review DESC;

#10 - Média de frete por tipo de envio
SELECT DATE(order_items.shipping_limit_date) AS date_limit, AVG(order_items.freight_value) AS mean_freight, COUNT(*) AS total_orders
FROM order_items
GROUP BY DATE(order_items.shipping_limit_date)
ORDER BY date_limit DESC;

#11 - INNER JOIN com seller e produtos
SELECT order_items.seller_id, order_items.product_id, products.product_category_name  
FROM order_items INNER JOIN products ON order_items.product_id = products.product_id
WHERE order_items.price > 300;

#12 - Tempo médio entre aprovação e entrega por estado
SELECT customers.customer_unique_id, SUM(order_items.price) AS total_value_spend
FROM  customers 
INNER JOIN orders ON customers.customer_id = orders.customer_id 
INNER JOIN order_items ON orders.order_id = order_items.order_id
GROUP BY customers.customer_unique_id
ORDER BY total_value_spend DESC
LIMIT 10; 

#3° Leva