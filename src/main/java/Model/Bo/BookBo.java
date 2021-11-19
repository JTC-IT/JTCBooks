package Model.Bo;

import java.util.ArrayList;

import Model.Bean.*;
import Model.Dao.*;

public class BookBo {
	BookDao bookDao = new BookDao();

	public ArrayList<Book> getBooks() throws Exception {
		return bookDao.getBooks(12);
	}

	public ArrayList<Book> getBooksMore(int offset) throws Exception {
		return bookDao.getBooks(offset, 6);
	}

	public Book getBook(int id) throws Exception {
		return bookDao.getBook(id);
	}

	public ArrayList<Book> searchCategory(int category) throws Exception {
		return bookDao.getBooksByCategory(category);
	}

	public ArrayList<Book> Search(String key) throws Exception {
		key = key.trim().toLowerCase();
		return bookDao.getBooksByKey(key);
	}
	
	public int getTotalBooks(int idCategory) throws Exception {
		return bookDao.getTotalBooks(idCategory);
	}
	
	public void addBook(String name, String author, int amount, int price, String img, int category) throws Exception
	{
		bookDao.addBook(name, author, amount, price, img, category);
	}
	
	public void updateBook(Book b) throws Exception
	{
		bookDao.updateBook(b);
	}
	
	public void deleteBook(int id) throws Exception
	{
		bookDao.deleteBook(id);
	}
}
