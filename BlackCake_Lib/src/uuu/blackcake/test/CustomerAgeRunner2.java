package uuu.blackcake.test;

import uuu.blackcake.entity.Customer;

public class CustomerAgeRunner2 {

	public static void main(String[] args) {
		
		Customer customer = new Customer();
		customer.setId("X120568726");
		customer.setName(" Henry ");
		customer.setEmail("aa123@gmail.com");
		customer.setPassword("aa12345");
		customer.setGender('M');
		
		
//		customer.birthday=LocalDate.parse("2000-10-05");//字串轉入LocalDate
//		customer.birthday=LocalDate.of(2000, 10, 6);//當輸入的日期為3個整數,轉入LocalDate
//		customer.setBirthday("2000-10-05");//使用Customer內的Method,
		customer.setBirthday(2000,10,5);//使用Customer內的Method
		customer.setGender('M');
		
		System.out.println("ID:"+customer.getId());
		System.out.println("Name:"+customer.getName());
		System.out.println("Email: "+customer.getEmail());
		System.out.println("Password:"+customer.getPassword());
		System.out.println("Birthday:"+customer.getBirthday());//2000-10-05 ISO 8601
		System.out.println("gender:"+customer.getGender());
		System.out.println("address:"+customer.getAddress());
		System.out.println("Phone Number:"+customer.getPhone());
		System.out.println("Subscribed:"+customer.isSubscribed());//false
		System.out.println("age:"+customer.getAge());
		System.out.println("age1 :"+customer.getAge1());
		
		
	}

}
