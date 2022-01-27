package uuu.blackcake.test;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.entity.VIP;

public class TestInstanceof {

	public static void main(String[] args) {
		Object o = new Object();
		Customer c = new Customer();
		VIP v = new VIP();
		
		System.out.println(o instanceof Object);//true
		System.out.println(c instanceof Object);//true
		System.out.println(v instanceof Object);//true
		
		System.out.println(o instanceof Customer);//false
		System.out.println(c instanceof Customer);//true
		System.out.println(v instanceof Customer);//true
		
		System.out.println(o instanceof VIP);//false
		System.out.println(c instanceof VIP);//false
		System.out.println(v instanceof VIP);//true
		
		System.out.println(o instanceof String);//true
		//System.out.println(c instanceof String);//compile-time error
		//System.out.println(v instanceof String);//compile-time error
		
		Object o1 =null;
		Customer c1 =null;
		VIP v1 =null;
		System.out.println(o1 instanceof Object);//false
		System.out.println(c1 instanceof Object);//false
		System.out.println(v1 instanceof Object);//false
	}

}
