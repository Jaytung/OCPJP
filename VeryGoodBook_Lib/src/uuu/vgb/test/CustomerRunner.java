package uuu.vgb.test;

import uuu.vgb.entity.Customer;

public class CustomerRunner {

	public static void main(String[] args) {
		int i = 1;
		
		Customer customer = new Customer();
		customer.setId("A123123123");
		customer.setName("Henry");
		customer.setPassword("aa123");
		customer.setBirthday(2000,10,15);

		//將字串轉為整數,再將整束傳入LocalDate參數內
		//customer.birthday=LocalDate.of(Integer.parseInt("2000"), Integer.parseInt("10"), Integer.parseInt("5"));
		
		//使用字串須留意格式,年4碼,月日都需要2碼
		//customer.birthday=LocalDate.parse("2002-10-04");
		customer.setGender('M');
		
		System.out.println(customer.getId());
		System.out.println(customer.getName());
		System.out.println(customer.getPassword());
		System.out.println(customer.getBirthday());//2000-10-05 ISO 8601
		System.out.println(customer.getGender());
		System.out.println(customer.getAddress());
		System.out.println(customer.getPhone());
		System.out.println(customer.isSubscribed());//false
		
		System.out.println("i: "+i);
		
	}

}
