package uuu.blackcake.service;

import java.util.List;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.entity.Order;
import uuu.blackcake.exception.BlackCakeException;

public class OrderService {
	private OrdersDAO dao = new OrdersDAO();
	
	public void createOrder(Order order)throws BlackCakeException {
		dao.insert(order);
	}
	public  List<Order> getOrderHistory(Customer member)
			throws BlackCakeException{
		if(member==null)
			throw new IllegalArgumentException("查詢歷史訂單member物件不能為null");
		return dao.selectOrderByCustomer(member.getEmail());
	}
	public Order getOrderById(Customer member,String orderId)
			throws BlackCakeException{
		return dao.selectOrderByCustomer(member.getEmail(), orderId);
	}
}
