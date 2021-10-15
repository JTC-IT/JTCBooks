package Model.Dao;

import java.sql.PreparedStatement;

public class CartDao {
	
	private ConnectDB DB;
	
	public CartDao() {
		DB = new ConnectDB();
	}
	
	public int createBill(int customerId) {
		int id = 0;
		//add bill database
		return id;
	}
	
	public boolean saveCartItem(int biilId, int bookId, int amount) {
		String sql = "insert into BillDetails(BillId, BookId, Amount) values(?,?,?)";
		try {
			PreparedStatement ps = DB.connec().prepareStatement(sql);
			ps.setInt(1, biilId);
			ps.setInt(2, bookId);
			ps.setInt(3, amount);
			return ps.executeUpdate() == 1;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}
}
