package uuu.blackcake.test;

import java.sql.*;
import java.util.Scanner;

import uuu.blackcake.entity.Customer;
public class TestScanner {

	private static final String SELECT_customer = "SELECT id, name, email, password, birthday, gender, "
			+ "address, phone, subscribed, blood_type, discount " + "FROM customers WHERE id=?";
	
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url = "jdbc:mysql://localhost:3306/vgb";
	private static final String userId = "root";
	private static final String pwd = "Opqopq8238";

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		//scanner.

		try {
			Class.forName(driver);
			try {
				Connection connection = DriverManager.getConnection(url, userId, pwd);
				PreparedStatement pstmt = connection.prepareStatement(SELECT_customer);
				//pstmt.setString(1, id);
			} catch (SQLException e) {
				throw new RuntimeException("建立連線失敗", e);
			}
		} catch (ClassNotFoundException e1) {
			throw new RuntimeException("載入JDBC Driver失敗"+driver);
		}
		
		
	}

}
