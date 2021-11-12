package uuu.vgb.test;

import java.time.LocalDate;

import uuu.vgb.entity.Product;

public class ProductRunner {

	public static void main(String[] args) {
		Product product = new Product();
		product.setId(0);
		product.setName("一號");
		product.setSize("大");
		product.setUnitDiscount(-25);
		product.setUnitPrice(-100);
		product.setStock(3);
		product.setPhotoUrl("https://i2.momoshop.com.tw/1626948065/goodsimg/0009/140/702/9140702_R.webp");
		product.setDescription("商品介紹");
		product.setShelfDate(LocalDate.now());
		
		
		System.out.println("ID:"+product.getId());
		System.out.println("Name: "+product.getName());
		System.out.println("Size: "+product.getSize());
		System.out.println("Stock:"+product.getStock());
		System.out.println("PhotoUrl: "+product.getPhotoUrl());
		System.out.println("ShelfDate: "+product.getShelfDate());
		System.out.println("Descripiton: "+product.getDescription());
		System.out.println("UnitPrice: "+product.getUnitPrice());
		System.out.println("Discount: "+product.getUnitDiscount()+"折");
	}

}
