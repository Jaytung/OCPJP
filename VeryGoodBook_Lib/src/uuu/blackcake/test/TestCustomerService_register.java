package uuu.blackcake.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.service.CustomerService;

public class TestCustomerService_register {

	public static void main(String[] args) {
		Customer c = new Customer();
		c.setId("R183308824");
		c.setName("Mike");
		c.setEmail("Mike@gmail.com");
		c.setPassword("asd12345");
		c.setBirthday("1990-01-10");
		c.setGender(Customer.MALE);
		c.setSubscribed(true);
		
		CustomerService cService = new CustomerService();
		try {
			cService.register(c);
			System.out.println("註冊成功!");
			System.out.println(c.isSubscribed());
		} catch (BlackCakeException e) {
			Logger.getLogger("測試註冊會員").log(Level.SEVERE,e.getMessage(), e);
			e.printStackTrace();
		}
	}

}
