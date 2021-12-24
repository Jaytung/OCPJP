SELECT id, name, unit_price, stock, photh_url, description, size, shelf_date, unit_Discount FROM blackcake.product
WHERE name LIKE '%黑糖糕%' ;

SELECT id, name, unit_price, stock, photh_url, description, size, shelf_date, unit_Discount FROM blackcake.product
WHERE name LIKE '%xo%' ;

SELECT id, name, unit_price, stock, photh_url, description, size, shelf_date, unit_Discount FROM blackcake.product ORDER BY shelf_date DESC LIMIT 2;
SELECT id, name, unit_price, stock, photh_url, description, size, shelf_date, unit_Discount FROM blackcake.product ORDER BY shelf_date ASC LIMIT 3;