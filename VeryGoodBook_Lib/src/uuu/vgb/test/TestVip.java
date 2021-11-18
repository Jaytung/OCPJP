package uuu.vgb.test;

import uuu.vgb.entity.VIP;

public class TestVip {

	public static void main(String[] args) {
		VIP vip = new VIP();
		vip.setId("A123456789");
		vip.setName(" Louis   ");
		vip.setEmail("Louis@gmail.com");
		vip.setPassword("sadwa1114");
		vip.setBirthday(1965, 10, 5);
		vip.setGender('M');
		vip.setAddress("台北市敦化北路166");
		vip.setPhone("0955663215");
		vip.setSubscribed(true);
		vip.setDiscount(26);
		
//		System.out.println(vip.getId());
//		System.out.println(vip.getName());
//		System.out.println(vip.getDiscount()+"% Off");
//		System.out.println(vip.getDiscountString());
		System.out.println(vip.toString());		
	}

}
