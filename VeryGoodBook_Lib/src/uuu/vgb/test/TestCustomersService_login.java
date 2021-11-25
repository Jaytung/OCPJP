package uuu.vgb.test;

import uuu.vgb.entity.Customer;
import uuu.vgb.exception.VGBException;
import uuu.vgb.service.CustomerService;

public class TestCustomersService_login {

	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		Customer c;
		try {
			c = cService.login("A123123123", "woww1234");
			System.out.println(c);
		} catch (VGBException e) {
			System.out.println(e.getMessage());
		}
	}

}
