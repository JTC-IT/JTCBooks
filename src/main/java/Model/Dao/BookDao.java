package Model.Dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import Model.Bean.*;

public class BookDao {
	private ConnectDB DB;
	
	public BookDao() {
		DB = new ConnectDB();
	}
	
	public ArrayList<Book> getBooks(){
		ArrayList<Book> list= new ArrayList<Book>();
		String sql = "select* from Books";
		
		try {
			Statement st = DB.connec().createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				list.add(new Book(
						rs.getInt("Id")
						, rs.getString("Name")
						, rs.getString("Author")
						, rs.getInt("Amount")
						, rs.getInt("Price")
						, rs.getString("Img")
						, rs.getInt("CategoryId")
						, rs.getDate("DateAdd")
						));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public ArrayList<Book> getBooks(int top){
		ArrayList<Book> list= new ArrayList<Book>();
		String sql = "select top "+ top +" * from Books order by Id";
		
		try {
			Statement st = DB.connec().createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				list.add(new Book(
						rs.getInt("Id")
						, rs.getString("Name")
						, rs.getString("Author")
						, rs.getInt("Amount")
						, rs.getInt("Price")
						, rs.getString("Img")
						, rs.getInt("CategoryId")
						, rs.getDate("DateAdd")
						));
			}
			rs.close();
			st.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public ArrayList<Book> getBooks(int offset, int next){
		ArrayList<Book> list= new ArrayList<Book>();
		String sql = "select* from Books order by Id offset "+ offset +" rows fetch next "+ next +" rows only";
		
		try {
			Statement st = DB.connec().createStatement();
			ResultSet rs = st.executeQuery(sql);
			while(rs.next()) {
				list.add(new Book(
						rs.getInt("Id")
						, rs.getString("Name")
						, rs.getString("Author")
						, rs.getInt("Amount")
						, rs.getInt("Price")
						, rs.getString("Img")
						, rs.getInt("CategoryId")
						, rs.getDate("DateAdd")
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
