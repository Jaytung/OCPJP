package uuu.blackcake.test;

import java.time.LocalDateTime;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.entity.Order;
import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.service.CustomerService;
import uuu.blackcake.service.OrderService;

public class TestOrderServiceUpdate {

	public static void main(String[] args) {
		CustomerService cService = new CustomerService();
		OrderService oService = new OrderService();
		try {
			Customer member = cService.login("jimmy@gmail.com", "asd12345");
			System.out.println(member);
			Order order = oService.getOrderById(member, "57");
			System.out.println(order);
//			oService.updateOrderStatusToTransfered(member, 
//					"30", "恆逸銀行", "54321", "1942.0", "2022-01-22", "15:30");
//			order = oService.getOrderById(member, "30");
//			System.out.println(order);
			oService.updateOrderStatusToPAID(member.getEmail(), 
					"57", "4311-95", "2222", "765412", LocalDateTime.now().toString(), "******");
			order = oService.getOrderById(member, "57");
			System.out.println(order);
		} catch (BlackCakeException e) {
			e.printStackTrace();
		}				
	}	
}
