package Model.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
	private Connection connec;

	public ConnectDB() throws SQLException, ClassNotFoundException {
		String url = "jdbc:sqlserver://localhost:1433;databaseName=JBooks";
		String user = "chinh";
		String password = "ttc0206";
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		connec = DriverManager.getConnection(url, user, password);
	}

	public Connection connec() {
		return connec;
	}

	public void close() throws SQLException {
		connec.close();
	}
}
