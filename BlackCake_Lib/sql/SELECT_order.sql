SELECT id,member_id, created_date, created_time,
 receipt_name, receipt_email, receipt_phone, shipping_addres,
 payment_type, payment_fee, payment_note, shipping_type,
 shipping_fee, shipping_note, status,
 product_id, size_name, price, quantity, price*quantity
FROM orders LEFT JOIN order_items ON id=order_id
WHERE member_id='jimmy@gmail.com';

/*讓訂單排序以最新日期排序*/
SELECT id,member_id, created_date, created_time,
 receipt_name, receipt_email, receipt_phone, shipping_addres,
 payment_type, payment_fee, payment_note, shipping_type,
 shipping_fee, shipping_note, status
FROM orders
WHERE member_id='jimmy@gmail.com'
GROUP BY orders.id ORDER BY  created_date DESC, created_time DESC;

/*檢視訂單明細*/
SELECT orders.id, member_id, created_date, created_time,
 order_id, order_items.product_id, product.name, product.photo_url, products_sizes.photo_url as size_photo,
 spicy, price, quantity,
 receipt_name, receipt_email, receipt_phone, shipping_addres,
 payment_type, payment_fee, payment_note, shipping_type,
 shipping_fee, shipping_note, status 
FROM orders JOIN order_items ON order_id=order_items.order_id
			JOIN  product ON order_items.product_id = product.id
				LEFT JOIN products_sizes ON order_items.product_id=products_sizes.product_id
                AND order_items.size_name = products_sizes.size_name
WHERE member_id='jimmy@gmail.com' AND orders.id='2';