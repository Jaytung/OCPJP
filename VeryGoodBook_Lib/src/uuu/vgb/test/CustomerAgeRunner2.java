package uuu.vgb.test;

import java.time.LocalDate;

import uuu.vgb.entity.Customer;

public class CustomerAgeRunner2 {

	public static void main(String[] args) {
		int i = 1;
		
		Customer customer = new Customer();
		customer.id="A123123123";
		customer.name="Henry";
		customer.password="aa123";
//		customer.birthday=LocalDate.parse("2000-10-05");//字串轉入LocalDate
//		customer.birthday=LocalDate.of(2000, 10, 6);//當輸入的日期為3個整數,轉入LocalDate
//		customer.setBirthday("2000-10-05");//使用Customer內的Method,
		customer.setBirthday(2000,10,5);//使用Customer內的Method
		customer.gender='M';
		
		System.out.println("ID:"+customer.id);
		System.out.println("Name:"+customer.name);
		System.out.println("Password:"+customer.password);
		System.out.println("Birthday:"+customer.birthday);//2000-10-05 ISO 8601
		System.out.println("gender:"+customer.gender);
		System.out.println("address:"+customer.address);
		System.out.println("Phone Number:"+customer.phone);
		System.out.println("Subscribed:"+customer.subscribed);//false
		System.out.println("age:"+customer.getAge());
		System.out.println("i: "+i);
		
	}

}
