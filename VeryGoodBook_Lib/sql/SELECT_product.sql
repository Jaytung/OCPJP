SELECT id, name, unit_price, stock, photo_url, description, size, shelf_date, unit_Discount FROM blackcake.product
WHERE name LIKE '%黑糖糕%' ;

SELECT id, name, unit_price, stock, photo_url, description, size, shelf_date, unit_Discount FROM blackcake.product
WHERE name LIKE '%xo%' ;

SELECT id, name, unit_price, stock, photo_url, description, size, shelf_date, unit_Discount FROM blackcake.product
WHERE name LIKE '%%' ;

SELECT id, name, unit_price, stock, photo_url, description, size, shelf_date, unit_Discount FROM blackcake.product
WHERE name LIKE '?' ;


 SELECT id, name, unit_price, stock, photo_url, description, size, shelf_date, unit_Discount FROM blackcake.product
WHERE name LIKE '?' OR description LIKE '?';

SELECT id, name, unit_price, stock, photo_url, description, size, shelf_date, unit_Discount FROM blackcake.product ORDER BY shelf_date DESC LIMIT 2;
SELECT id, name, unit_price, stock, photo_url, description, size, shelf_date, unit_Discount FROM blackcake.product ORDER BY shelf_date ASC LIMIT 3;

SELECT id, name, unit_price, stock, photo_url, description, size, shelf_date, unit_Discount FROM blackcake.product 
WHERE unit_price BETWEEN 100 AND 500 ORDER BY unit_price DESC;
