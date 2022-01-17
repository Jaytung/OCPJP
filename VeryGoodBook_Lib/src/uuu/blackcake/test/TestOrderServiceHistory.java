package uuu.blackcake.test;

import java.util.logging.Level;
import java.util.logging.Logger;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.service.CustomerService;
import uuu.blackcake.service.OrderService;

public class TestOrderServiceHistory {

	public static void main(String[] args) {

		CustomerService cService = new CustomerService();
		try {
			Customer member = cService.login("jimmy@gmail.com", "asd12345");
			OrderService oService = new OrderService();
			System.out.println(oService.getOrderHistory(member));
			System.out.println("************");
			System.out.println(oService.getOrderById(member, "9"));
		} catch (BlackCakeException e) {
			Logger.getLogger("測試歷史訂單查詢").log(Level.SEVERE, e.getMessage(), e);
		}

	}
}
