INSERT INTO orders 
(id, member_id, created_date, created_time, receipt_name,
 receipt_email, receipt_phone, shipping_addres, payment_type,
 payment_fee, shipping_type, shipping_fee, status) 
 VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?);
 
 INSERT INTO order_items
 (order_id, product_id, size_name, spicy, price, quantity)
 VALUES(?,?,?,?,?,?);