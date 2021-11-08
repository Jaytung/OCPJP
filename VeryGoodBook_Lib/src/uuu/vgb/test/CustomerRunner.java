package uuu.vgb.test;

import java.time.LocalDate;

import uuu.vgb.entity.Customer;

public class CustomerRunner {

	public static void main(String[] args) {
		Customer customer = new Customer();
		customer.id="A123123123";
		customer.name="Henry";
		customer.password="aa123";
		customer.birthday=LocalDate.of(2000, 10, 5);
		customer.gender='M';
		
		System.out.println(customer.id);
		System.out.println(customer.name);
		System.out.println(customer.password);
		System.out.println(customer.birthday);//2000-10-05 ISO 8601
		System.out.println(customer.gender);
		System.out.println(customer.address);
		System.out.println(customer.phone);
		System.out.println(customer.subscribed);//true
		
	}

}
