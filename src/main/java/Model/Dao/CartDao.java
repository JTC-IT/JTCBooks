package Model.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import Model.Bean.Bill;
import Model.Bean.CartItem;

public class CartDao {

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
	
	public void aceptCartItem(int biilId, int bookId) throws Exception {
		ConnectDB DB = new ConnectDB();
		String sql = "update BillDetails set Status = 1 where BillId = ? and BookId = ?";

		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setInt(1, biilId);
		ps.setInt(2, bookId);
		ps.executeUpdate();
		ps.close();
		DB.close();
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
