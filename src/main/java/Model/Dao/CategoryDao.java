package Model.Dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Model.Bean.*;

public class CategoryDao {
	private ConnectDB DB;
	
	public CategoryDao() {
		DB = new ConnectDB();
	}
	
	public ArrayList<Category> getCategorys(){
		String sql = "select* from BookCategorys order by Name";
		ArrayList<Category> list= new ArrayList<Category>();
		
		try {
			Statement st = DB.connec().createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				list.add(new Category(rs.getInt(1), rs.getString(2)));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
    }
	
	public void addCategory(String name) {
		String sql = "insert into BookCategorys(Name) values(?)";
		try {
			PreparedStatement ps = DB.connec().prepareStatement(sql);
			ps.setString(1, name);
			ps.executeUpdate();
			ps.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
