package Model.Dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import Model.Bean.*;

public class BookDao {

	public BookDao() {
	}

	public ArrayList<Book> getBooks() throws Exception {
		ConnectDB DB = new ConnectDB();
		ArrayList<Book> list = new ArrayList<Book>();
		String sql = "select* from Books";

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
}
