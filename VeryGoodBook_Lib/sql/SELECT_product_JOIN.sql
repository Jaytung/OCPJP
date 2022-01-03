/*cross join*/
SELECT id, name, unit_price, product.stock, product.photo_url, description, size, shelf_date, unit_Discount, category, brand,
product_id, size_name, products_sizes.photo_url, icon_url, products_sizes.stock
FROM product JOIN products_sizes WHERE  id= 5; 



/*for size inner join*/
SELECT id, name, unit_price, product.stock, product.photo_url, description, size, shelf_date, unit_Discount, category, brand,
product_id, size_name, products_sizes.photo_url, icon_url, products_sizes.stock
FROM product JOIN products_sizes ON id=product_id
WHERE  id= 7; 


/*left outter join 產品明細用*/
SELECT id, name, unit_price, product.stock, product.photo_url, description, size, shelf_date, unit_Discount, category, brand,
product_id, size_name, products_sizes.photo_url, icon_url, products_sizes.stock
FROM product LEFT JOIN products_sizes ON id=product_id
WHERE  id= 1; 

/*right outter join*/
SELECT id, name, unit_price, product.stock, product.photo_url, description, size, shelf_date, unit_Discount, category, brand,
product_id, size_name, products_sizes.photo_url, icon_url, products_sizes.stock
FROM product RIGHT JOIN products_sizes ON id=product_id
WHERE  id= 5; 

/*mySQL not support full outter join*/
-- SELECT id, name, unit_price, product.stock, product.photo_url, description, size, shelf_date, unit_Discount, category, brand,
-- product_id, size_name, products_sizes.photo_url, icon_url, products_sizes.stock
-- FROM product FULL JOIN products_sizes ON id=product_id
-- WHERE  id= 7; 