package Model.Dao;

import java.sql.Array;
import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.Date;

import Model.Bean.Bill;
import Model.Bean.CartItem;

public class CartDao {

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

	public boolean saveCartItem(int biilId, int bookId, int amount) throws Exception {
		ConnectDB DB = new ConnectDB();
		String sql = "insert into BillDetails(BillId, BookId, Amount) values(?,?,?)";

		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setInt(1, biilId);
		ps.setInt(2, bookId);
		ps.setInt(3, amount);
		boolean b = ps.executeUpdate() == 1;
		ps.close();
		DB.close();
		return b;
	}
	
	public ArrayList<Bill> getListBill(int customerId) throws Exception
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
	
	public ArrayList<CartItem> getBillDetail(int billId) throws Exception
	{
		ConnectDB DB = new ConnectDB();
		
		String sql = "SELECT \r\n"
				+ "        b.Name,\r\n"
				+ "        b.Author,\r\n"
				+ "        b.Img,\r\n"
				+ "		b.Price,\r\n"
				+ "		bd.Amount\r\n"
				+ "    FROM\r\n"
				+ "        BillDetails as bd join Books as b on bd.BookId = b.Id\r\n"
				+ "    WHERE\r\n"
				+ "        bd.BillId = ?;";
		
		ArrayList<CartItem> list = new ArrayList<CartItem>();
		
		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setInt(1, billId);
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			String name = rs.getString("Name");
	        String author = rs.getString("Author");
	        String img = rs.getString("Img");
	        int price = rs.getInt("Price");
	        int amount = rs.getInt("Amount");
			list.add(new CartItem(billId, name, author, img, price, amount));
		}
		rs.close();
		ps.close();
		DB.close();
		return list;
	}
}
