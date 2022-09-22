package MySQL;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC {
	public static final String HOST = "localhost";
	public static final String PORT = "3306";
	public static final String DATABASE = "quan_ly_ban_thuoc_db";
	public static final String URL = String.format("jdbc:mysql://%s:%s/%s", HOST, PORT, DATABASE);
	public static final String USERNAME = "root";
	public static final String PASSWORD = "namprozzx2001";
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			return connection;
		}catch (Exception e) {
			return null;
		}
	}
}
