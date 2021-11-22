package uuu.AC11.test;

import java.time.LocalDate;

import uuu.AC11.entity.MyStatic;

public class TestMyStatic {

	public static void main(String[] args) {
		System.out.println(MyStatic.getI());//0
		MyStatic.setI(100);
		
		MyStatic obj = new MyStatic();
		System.out.println(MyStatic.getI());//100
		System.out.println(obj.getJ()); //0
		
		MyStatic.setI(200);
		obj.setJ(250);
		MyStatic obj2 = new MyStatic();
		System.out.println(MyStatic.getI());//200
		System.out.println(obj2.getJ()); //0
		
		LocalDate today = null;
		System.out.println(String.valueOf(today));
		
		System.out.println(String.valueOf(LocalDate.now()));
		
		System.out.println(Math.random());//0~1的小數
		
		System.out.println(Math.round(0.5));//1
		System.out.println(Math.floor(0.55));//無條件捨去
		System.out.println(Math.ceil(0.25));//無條件進位
		
	}

}
