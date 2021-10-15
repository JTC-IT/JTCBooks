package Model.Dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ConnectDB {
	private Connection connec;
	
	public ConnectDB() {
		String url = "jdbc:sqlserver://localhost:1433;databaseName=JBooks";
		String user = "chinh";
		String password = "ttc0206";
		try {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			connec = DriverManager.getConnection(url,user,password);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public Connection connec() {
		return connec;
	}
}
