/*三個客戶同時下單
	買的剛好是同一個產品(id=1),(id=11, the_color_name='紫'), 
		(id=13, the_color_name='白', size_name='S'), (id=14, the_color_name='', size_name='L')*/    
SELECT * FROM blackcake.product_real_time_stock
	WHERE id IN (1, 2, 3, 4, 5); 

/*product stock*/    
UPDATE product SET stock=stock-3 WHERE stock>=3 AND id = 1;
UPDATE product SET stock=stock-2 WHERE stock>=2 AND id = 1;
UPDATE product SET stock=stock-1 WHERE stock>=1 AND id = 1;

/*size stock*/
UPDATE products_sizes SET stock=stock-3 WHERE stock>=3 AND product_id = 5 AND size_name='大盒' ;
UPDATE products_sizes SET stock=stock-2 WHERE stock>=2 AND product_id = 5 AND size_name='大盒' ;
UPDATE products_sizes SET stock=stock-1 WHERE stock>=1 AND product_id = 5 AND size_name='大盒' ;

/*spicy stock*/
UPDATE products_spicy SET stock=stock-3 WHERE stock>=3 AND product_id = 3 AND spicy_name='大辣' ;
UPDATE products_spicy SET stock=stock-2 WHERE stock>=2 AND product_id = 3 AND spicy_name='大辣' ;
UPDATE products_spicy SET stock=stock-1 WHERE stock>=1 AND product_id = 2 AND spicy_name='大辣' ;

/*如有大小加上辣度才用*/
UPDATE product_spicy SET stock=stock-3 WHERE stock>=3 AND product_id = 3 AND size_name='' AND spicy_name='大辣' ;
UPDATE product_spicy SET stock=stock-2 WHERE stock>=2 AND product_id = 3 AND size_name='' AND spicy_name='大辣' ;
UPDATE product_spicy SET stock=stock-1 WHERE stock>=1 AND product_id = 3 AND size_name='' AND spicy_name='大辣' ;