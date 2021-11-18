package uuu.vgb.test;

import java.time.LocalDate;

import uuu.vgb.entity.Product;

public class ProductRunner2 {

	public static void main(String[] args) {
		Product product1 = new Product(2,"商品",100,20);
		product1.setStock(10);
		//product1.setUnitDiscount(15);
		product1.setShelfDate(LocalDate.now());
		
		
	
		
//		
//		System.out.println("ID:"+product1.getId());
//		System.out.println("Name: "+product1.getName());
//		System.out.println("Size: "+product1.getSize());
//		System.out.println("Stock:"+product1.getStock());
//		System.out.println("PhotoUrl: "+product1.getPhotoUrl());
//		System.out.println("ShelfDate: "+product1.getShelfDate());
//		System.out.println("Descripiton: "+product1.getDescription());
//		System.out.println("UnitPrice: "+product1.getUnitPrice());
//		System.out.println("Discount: "+product1.getUnitDiscount()+"折");
		
		System.out.println(product1.toString());
	}

}
