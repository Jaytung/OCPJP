package uuu.blackcake.service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.entity.Order;
import uuu.blackcake.entity.OrderItem;
import uuu.blackcake.entity.PaymentType;
import uuu.blackcake.entity.Product;
import uuu.blackcake.entity.ShippingType;
import uuu.blackcake.entity.Size;
import uuu.blackcake.exception.BlackCakeException;

class OrdersDAO {
	private static final String INSERT_ORDER = "INSERT INTO orders "
			+ "(id, member_id, created_date, created_time, receipt_name, "
			+ "receipt_email, receipt_phone, shipping_addres, payment_type, "
			+ "payment_fee, shipping_type, shipping_fee, status) " + "VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?)";
	private static final String INSERT_ORDER_ITEM = "INSERT INTO order_items "
			+ "(order_id, product_id, size_name, spicy, price, quantity) " + "VALUES(?,?,?,?,?,?)";

	void insert(Order order) throws BlackCakeException {
		if (order == null)
			throw new IllegalArgumentException("新增訂單不能為null");
		try {
			// 1,2 取得連線
			Connection connection = RDBConnection.getConnection();
			// 讀回自動給號的號碼,不然無法取得單號
			PreparedStatement pstmt1 = connection.prepareStatement(INSERT_ORDER, Statement.RETURN_GENERATED_KEYS);// 3.準備pstmt
			PreparedStatement pstmt2 = connection.prepareStatement(INSERT_ORDER_ITEM, Statement.RETURN_GENERATED_KEYS);

			// 3.1準備?的值
			pstmt1.setInt(1, order.getId());
			pstmt1.setString(2, order.getMember().getEmail());
			pstmt1.setString(3, order.getCreateDate().toString());
			pstmt1.setString(4, order.getCreatTime().toString());
			pstmt1.setString(5, order.getReceiptName());
			pstmt1.setString(6, order.getReceiptEmail());
			pstmt1.setString(7, order.getReceiptPhone());
			pstmt1.setString(8, order.getShippingAddres());
			pstmt1.setString(9, order.getPaymentType().name());
			pstmt1.setDouble(10, order.getPaymentFee());
			pstmt1.setString(11, order.getShippingType().name());
			pstmt1.setDouble(12, order.getShippingFee());
			pstmt1.setInt(13, order.getStatus());

			// 4.執行pstmt1,只要不是select就用executeUpdat
			pstmt1.executeUpdate();
			// 讀取key...
			try (ResultSet rs = pstmt1.getGeneratedKeys();) {
				while (rs.next()) {
//					int id = rs.getInt(1)
					order.setId(rs.getInt(1));

				}
			}
			// 新增訂單
			for (OrderItem orderItem : order.getOrderItemSet()) {
				Product p = orderItem.getProduct();
				Size size = orderItem.getSize();
				String spicy = orderItem.getSpicy();
				// 3.1傳入pstmt2 ? 的值
				pstmt2.setInt(1, order.getId());
				pstmt2.setInt(2, orderItem.getProduct().getId());
				pstmt2.setString(3, size != null ? size.getName() : "");
				pstmt2.setString(4, spicy != null ? spicy : "");
				pstmt2.setDouble(5, orderItem.getPrice());
				pstmt2.setInt(6, orderItem.getQuantity());
				// 4.執行pstmt2指令
				pstmt2.executeUpdate();

			}
		} catch (SQLException e) {
			throw new BlackCakeException("新增訂單失敗", e);
		}
	}

	private static final String SELECT_ORDER_BY_CUSTOMER = 
			"SELECT id,member_id, created_date, created_time,"
			+ " receipt_name, receipt_email, receipt_phone, shipping_addres, "
			+ " payment_type, payment_fee, payment_note, shipping_type, " + " shipping_fee, shipping_note, status,"
			+ " product_id, size_name, price, quantity, SUM(price*quantity) as total_amount"
			+ " FROM orders LEFT JOIN order_items ON id=order_id" + " WHERE member_id=? "
			+ " GROUP BY orders.id"
			+ " ORDER BY created_date DESC, created_time DESC;";
				
