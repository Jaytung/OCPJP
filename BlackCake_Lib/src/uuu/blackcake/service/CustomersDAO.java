package uuu.blackcake.service;

import java.sql.*;

import uuu.blackcake.entity.Customer;
import uuu.blackcake.entity.VIP;
import uuu.blackcake.exception.DataInvalidException;
import uuu.blackcake.exception.BlackCakeException;

class CustomersDAO {// package-friendly(不能加public)
	private static final String SELECT_customer=
			"SELECT id, name, email, password, birthday, gender, "
			+ "address, phone, subscribed, discount "
			+ "FROM customers WHERE email=? OR phone=?";

	Customer customerLogin(String account) throws BlackCakeException {
		Customer c = null;

		try (Connection connection = RDBConnection.getConnection(); // 1,2 取得連線
				PreparedStatement pstmt = connection.prepareStatement(SELECT_customer);
				) 
			{//3.1傳入?的值
			pstmt.setString(1, account);
			pstmt.setString(2, account);
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

					//可不做
				}
			}
			
		} catch (SQLException e) {
			throw new BlackCakeException("用查詢客戶失敗", e);
		}

		return c;
	}
	private static final String INSERT_CUSTOMER= "INSERT INTO customers\r\n"
			+ "	(id, name, email, password, birthday, "
			+ " gender, address, phone, subscribed)"
			+ "VALUES(?,?,?,?,?,?,?,?,?)";
	
	void insert(Customer c) throws BlackCakeException {
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
				int rows = pstmt.executeUpdate(); //4.執行指令
//				System.out.println(rows);//for test
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println(e.getErrorCode()+","+e.getMessage());
			if(e.getMessage().indexOf("PRIMARY")>0) {
				throw new DataInvalidException("身分證已重複註冊",e);
			}else if(e.getMessage().indexOf("email_UNIQUE")>0) {
				throw new DataInvalidException("email已重複註冊",e);
			}else if(e.getMessage().indexOf("phone_UNIQUE")>0) {
				throw new DataInvalidException("電話已重複註冊",e);
				
			}else {
				throw new BlackCakeException("新增客戶失敗,欄位不得為null",e);
			}
		}catch (SQLException e) {
		throw new BlackCakeException("新增客戶失敗",e);
		}
	}

	private static final String UPDATE_CUSTOMER = "UPDATE customers SET name=? ,email=? ,password=? ,birthday=? ,gender=? ,address=? ,phone=? "
			+ ",subscribed=? WHERE id=?";	
	void update(Customer c) throws BlackCakeException {
		try(
				Connection connection = RDBConnection.getConnection();//1,2.取得連線
				PreparedStatement pstmt = connection.prepareStatement(UPDATE_CUSTOMER);//3.準備指令
				) {				
				pstmt.setString(1, c.getName());
				pstmt.setString(2, c.getEmail());
				pstmt.setString(3, c.getPassword());
				pstmt.setString(4, c.getBirthday().toString());
				pstmt.setString(5, String.valueOf(c.getGender()));
				pstmt.setString(6, c.getAddress());
				pstmt.setString(7, c.getPhone());
				pstmt.setBoolean(8, c.isSubscribed());
				pstmt.setString(9, c.getId());
				int rows = pstmt.executeUpdate(); //4.執行指令
				System.out.println(rows);//for test
		} catch (SQLIntegrityConstraintViolationException e) {
			System.out.println(e.getErrorCode()+","+e.getMessage());
			if(e.getMessage().indexOf("PRIMARY")>0) {
				throw new DataInvalidException("身分證已重複註冊",e);
			}else if(e.getMessage().indexOf("email_UNIQUE")>0) {
				throw new DataInvalidException("email以重複註冊",e);
			}else if(e.getMessage().indexOf("phone_UNIQUE")>0) {
				throw new DataInvalidException("電話已重複註冊",e);
				
			}else {
				throw new BlackCakeException("修改客戶失敗,欄位不得為null",e);
			}
		}catch (SQLException e) {
		throw new BlackCakeException("修改客戶失敗",e);
		}
	}
//	private static String SEND_PASSWORD="SELECT email, password "
//			+ " FROM customers "
//			+ " WHERE email = ?";
//	Customer sendPassword(String account) throws BlackCakeException {
//		Customer c = new Customer();
//		try(
//				Connection connection = RDBConnection.getConnection();
//				PreparedStatement pstmt = connection.prepareStatement(SEND_PASSWORD);
//				){
//			pstmt.setString(1,account);
//			try(
//					ResultSet rs = pstmt.executeQuery();
//					){
//				while(rs.next()) {
//					c.setEmail(rs.getString("email"));
//					c.setPassword(rs.getString("password"));
//				}	
//			}
//		}catch(SQLException e) {
//			System.out.println("帳號不存在");
//		}
//		return c;
//	}
}
