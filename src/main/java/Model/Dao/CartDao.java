package Model.Dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.Types;

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
}
