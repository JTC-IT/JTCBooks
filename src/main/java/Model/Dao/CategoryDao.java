package Model.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Model.Bean.*;

public class CategoryDao {

	public ArrayList<Category> getCategorys() throws Exception {
		ConnectDB DB = new ConnectDB();
		String sql = "select* from BookCategorys order by Name";
		ArrayList<Category> list = new ArrayList<Category>();

		Statement st = DB.connec().createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			list.add(new Category(rs.getInt(1), rs.getString(2)));
		}
		rs.close();
		st.close();
		DB.close();
		return list;
	}

	public void addCategory(String name) throws Exception {
		ConnectDB DB = new ConnectDB();
		String sql = "insert into BookCategorys(Name) values(?)";
		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setString(1, name);
		ps.executeUpdate();
		ps.close();
		DB.close();
	}
}
