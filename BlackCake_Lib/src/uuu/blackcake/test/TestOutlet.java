package uuu.blackcake.test;

import java.time.LocalDate;

import uuu.blackcake.entity.Outlet;

public class TestOutlet {

	public static void main(String[] args) {
		Outlet outlet = new Outlet();
		outlet.setId(1);
		outlet.setName("水壺");
		outlet.setUnitPrice(200);//設定 定/售價
		outlet.setStock(25);
		outlet.setPhotoUrl("https://im1.book.com.tw/image/getImage?i=https://www.books.com.tw/img/N01/180/02/N011800270.jpg&v=5ef08fe4&w=348&h=348");
		outlet.setUnitDiscount(20);
		outlet.setDescription("快煮壺");
		outlet.setShelfDate(LocalDate.now());
		
		System.out.println("產品代號:" +outlet.getId());
		System.out.println("產品名稱"+outlet.getName());
		System.out.println("庫存數量:"+outlet.getStock());
		System.out.println("圖片網址:"+outlet.getPhotoUrl());
		System.out.println("折扣:"+outlet.getUnitDiscount()+"% Off");
		System.out.println("折扣:"+outlet.getDiscountString());
		System.out.println("定價:"+outlet.getListPrice());
		System.out.println("售價:"+outlet.getUnitPrice());
		System.out.println("產品敘述:"+outlet.getDescription());
		System.out.println("上假日期:"+outlet.getShelfDate());
	}

}
