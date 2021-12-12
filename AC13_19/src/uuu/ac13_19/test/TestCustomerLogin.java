package uuu.ac13_19.test;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Scanner;

public class TestCustomerLogin {
	
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url="jdbc:mysql://localhost:3306/vgb";
	private static final String userId="root";
	private static final String pwd="opqopq8238";
	
	private static final String SELECT_customer=
			"SELECT id, name, email, password, birthday, gender, "
			+ "address, phone, subscribed, blood_type, discount "
			+ "FROM customers";
	
	//1'OR'1'='1 SQL隱碼攻擊會查詢到所有資料

	public static void main(String[] args) {
		Scanner scanner = new Scanner(System.in);
		System.out.println("請輸入ID");
		String id =scanner.next();
		System.out.println("請輸入密碼");
		String password= scanner.next();
		//會發生sql隱碼攻擊
		scanner.close();
		
		String sql = SELECT_customer+" WHERE id='"+id+"' AND password='"+password+"'";
		
		try {
			Class.forName(driver);//1.載入MySQL driver
			try(
					Connection connection = DriverManager.//2.建立連線
					getConnection(url, userId, pwd);
					Statement stmt = connection.createStatement();//3.建立空的指令
					ResultSet rs = stmt.executeQuery(sql);//4.執行指令
				) {
				//5.處理rs
				while(rs.next()) {
					id = rs.getString("id");
					String name = rs.getString("name");
					String email = rs.getString("email");
					password = rs.getString("password");
					String birthday = rs.getString("birthday");
					char gender = rs.getString("gender").charAt(0);
					String address = rs.getString("address");
					String phone = rs.getString("phone");
					boolean subscribed = rs.getBoolean("subscribed");
					String blood = rs.getString("blood_type");
					String discount = rs.getString("discount");
					
					System.out.println(id);
					System.out.println(name);
					System.out.println(email);
					System.out.println(password);
					System.out.println(birthday);
					System.out.println(gender);
					System.out.println(address);
					System.out.println(phone);
					System.out.println(subscribed);
					System.out.println(blood);
					System.out.println(discount);
					
				}
				//6.關閉

			} catch (SQLException e) {
				System.out.println("指令不正確||建立連線失敗"+e);//for user
				e.printStackTrace();//for admin, developer, tester
			}
		} catch (ClassNotFoundException e) {
			System.err.println("載入driver失敗:"+e);
		}			
		
	}

}
