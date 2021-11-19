package Model.Dao;

import java.sql.CallableStatement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;

import Model.Bean.*;

public class BookDao {

	public BookDao() {
	}
	
	public Book getBook(int id) throws Exception {
		ConnectDB DB = new ConnectDB();
		String sql = "select* from Books where Id = ?";
		Book book = null;
		
		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		if(rs.next()) {
			book = new Book(rs.getInt("Id"), rs.getString("Name"), rs.getString("Author"), rs.getInt("Amount"),
					rs.getInt("Price"), rs.getString("Img"), rs.getInt("CategoryId"), rs.getDate("DateAdd"));
		}
		rs.close();
		ps.close();
		DB.close();
		return book;
	}

	public int getTotalBooks(int idCategory) throws Exception {
		ConnectDB DB = new ConnectDB();
		String sql = "{? = call func_getQuantityBooks(?)}";
		int kq = 0;
		
		CallableStatement cs = DB.connec().prepareCall(sql);
		cs.registerOutParameter(1, Types.INTEGER);
		cs.setInt(2, idCategory);
		cs.execute();
		kq = cs.getInt(1);
		cs.close();
		DB.close();
		return kq;
	}
	
	public ArrayList<Book> getBooksByCategory(int id) throws Exception {
		ConnectDB DB = new ConnectDB();
		ArrayList<Book> list = new ArrayList<Book>();
		String sql = "select* from Books where CategoryId = ?";
		
		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setInt(1, id);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			list.add(new Book(rs.getInt("Id"), rs.getString("Name"), rs.getString("Author"), rs.getInt("Amount"),
					rs.getInt("Price"), rs.getString("Img"), rs.getInt("CategoryId"), rs.getDate("DateAdd")));
		}
		rs.close();
		ps.close();
		DB.close();
		return list;
	}

	public ArrayList<Book> getBooksByKey(String key) throws Exception {
		key = "%"+key+"%";
		ConnectDB DB = new ConnectDB();
		ArrayList<Book> list = new ArrayList<Book>();
		String sql = "select* from Books where Name like ? or Author like ?";
		
		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setString(1, key);
		ps.setString(2, key);
		ResultSet rs = ps.executeQuery();
		while (rs.next()) {
			list.add(new Book(rs.getInt("Id"), rs.getString("Name"), rs.getString("Author"), rs.getInt("Amount"),
					rs.getInt("Price"), rs.getString("Img"), rs.getInt("CategoryId"), rs.getDate("DateAdd")));
		}
		rs.close();
		ps.close();
		DB.close();
		return list;
	}

	public ArrayList<Book> getBooks(int top) throws Exception {
		ConnectDB DB = new ConnectDB();
		ArrayList<Book> list = new ArrayList<Book>();
		String sql = "select top " + top + " * from Books order by Id";

		Statement st = DB.connec().createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			list.add(new Book(rs.getInt("Id"), rs.getString("Name"), rs.getString("Author"), rs.getInt("Amount"),
					rs.getInt("Price"), rs.getString("Img"), rs.getInt("CategoryId"), rs.getDate("DateAdd")));
		}
		rs.close();
		st.close();
		DB.close();
		return list;
	}

	public ArrayList<Book> getBooks(int offset, int next) throws Exception {
		ConnectDB DB = new ConnectDB();
		ArrayList<Book> list = new ArrayList<Book>();
		String sql = "select* from Books order by Id offset " + offset + " rows fetch next " + next + " rows only";

		Statement st = DB.connec().createStatement();
		ResultSet rs = st.executeQuery(sql);
		while (rs.next()) {
			list.add(new Book(rs.getInt("Id"), rs.getString("Name"), rs.getString("Author"), rs.getInt("Amount"),
					rs.getInt("Price"), rs.getString("Img"), rs.getInt("CategoryId"), rs.getDate("DateAdd")));
		}
		rs.close();
		st.close();
		DB.close();
		return list;
	}
	
	public void addBook(String name, String author, int amount, int price, String img, int category) throws Exception
	{
		ConnectDB DB = new ConnectDB();
		String sql = "insert into Books(Name,Author,Amount,Price,Img,CategoryId) values(?,?,?,?,?,?)";
		
		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setString(1, name);
		ps.setString(2, author);
		ps.setInt(3, amount);
		ps.setInt(4, price);
		ps.setString(5, img);
		ps.setInt(6, category);
		ps.executeUpdate();
		ps.close();
		DB.close();
	}
	
	public void updateBook(Book b) throws Exception
	{
		ConnectDB DB = new ConnectDB();
		String sql = "update Books set Name = ?,Author = ?,Amount = ?,Price = ?,Img = ?,CategoryId = ? where Id = ?";
		
		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setString(1, b.getName());
		ps.setString(2, b.getAuthor());
		ps.setInt(3, b.getAmount());
		ps.setInt(4, b.getPrice());
		ps.setString(5, b.getImg());
		ps.setInt(6, b.getCategoryId());
		ps.setInt(7, b.getId());
		ps.executeUpdate();
		ps.close();
		DB.close();
	}
	
	public void deleteBook(int id) throws Exception
	{
		ConnectDB DB = new ConnectDB();
		String sql = "update Books set Status = 0 where Id = ?";
		
		PreparedStatement ps = DB.connec().prepareStatement(sql);
		ps.setInt(1, id);
		ps.executeUpdate();
		ps.close();
		DB.close();
	}
}
