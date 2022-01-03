CREATE VIEW `black_cake_product` AS
SELECT id, name, unit_price, stock, photo_url, description, size, shelf_date, unit_Discount FROM blackcake.product
WHERE name LIKE '%黑糖糕%' ;