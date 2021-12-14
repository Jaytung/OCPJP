package uuu.blackcake.test;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.entity.Outlet;
import uuu.blackcake.entity.Product;

public class TestPolymorphism {

	public static void main(String[] args) {
		Object o = new Object();//正常
		String s = "Hello";//正常
		Object o1 = new String("Hey!");//多形
		
		System.out.println(o.toString());//java.lang.Object@7d6f77cc
		System.out.println(o.getClass().getSimpleName());//Object
		
		System.out.println(s.toString());//Hello
		System.out.println(s.getClass().getSimpleName());//String
		System.out.println(s.length());//5
		
		System.out.println(o1.toString());//Hey!
		System.out.println(o1.getClass().getSimpleName());//String
		System.out.println(((String)o1).length());
		
		o1 = new Customer("A123123123","Morris","aaa123456","skww@gmail.com");
		System.out.println(((Customer)o1).toString()+"\n");
		System.out.println(o1.toString());
		
		
		System.out.println(((Customer)o1).getId()); 
		
//		Product p = new Outlet(1,"水壺",500,15);
//			p.setUnitDiscount(30);
//			System.out.println("ID: "+p.getId());
//			System.out.println("名稱: "+p.getName());
//			System.out.println("售價: "+p.getUnitPrice());
//			System.out.println("定價: "+((Outlet)p).getListPrice());
//			System.out.println("折扣: "+((Outlet)p).getUnitPrice());
		
	}

}
