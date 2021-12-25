package uuu.blackcake.test;

import java.time.LocalDate;

import uuu.blackcake.entity.Product;

public class ProductRunner {

	public static void main(String[] args) {
		Product product = new Product();
		product.setId(1);
		product.setName("一號");
		product.setSize("大");
		product.setUnitPrice(100);
		product.setStock(3);
		product.setPhotoUrl("https://i2.momoshop.com.tw/1626948065/goodsimg/0009/140/702/9140702_R.webp");
		product.setDescription("商品介紹");
		product.setShelfDate(LocalDate.now());
		
		
//		System.out.println("ID:"+product.getId());
//		System.out.println("Name: "+product.getName());
//		System.out.println("Size: "+product.getSize());
//		System.out.println("Stock:"+product.getStock());
//		System.out.println("PhotoUrl: "+product.getPhotoUrl());
//		System.out.println("ShelfDate: "+product.getShelfDate());
//		System.out.println("Descripiton: "+product.getDescription());
//		System.out.println("UnitPrice: "+product.getUnitPrice());
//		System.out.println("Discount: "+product.getUnitDiscount()+"折");
		
		System.out.println(product.toString());
	}

}
