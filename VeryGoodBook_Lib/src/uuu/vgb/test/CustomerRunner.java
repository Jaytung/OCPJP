package uuu.vgb.test;

import java.time.LocalDate;

import uuu.vgb.entity.Customer;

public class CustomerRunner {

	public static void main(String[] args) {
		int i = 1;
		
		Customer customer = new Customer();
		customer.id="A123123123";
		customer.name="Henry";
		customer.password="aa123";
		customer.birthday=LocalDate.of(2000, 10, 5);

		//將字串轉為整數,再將整束傳入LocalDate參數內
		//customer.birthday=LocalDate.of(Integer.parseInt("2000"), Integer.parseInt("10"), Integer.parseInt("5"));
		
		//使用字串須留意格式,年4碼,月日都需要2碼
		//customer.birthday=LocalDate.parse("2002-10-04");
		customer.gender='M';
		
		System.out.println(customer.id);
		System.out.println(customer.name);
		System.out.println(customer.password);
		System.out.println(customer.birthday);//2000-10-05 ISO 8601
		System.out.println(customer.gender);
		System.out.println(customer.address);
		System.out.println(customer.phone);
		System.out.println(customer.subscribed);//false
		
		System.out.println("i: "+i);
		
	}

}