	List<Order> selectOrderByCustomer(String email) throws BlackCakeException {
		if (email == null || email.length() == 0)
			throw new IllegalArgumentException("查詢歷史訂單時帳號必須有值");
		List<Order> list = new ArrayList<>();
		try (Connection connection = RDBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(SELECT_ORDER_BY_CUSTOMER);) {

			pstmt.setString(1, email);
			
			try (ResultSet rs = pstmt.executeQuery();
					) {
				while (rs.next()) {
					Order order = new Order();
					order.setId(rs.getInt("id"));
					
					Customer c = new Customer();
					c.setEmail(rs.getString("member_id"));
					order.setMember(c);

					order.setCreateDate(LocalDate.parse(rs.getString("created_date")));
					order.setCreatTime(LocalTime.parse(rs.getString("created_time")));
					
					String pType = rs.getString("payment_type");
					try {
						PaymentType paymentType = PaymentType.valueOf(pType);
						order.setPaymentType(paymentType);
					} catch (Exception e) {
						System.out.println("付款方式不正確" + pType );
					}
					
					order.setPaymentFee(rs.getDouble("payment_fee"));
					
					String sType = rs.getString("shipping_type");
					try {
						ShippingType shippingType = ShippingType.valueOf(sType);
						order.setShippingType(shippingType);
					}catch(Exception e) {
						System.out.println("貨運方式不正確"+sType);
					}
					order.setShippingFee(rs.getDouble("shipping_fee"));
					order.setStatus(rs.getInt("status"));
					order.setTotalAmount(rs.getDouble("total_amount"));
					list.add(order);
				}
			}
		} catch (SQLException e) {
			throw new BlackCakeException("查詢歷史訂單失敗" + e);

		}
		return list;
	}

	private static final String GET_ORDER_BY_ID=
			"SELECT orders.id, member_id, created_date, created_time,\r\n"
			+ " receipt_name, receipt_email, receipt_phone, shipping_addres,\r\n"
			+ " payment_type, payment_fee, payment_note, shipping_type,\r\n"
			+ " shipping_fee, shipping_note, status \r\n"
			+ " order_id, order_items.product_id, product.name as product_name,product.photo_url,\r\n"
			+ " order_items.size_name, products_sizes.size_name as p_size_name,\r\n"
			+ " products_sizes.photo_url as size_photo,\r\n"
			+ " spicy, price, quantity\r\n"
			+ " FROM orders JOIN order_items ON orders.id=order_items.order_id\r\n"
			+ "			JOIN  product ON order_items.product_id = product.id\r\n"
			+ "				LEFT JOIN products_sizes ON order_items.product_id = products_sizes.product_id\r\n"
			+ "                AND order_items.size_name = products_sizes.size_name\r\n"
			+ "WHERE member_id='?' AND orders.id='?';";
	Order selectOrderByCustomer(String email, String orderId)throws BlackCakeException {
		Order order =null;
		try(
				Connection connection = RDBConnection.getConnection();
				PreparedStatement pstmt = connection.prepareStatement(GET_ORDER_BY_ID);
				){
			pstmt.setString(1, email);
			pstmt.setString(2, orderId);
			
			try(
				ResultSet rs = pstmt.executeQuery();	
					){
				while(rs.next()) {
					if(order==null) {
						order = new Order();
						order.setId(rs.getInt("id"));
						
						Customer c = new Customer();
						c.setEmail(rs.getString("member_id"));
						order.setMember(c);
						order.setCreateDate(LocalDate.parse(rs.getString("created_date")));
						order.setCreatTime(LocalTime.parse(rs.getString("created_time")));
						String pType = rs.getString("payment_type");
						try {
							PaymentType paymentType = PaymentType.valueOf(pType);
							order.setPaymentType(paymentType);
						}catch(Exception e) {
							System.err.println("付款方式不正確"+pType);
						}
						
						order.setPaymentFee(rs.getDouble("payment_fee"));
						order.setPaymentNote(rs.getString("payment_note"));
						
						String sType = rs.getString("shipping_type");
						try {
							ShippingType shippingType = ShippingType.valueOf(sType);
							order.setShippingType(shippingType);
						}catch(Exception e) {
							System.err.println("貨運方式不正確"+e);
						}
						
						order.setShippingFee(rs.getDouble("shipping_fee"));
						order.setShippingNote(rs.getString("shipping_note"));
						order.setStatus(rs.getInt("status"));
						
						order.setReceiptName(rs.getString("receipt_name"));
						order.setReceiptEmail(rs.getString("receipt_email"));
						order.setReceiptPhone(rs.getString("receipt_phone"));
						order.setShippingAddres(rs.getString("shipping_addres"));
						
					}
					OrderItem orderItem = new OrderItem();

					Product p = new Product();
					p.setId(rs.getInt("product_id"));
					p.setName(rs.getString("product_name"));
					p.setPhotoUrl(rs.getString("photo_url"));
					orderItem.setProduct(p);
					
					String sizeName= rs.getString("p_size_name");
					Size size = null;
					if(sizeName!=null) {
						size = new Size();
						size.setName(rs.getString("size_name"));
						size.setPhotoURL(rs.getString("size_photo"));
						orderItem.setSize(size);
					}
					orderItem.setSpicy(rs.getString("spicy"));
					orderItem.setPrice(rs.getDouble("price"));
					orderItem.setQuantity(rs.getInt("quantity"));
					
					order.add(orderItem);
				}
			}
		}catch(SQLException e) {
			throw new BlackCakeException("查詢歷史訂單失敗",e);
		}
		return order;
	}
	
}
