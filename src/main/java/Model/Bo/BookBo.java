package Model.Bo;

import java.util.ArrayList;

import Model.Bean.*;
import Model.Dao.*;

public class BookBo {
	BookDao bookDao = new BookDao();
	
	public ArrayList<Book> getBooks(){
		return bookDao.getBooks(12);
	}
	
	public ArrayList<Book> getBooksMore(int offset){
		return bookDao.getBooks(offset, 6);
	}
	
	public Book getBook(int id) {
		for(Book b: bookDao.getBooks())
			if(b.getId() == id)
				return b;
		return null;
	}
	
	public ArrayList<Book> searchCategory(int category) {
	   ArrayList<Book> ds = bookDao.getBooks();
	   ArrayList<Book> tam = new ArrayList<Book>();
	   for(Book b: ds)
		   if(b.getCategoryId() == category)
			   tam.add(b);
	   return tam;
    }
	
	public ArrayList<Book> Search(String key) {
		key = key.trim().toLowerCase();
	    ArrayList<Book> ds= bookDao.getBooks();
	    ArrayList<Book> tam= new ArrayList<Book>();
	    for(Book s: ds)
	    	if(s.getName().toLowerCase().contains(key)||
				   s.getAuthor().toLowerCase().contains(key))
			   tam.add(s);
	    return tam;
	}
}