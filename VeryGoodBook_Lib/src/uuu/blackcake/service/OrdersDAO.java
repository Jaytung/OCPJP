package uuu.blackcake.service;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import uuu.blackcake.entity.Order;
import uuu.blackcake.entity.OrderItem;
import uuu.blackcake.entity.Product;
import uuu.blackcake.entity.Size;
import uuu.blackcake.exception.BlackCakeException;

 	class OrdersDAO {
 	private static final String INSERT_ORDER=
 			"INSERT INTO orders "
 			+ "(id, member_id, created_date, created_time, receipt_name, "
 			+ "receipt_email, receipt_phone, shipping_addres, payment_type, "
 			+ "payment_fee, shipping_type, shipping_fee, status) "
 			+ "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
 	private static final String INSERT_ORDER_ITEM=
 			"INSERT INTO order_items "
 			+ "(order_id, product_id, size_name, spicy, price, quantity) "
 			+ "VALUES(?,?,?,?,?,?)";	
	void insert(Order order)throws BlackCakeException {
		if(order==null) throw new IllegalArgumentException("新增訂單不能為null");
		try {
			//1,2 取得連線
			Connection connection = RDBConnection.getConnection();
			//讀回自動給號的號碼,不然無法取得單號
			PreparedStatement pstmt1 = connection.prepareStatement(INSERT_ORDER,Statement.RETURN_GENERATED_KEYS);//3.準備pstmt
			PreparedStatement pstmt2 = connection.prepareStatement(INSERT_ORDER_ITEM,Statement.RETURN_GENERATED_KEYS);

			//3.1準備?的值
			pstmt1.setInt(1, order.getId());
			pstmt1.setString(2, order.getMember().getId());
			pstmt1.setString(3, order.getCreateDate().toString());
			pstmt1.setString(4, order.getCreatTime().toString());
			pstmt1.setString(5,order.getReceiptName());
			pstmt1.setString(6, order.getReceiptEmail());
			pstmt1.setString(7, order.getReceiptPhone());
			pstmt1.setString(8, order.getShippingAddres());
			pstmt1.setString(9, order.getPaymentType().name());
			pstmt1.setDouble(10, order.getPaymentFee());
			pstmt1.setString(11, order.getShippingType().name());
			pstmt1.setDouble(12, order.getShippingFee());
			pstmt1.setInt(13, order.getStatus());
			
			//4.執行pstmt1,只要不是select就用executeUpdat
			pstmt1.executeUpdate();
			//讀取key...
			try(
				ResultSet rs = pstmt1.getGeneratedKeys();
			){
				while(rs.next()) {
//					int id = rs.getInt(1)
					order.setId(rs.getInt(1));
					
				}
			}
			//新增訂單
			for(OrderItem orderItem:order.getOrderItemSet()) {
				Product p = orderItem.getProduct();
				Size size = orderItem.getSize();
				String spicy = orderItem.getSpicy();
				//3.1傳入pstmt2 ? 的值
				pstmt2.setInt(1,order.getId());
				pstmt2.setInt(2, orderItem.getProduct().getId());
				pstmt2.setString(3, size!=null?size.getName():"");
				pstmt2.setString(4, spicy!=null?spicy:"");
				pstmt2.setDouble(5,orderItem.getPrice());
				pstmt2.setInt(6, orderItem.getQuantity());
				//4.執行pstmt2指令
				pstmt2.executeUpdate();
				
			}
		}catch(SQLException e) {
			throw new BlackCakeException("新增訂單失敗",e);
		}
	}
	
}
