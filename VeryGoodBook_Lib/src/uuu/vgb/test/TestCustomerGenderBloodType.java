package uuu.vgb.test;

import uuu.vgb.entity.BloodType;
import uuu.vgb.entity.Customer;

public class TestCustomerGenderBloodType {

	public static void main(String[] args) {
		Customer c1 = new Customer("A123456789", "Jimmy",
				"aa12345", "aaa@gmail.com");
		
		c1.setGender(Customer.MALE);
		c1.setBloodtype(BloodType.A);
		System.out.println(c1.getGender());
		
		System.out.println(c1.getBloodtype());
		System.out.println(c1.getBloodtype().ordinal());
		
//		System.out.print(BloodType.O.ordinal());
//		System.out.println("O: "+BloodType.O.name());
//		System.out.print(BloodType.A.ordinal());
//		System.out.println("A: "+BloodType.A.name());
//		System.out.print(BloodType.B.ordinal());
//		System.out.println("B: "+BloodType.B.name());
//		System.out.print(BloodType.AB.ordinal());
//		System.out.println("AB: "+BloodType.AB.name());
//		//for(BloodType bType:BloodType.value()){
		for(int i=0;i<BloodType.values().length;i++) {
			BloodType bType = BloodType.values()[i];
			System.out.println(bType.toString());
		}
	}
}
