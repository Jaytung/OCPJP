package uuu.vgb.service;

import java.sql.*;

import uuu.vgb.entity.BloodType;
import uuu.vgb.entity.Customer;
import uuu.vgb.entity.VIP;
import uuu.vgb.exception.DataInvalidException;
import uuu.vgb.exception.VGBException;

class CustomersDAO {// package-friendly(不能加public)
	private static final String SELECT_customer=
			"SELECT id, name, email, password, birthday, gender, "
			+ "address, phone, subscribed, blood_type, discount "
			+ "FROM customers WHERE id=?";

	Customer selectCustomerById(String id) throws VGBException {
		Customer c = null;

		try (Connection connection = RDBConnection.getConnection(); // 1,2 取得連線
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
					//以下兩種寫法,查資料庫Date->String後的格式來看
//					c.setBirthday(rs.getDate("birthday").toString());
					c.setBirthday(rs.getString("birthday"));
					c.setGender(rs.getString("gender").charAt(0));
					c.setAddress(rs.getString("address"));
					c.setPhone(rs.getString("phone"));
					c.setSubscribed(rs.getBoolean("subscribed"));
					String bType = rs.getString("blood_type");
					//可不做
					if(bType!=null) {
						c.setBloodtype(BloodType.valueOf(bType));
					}
				}
			}
			
		} catch (SQLException e) {
			throw new VGBException("用查詢客戶失敗", e);
		}

		return c;
	}
	private static final String INSERT_CUSTOMER= "INSERT INTO customers\r\n"
			+ "	(id, name, email, password, birthday, "
			+ " gender, address, phone, subscribed, blood_type)"
			+ "VALUES(?,?,?,?,?,?,?,?,?,?)";
	
	void insert(Customer c) throws VGBException {
		try(
				Connection connection = RDBConnection.getConnection();//1,2.取得連線
				PreparedStatement pstmt = connection.prepareStatement(INSERT_CUSTOMER);//3.準備指令
				) {
				pstmt.setString(1, c.getId());
				pstmt.setString(2, c.getName());
				pstmt.setString(3, c.getEmail());
				pstmt.setString(4, c.getPassword());
				pstmt.setString(5, c.getBirthday().toString());
				pstmt.setString(6, String.valueOf(c.getGender()));
				pstmt.setString(7, c.getAddress());
				pstmt.setString(8, c.getPhone());
				pstmt.setBoolean(9, c.isSubscribed());
				pstmt.setString(10, c.getBloodtype()!=null?c.getBloodtype().name():null);
				int rows = pstmt.executeUpdate(); //4.執行指令
//				System.out.println(rows);//for test
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println(e.getErrorCode()+","+e.getMessage());
			if(e.getMessage().indexOf("PRIMARY")>0) {
				throw new DataInvalidException("帳號已重複註冊",e);
			}else if(e.getMessage().indexOf("email_UNIQUE")>0) {
				throw new DataInvalidException("email以重複註冊",e);
			}else {
				throw new VGBException("新增客戶失敗,欄位不得為null",e);
			}
		}catch (SQLException e) {
		throw new VGBException("新增客戶失敗",e);
		}
	}
}
