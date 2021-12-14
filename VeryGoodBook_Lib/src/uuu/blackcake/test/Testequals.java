package uuu.blackcake.test;

import java.text.NumberFormat;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.entity.Outlet;
import uuu.blackcake.entity.Product;
import uuu.blackcake.entity.VIP;

public class Testequals {

	public static void main(String[] args) {
		int i =1;
		double j = 1.0;
		Object o = new Object();
		VIP v = new VIP();
//		v= (VIP)o; 向下轉型會造成runtime error;
		NumberFormat floatingPointFormat = NumberFormat.getInstance();
		System.out.println(floatingPointFormat.getClass().getName());//DecimalFormat
		
		System.out.print("i+j:");
		System.out.println(i==j);//true
		System.out.print("true==false:");
		System.out.println(true==false);//false
		
		String s1 = "Hello";
		String s2 = new String("hello");
		System.out.print("s1==s2:");
		System.out.println(s1==s2);//false
		System.out.print("s1.equals(s2):");
		System.out.println(s1.equalsIgnoreCase(s2));//true
		
		System.out.print("s1==s2:");
		System.out.println(s1==s2);
		
		Customer c1 = new Customer("A123456789","Jimmy","aa12345");
		Customer c2 = new Customer("A123456789","jimmy","aa12345");
		System.out.print("c1==c2:");
		System.out.println(c1==c2);
		System.out.print("c1.equals(c2):");
		System.out.println(c1.equals(c2));
		c2=c1;
		System.out.print("c1==c2:");
		System.out.println(c1==c2);
		
		Product p1 =new Product(1,"Java", 500);
		Product p2 =new Outlet(1,"Java", 500);
		System.out.println("p1==p2: "+(p1==p2));
		System.out.println("p1.eqlaus(p2): "+(p1.equals(p2)));
		
		
		
	}

}
