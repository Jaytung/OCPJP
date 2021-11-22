package uuu.ac13_19.test;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Connection;
public class TestCreateConnection {
	
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url="jdbc:mysql://localhost:3306/vgb";
	private static final String userId="root";
	private static final String pwd="opqopq8238";
	public static void main(String[] args) {
		//1.載入MYSQL JDBC Driver
		try {
			Class.forName(driver);
			try {
				Connection connection = DriverManager.getConnection(
						url, userId, pwd);
				System.out.println("成功連上"+connection.getCatalog());
				connection.close();
			} catch (SQLException e) {
				System.err.println("建立連線失敗"+e);
			}
		} catch (ClassNotFoundException e) {
			System.err.println("載入MYSQL JDBC Driver失敗: "+driver);	
		}
	}

}
