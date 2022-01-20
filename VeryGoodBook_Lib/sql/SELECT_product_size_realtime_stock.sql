/*查詢即時庫存*/    
SELECT id, IFNULL(IFNULL(products_sizes.size_name,products_spicy.size_name), '') as the_size_name,
    IFNULL(spicy_name, '') as spicy_name,	
    IFNULL(IFNULL(products_spicy.stock,products_sizes.stock),product.stock) as real_time_stock
	FROM product LEFT JOIN products_sizes ON product.id=products_sizes.product_id
		LEFT JOIN products_spicy ON product.id=products_spicy.product_id AND
			(products_sizes.size_name=products_spicy.size_name OR 
				products_sizes.size_name IS null AND products_spicy.size_name="")
    WHERE product.id=2 HAVING the_size_name='' AND spicy_name='大辣';
    
SELECT id, the_size_name, spicy_name, real_time_stock FROM blackcake.product_real_time_stock
	WHERE id=3 AND the_size_name='' AND spicy_name='大辣'; 