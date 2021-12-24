package uuu.blackcake.test;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.service.CustomerService;

public class TestCustomersService_login {

	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		Customer c;
		try {
			c = cService.login("A123123123", "woww1234");
			System.out.println(c);
		} catch (BlackCakeException e) {
			System.out.println(e.getMessage());
		}
	}

}
