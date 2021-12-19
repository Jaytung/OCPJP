package uuu.blackcake.service;

import java.sql.*;

//不要宣告成public 預設只有同package可看到
class RDBConnection {
	private static final String driver = "com.mysql.cj.jdbc.Driver";
	private static final String url="jdbc:mysql://localhost:3306/vgb";
	private static final String userId="root";
	private static final String pwd="Opqopq8238";
	
	static Connection getConnection() {
		try {
			Class.forName(driver);//1.載入Driver
			try {
				Connection connection = DriverManager.
						getConnection(url, userId, pwd);//2.建立連線
				return connection;
			} catch (SQLException e) {
			//必須使用,來顯示錯誤訊息 + 會使e變成字串
			throw new RuntimeException("建立連線失敗: ",e);
			
			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("載入JDBC Driver失敗:"+driver);
		}
	}

}
