package uuu.vgb.service;

import java.sql.*;

import uuu.vgb.entity.BloodType;
import uuu.vgb.entity.Customer;
import uuu.vgb.entity.VIP;

class CustomersDAO {// package-friendly(不能加public)
	private static final String SELECT_customer=
			"SELECT id, name, email, password, birthday, gender, "
			+ "address, phone, subscribed, blood_type, discount "
			+ "FROM customers WHERE id=?";

	Customer selectCustomerById(String id) {
		Customer c = null;

		try (Connection connection = JDBConnection.getConnection(); // 1,2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_customer);
				) 
			{//3.1傳入?的值
			pstmt.setString(1, id);
			try(
			ResultSet rs = pstmt.executeQuery();
					){
				//5.處理rs
				while(rs.next()) {
					int discount = rs.getInt("discount");
					if(discount>0) {
						c= new VIP();
						((VIP)c).setDiscount(discount);
					}
					c = new Customer();
					c.setId(rs.getString("id"));
					c.setName(rs.getString("name"));
					c.setEmail(rs.getString("email"));
					c.setPassword(rs.getString("password"));
					c.setBirthday(rs.getString("birthday"));
					c.setGender(rs.getString("gender").charAt(0));
					c.setAddress(rs.getString("address"));
					c.setPhone(rs.getString("phone"));
					c.setSubscribed(rs.getBoolean("subscribed"));
					String bType = rs.getString("blood_type");
					
					if(bType!=null) {
						c.setBloodtype(BloodType.valueOf(bType));
					}
				}
			}
			
		} catch (SQLException e) {
			throw new RuntimeException("用查詢客戶失敗", e);
		}

		return c;
	}
}
