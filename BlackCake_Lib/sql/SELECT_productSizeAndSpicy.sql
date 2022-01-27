/*left outter join 產品明細用*/
SELECT id, name, unit_price,  description, shelf_date, unit_Discount, category, brand, 
products_sizes.product_id, size_name,  icon_url, 
products_sizes.size_price AS size_price,
products_spicy.spicy_name AS spicy_name,
products_spicy.stock AS spicy_stock,
product.stock,products_sizes.stock AS size_stock,
product.photo_url,products_sizes.photo_url AS photo_url,
product.photo_url_1
FROM product 
	LEFT JOIN products_sizes ON product.id=product_id
		LEFT JOIN products_spicy ON product.id=products_spicy.product_id
WHERE  id= 1; 