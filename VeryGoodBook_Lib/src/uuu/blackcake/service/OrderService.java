package uuu.blackcake.service;

import uuu.blackcake.entity.Order;
import uuu.blackcake.exception.BlackCakeException;

public class OrderService {
	private OrdersDAO dao = new OrdersDAO();
	public void createOrder(Order order)throws BlackCakeException {
		dao.insert(order);
	}
}
