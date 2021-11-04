package Model.Dao;

import java.sql.PreparedStatement;

public class CartDao {
	
	public int createBill(int customerId) {
		int id = 0;
		//add bill database
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
}
