package uuu.vgb.test;

import uuu.vgb.entity.Customer;
import uuu.vgb.service.CustomerService;

public class TestCustomersService_login {

	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		Customer c = cService.login("A123123123", "woww12345");
		System.out.println(c);
	}

}
