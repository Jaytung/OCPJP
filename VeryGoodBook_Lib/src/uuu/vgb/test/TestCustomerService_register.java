package uuu.vgb.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.vgb.entity.Customer;
import uuu.vgb.exception.VGBException;
import uuu.vgb.service.CustomerService;

public class TestCustomerService_register {

	public static void main(String[] args) {
		Customer c = new Customer();
		c.setId("R183308824");
		c.setName("Mike");
		c.setEmail("Mike@gmail.com");
		c.setPassword("asd12345");
		c.setBirthday("1990-01-10");
		c.setGender(Customer.MALE);
		
		CustomerService cService = new CustomerService();
		try {
			cService.register(c);
			System.out.println("註冊成功!");
		} catch (VGBException e) {
			Logger.getLogger("測試註冊會員").log(Level.SEVERE,e.getMessage(), e);
			e.printStackTrace();
		}
	}

}
