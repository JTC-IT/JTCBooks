package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Bo.BillBo;
import Model.Bo.BookBo;
import Model.Bo.CategoryBo;

/**
 * Servlet implementation class BooksManageControl
 */
@WebServlet("/BooksManage")
public class BooksManageControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BooksManageControl() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			// get list Category Books
			CategoryBo categoryBo = new CategoryBo();
			request.setAttribute("listCategory", categoryBo.getCategorys());

			// get list Books
			BookBo bookBo = new BookBo();
			request.setAttribute("listBook", bookBo.getBooks());

			// get quantity bills
			BillBo billBo = new BillBo();
			request.setAttribute("quantityBill", billBo.getQuantityBills());

			// show 
			RequestDispatcher rd = request.getRequestDispatcher("BooksManage.jsp");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
