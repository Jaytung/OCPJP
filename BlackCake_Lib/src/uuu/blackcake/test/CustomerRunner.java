package uuu.blackcake.test;

import java.time.LocalDate;

import uuu.blackcake.entity.Customer;

public class CustomerRunner {

	public static void main(String[] args) {
//		Customer customer1 = new Customer("X120568726","boris",
//				"aaa12345","sdwda@gmail.com");
		System.out.println(Customer.getAge(LocalDate.parse("2010-10-15")));
		System.out.println(Customer.checkId("A1234567890"));
		Customer customer = new Customer();
		customer.setId("X120568726");
		customer.setName("Henry");
		customer.setEmail("fun215@gmail.com");
		customer.setPassword("aa12345");
		customer.setBirthday(2000,10,15);
		//將字串轉為整數,再將整束傳入LocalDate參數內
		//customer.birthday=LocalDate.of(Integer.parseInt("2000"), Integer.parseInt("10"), Integer.parseInt("5"));
		//使用字串須留意格式,年4碼,月日都需要2碼
		//customer.birthday=LocalDate.parse("2002-10-04");
		customer.setGender('M');
		customer.setAddress("台北市敦化北路158號");
		customer.setPhone("0988665202");
		customer.setSubscribed(true);
		
//		System.out.println(customer.getId());
//		System.out.println(customer.getName());
//		System.out.println(customer.getPassword());
//		System.out.println(customer.getBirthday());//2000-10-05 ISO 8601
//		System.out.println(customer.getGender());
//		System.out.println(customer.getAddress());
//		System.out.println(customer.getPhone());
//		System.out.println(customer.isSubscribed());//false
		System.out.println(customer.toString()+"\n");
//		System.out.println(customer1.toString());
		
//		System.out.println("i: "+i);
		
	}

}
