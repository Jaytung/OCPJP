package uuu.blackcake.service;

import java.util.List;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.entity.Order;
import uuu.blackcake.exception.BlackCakeException;
import uuu.blackcake.entity.OrderStatusLog;


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
	public Order getOrderById(Customer member,String orderId)throws BlackCakeException{
		return dao.selectOrderByCustomer(member.getEmail(), orderId);
	}
	
	public void updateOrderStatusToTransfered(Customer member, String id, 
            String bank, String last5Code, String amount, String date, String time) throws BlackCakeException {        
        if(member==null || member.getEmail().length()==0) throw new IllegalArgumentException("通知轉帳必須傳入member id");
        if(id==null || id.length()==0) throw new IllegalArgumentException("通知轉帳必須傳入order id");
        String paymentNote = "銀行:" + bank + ","
                + "帳號後5碼:" + last5Code + ","
                + "金額:" + amount + ","
                + date + " " + time+"完成轉帳";

        dao.updateOrderStatusToTransfered(member.getEmail(), Integer.parseInt(id) , paymentNote);
    }
	public List<OrderStatusLog> getOrderStatusLog(String orderId)throws BlackCakeException{
    	return dao.selectOrderStatusLog(orderId);
    }
}
