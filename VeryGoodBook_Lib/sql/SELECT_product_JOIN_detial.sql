/*檢視訂單明細*/
SELECT orders.id, member_id, created_date, created_time,
 receipt_name, receipt_email, receipt_phone, shipping_addres,
 payment_type, payment_fee, payment_note, shipping_type,
 shipping_fee, shipping_note, status 
 order_id, order_items.product_id, product.name, product.name as product_name,product.photo_url,
 order_items.size_name, products_sizes.size_name as p_size_name,
 products_sizes.photo_url as size_photo,
 spicy, price, quantity
 FROM orders JOIN order_items ON order_id=order_items.order_id
			JOIN  product ON order_items.product_id = product.id
				LEFT JOIN products_sizes ON order_items.product_id=products_sizes.product_id
                AND order_items.size_name = products_sizes.size_name
WHERE member_id='jimmy@gmail.com' AND orders.id='2';