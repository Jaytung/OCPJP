package uuu.vgb.test;

import uuu.vgb.entity.Customer;

public class TestCustomerConstructor {

	public static void main(String[] args) {
		Customer customer = new Customer();
		customer.setId("A123456789");
		customer.setName("Henry");
		customer.setPassword("aa12345");
		System.out.println(customer.getId());
		System.out.println(customer.getName());
		System.out.println(customer.getPassword());
		
		Customer customer1 = new Customer("X120568726","Jimmy","aa54321","test@uuu.com.tw");
		System.out.println( "id:"+customer1.getId());
		System.out.println("Name:"+customer1.getName());
		System.out.println("Password:"+customer1.getPassword());
		System.out.println("Email: "+ customer1.getEmail());
	
	
	
	}
}
