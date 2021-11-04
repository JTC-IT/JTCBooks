package Model.Dao;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

import Model.Bean.Customer;

public class CustomerDao {
	
	public ArrayList<Customer> getCustomers() throws Exception{
		ConnectDB DB = new ConnectDB();
		ArrayList<Customer> list = new ArrayList<Customer>();
		String sql = "select* from Customers";
		
		Statement st = DB.connec().createStatement();
		ResultSet rs = st.executeQuery(sql);
		while(rs.next()) {
			list.add(new Customer(rs.getInt("Id")
					, rs.getString("Name")
					, rs.getString("Phone")
					, rs.getString("Email")
					, rs.getString("Address")
					, rs.getString("Password")
					, rs.getBoolean("Admin")
					));
		}
		rs.close();
		st.close();
		DB.close();
		return list;
	}
	
	public int insertCustomer(Customer c) throws Exception
	{
		ConnectDB DB = new ConnectDB();
		int id = 0;
		String sql = "{Call proc_insert_Customer(?,?,?,?,?,?,?)}";
		CallableStatement cs = DB.connec().prepareCall(sql);
		cs.registerOutParameter(1, Types.INTEGER);
		cs.setString(2, c.getName());
		cs.setString(3, c.getPhone());
		cs.setString(4, c.getEmail());
		cs.setString(5, c.getAddress());
		cs.setString(6, c.getPassword());
		cs.setBoolean(7, c.isAdmin());
		cs.execute();
		id = cs.getInt(1);
		cs.close();
		DB.close();
		return id;
	}
}
