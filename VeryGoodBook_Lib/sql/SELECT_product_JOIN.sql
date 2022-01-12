/*cross join*/
SELECT id, name, unit_price, product.stock, product.photo_url, description, size, shelf_date, unit_Discount, category, brand,
product_id, size_name, products_sizes.photo_url, icon_url, products_sizes.stock
FROM product JOIN products_sizes WHERE  id in (1,5) ORDER BY id; 



/*for size inner join*/
SELECT id, name, unit_price, product.stock, product.photo_url, description, size, shelf_date, unit_Discount, category, brand,
product_id, size_name, icon_url, products_sizes.stock,
products_sizes.photo_url
FROM product JOIN products_sizes ON id=product_id
WHERE  id= 5; 


/*left outter join 產品明細用*/
SELECT id, name, unit_price,  description, size, shelf_date, unit_Discount, category, brand,
product_id, size_name,  icon_url, 
products_sizes.size_price as size_price,
product.stock,products_sizes.stock AS size_stock,
product.photo_url,products_sizes.photo_url AS photo_url
FROM product LEFT JOIN products_sizes ON product.id=product_id
WHERE  id= 5; 

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