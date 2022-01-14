SELECT id,member_id, created_date, created_time,
 receipt_name, receipt_email, receipt_phone, shipping_addres,
 payment_type, payment_fee, payment_note, shipping_type,
 shipping_fee, shipping_note, status,
 product_id, size_name, price, quantity, price*quantity
FROM orders LEFT JOIN order_items ON id=order_id
WHERE member_id='A138351488';

SELECT id,member_id, created_date, created_time,
 receipt_name, receipt_email, receipt_phone, shipping_addres,
 payment_type, payment_fee, payment_note, shipping_type,
 shipping_fee, shipping_note, status
FROM orders
WHERE member_id='A138351488';