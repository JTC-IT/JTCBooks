package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Bean.Book;
import Model.Bo.BookBo;

/**
 * Servlet implementation class SearchBooksControl
 */
@WebServlet("/SearchBooks")
public class SearchBooksControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchBooksControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			BookBo bookBo = new BookBo();

			String key = request.getParameter("key");
			String category = request.getParameter("category");
			ArrayList<Book> listBook;

			if (key != null && key != "")
				listBook = bookBo.Search(key);
			else if (category != null)
				listBook = bookBo.searchCategory(Integer.parseInt(category));
			else
				listBook = bookBo.getBooks();

			PrintWriter out = response.getWriter();
			for (Book book : listBook) {
				out.print("<tr>\r\n"
				+ "								<td><input type=\"checkbox\" class=\"checkthis\" value=\""+book.getId()+"\"/></td>\r\n"
				+ "								<td><img src=\"./IMG/"+book.getImg()+"\" width=\"40\" height=\"50\" alt=\"Sách\" class=\"border\"></td>\r\n"
				+ "								<td class=\"text-truncate\">"+book.getName()+"</td>\r\n"
				+ "								<td class=\"text-truncate\">"+book.getAuthor()+"</td>\r\n"
				+ "								<td>"+book.getAmount()+"</td>\r\n"
				+ "								<td>"+book.priceToString() +"</td>\r\n"
				+ "								<td class=\"text-truncate\">"+book.dateAddToString()+"</td>\r\n"
				+ "								<td><p data-placement=\"top\" data-toggle=\"tooltip\"\r\n"
				+ "										title=\"Edit\">\r\n"
				+ "										<a href=\"UpdateBook?id="+book.getId()+"\" class=\"btn btn-primary btn-xs\" role=\"button\">\r\n"
				+ "											<ion-icon name=\"create-outline\"></ion-icon>\r\n"
				+ "										</a>\r\n"
				+ "									</p>\r\n"
				+ "								</td>\r\n"
				+ "								<td><p data-placement=\"top\" data-toggle=\"tooltip\"\r\n"
				+ "										title=\"Delete\">\r\n"
				+ "										<button class=\"btn btn-danger btn-xs\" data-title=\"Delete\"\r\n"
				+ "											data-toggle=\"modal\" data-target=\"#delete\" \r\n"
				+ "											onclick=\"selectedBook("+book.getId()+")\">\r\n"
				+ "											<ion-icon name=\"trash-outline\"></ion-icon>\r\n"
				+ "										</button>\r\n"
				+ "									</p>\r\n"
				+ "								</td>\r\n"
				+ "							</tr>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
