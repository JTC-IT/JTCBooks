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
 * Servlet implementation class SearchControl
 */
@WebServlet("/SearchControl")
public class SearchControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchControl() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
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
			for (Book s : listBook) {
				out.print("<div class=\"col-sm-4 pb-3 bookItem\">\r\n" + "<div class=\"card\">\r\n"
						+ "		<div class=\"card-body d-flex flex-column align-items-center\">\r\n"
						+ "			<img alt=\"" + s.getName() + "\" src=\"IMG/" + s.getImg() + "\">\r\n"
						+ "			<div class=\"card-content d-flex flex-column align-items-center mt-3 justify-content-between\">\r\n"
						+ "				<div class=\"w-100\">\r\n"
						+ "					<div class=\"font-weight-bold text-center text-truncate\">" + s.getName()
						+ "</div>\r\n" + "					<small class=\"text-primary text-center text-truncate\">"
						+ s.getAuthor() + "</small>\r\n" + "				</div>\r\n"
						+ "				<div class=\"w-100 mt-3 d-flex align-items-end justify-content-between\">\r\n"
						+ "					<strong class=\"text-danger\">" + s.priceToString() + "</strong>\r\n"
						+ "					<a class=\"btn btn-outline-success\" href=\"OrderControl?id=" + s.getId()
						+ "\" role=\"button\">Mua</a>\r\n" + "				</div>\r\n" + "			</div>\r\n"
						+ "		</div>\r\n" + "	</div>\r\n" + "	</div>");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
