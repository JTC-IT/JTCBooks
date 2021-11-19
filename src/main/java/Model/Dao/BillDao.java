package Model.Dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;

import Model.Bean.Bill;

public class BillDao {

	public int createBill(int customerId, String address) throws Exception {
		int id = 0;
		ConnectDB DB = new ConnectDB();
		String sql = "{Call proc_insert_Bill(?,?,?)}";

		CallableStatement cs = DB.connec().prepareCall(sql);
		cs.registerOutParameter(1, Types.INTEGER);
		cs.setInt(2, customerId);
		cs.setString(3, address);
		cs.execute();
		id = cs.getInt(1);
		cs.close();
		DB.close();
		return id;
	}
	
	public ArrayList<Bill> getBillsByCustomer(int customerId) throws Exception
	{
		ConnectDB DB = new ConnectDB();
		String sql = "select* from Bills where CustomerId = ? order by Id desc";
		
		ArrayList<Bill> list = new ArrayList<Bill>();
		
		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setInt(1, customerId);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			int id = rs.getInt("Id");
			Date dateAdd = new Date(rs.getDate("Date").getTime());
			String address = rs.getString("Address");
			boolean status = rs.getBoolean("Status");
			list.add(new Bill(id, customerId, dateAdd, address, status));
		}
		rs.close();
		ps.close();
		DB.close();
		return list;
	}
	
	public ArrayList<Bill> getBills() throws Exception
	{
		ConnectDB DB = new ConnectDB();
		String sql = "select* from Bills where Status = 0 order by Id desc";
		
		ArrayList<Bill> list = new ArrayList<Bill>();
		
		PreparedStatement ps = DB.connec().prepareStatement(sql);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			int id = rs.getInt("Id");
			int customerId = rs.getInt("CustomerId");
			Date dateAdd = new Date(rs.getDate("Date").getTime());
			String address = rs.getString("Address");
			boolean status = rs.getBoolean("Status");
			list.add(new Bill(id, customerId, dateAdd, address, status));
		}
		rs.close();
		ps.close();
		DB.close();
		return list;
	}
	
	public int getQuantityBills() throws Exception{
		ConnectDB DB = new ConnectDB();
		String sql = "{? = call func_getQuantityBill()}";
		
		CallableStatement cs = DB.connec().prepareCall(sql);
		cs.registerOutParameter(1, Types.INTEGER);
		cs.execute();
		int sl = cs.getInt(1);
		cs.close();
		DB.close();
		return sl;
	}
	
	public void aceptBill(int id) throws Exception
	{
		ConnectDB DB = new ConnectDB();
		String sql = "update Bills set Status = 1 where Id = ?";
		
		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setInt(1, id);
		ps.executeUpdate();
		ps.close();
		DB.close();
	}
	
	public void aceptBillDetails(int biilId) throws Exception {
		ConnectDB DB = new ConnectDB();
		String sql = "update BillDetails set Status = 1 where BillId = ?";

		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setInt(1, biilId);
		ps.executeUpdate();
		ps.close();
		DB.close();
	}
	
	public void removeBill(int id) throws Exception
	{
		ConnectDB DB = new ConnectDB();
		String sql = "delete Bills where Id = ?";
		
		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setInt(1, id);
		ps.executeUpdate();
		ps.close();
		DB.close();
	}
	
	public void removeBillDetails(int biilId) throws Exception {
		ConnectDB DB = new ConnectDB();
		String sql = "delete BillDetails where BillId = ?";

		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setInt(1, biilId);
		ps.executeUpdate();
		ps.close();
		DB.close();
	}
}
