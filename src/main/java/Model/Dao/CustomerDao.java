package Model.Dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Model.Bean.Customer;

public class CustomerDao {
	private ConnectDB DB;
	
	public CustomerDao() {
		DB = new ConnectDB();
	}
	
	public ArrayList<Customer> getCustomers(){
		ArrayList<Customer> list = new ArrayList<Customer>();
		String sql = "select* from Customers";
		
		try {
			Statement st = DB.connec().createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				list.add(new Customer(rs.getInt("Id")
						, rs.getString("Name")
						, rs.getString("Phone")
						, rs.getString("Email")
						, rs.getString("Password")
						, rs.getBoolean("Admin")
						));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
