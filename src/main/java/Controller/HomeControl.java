package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Bean.Customer;
import Model.Bo.BookBo;
import Model.Bo.CartBo;
import Model.Bo.CategoryBo;

/**
 * Servlet implementation class HomeControl
 */
@WebServlet("/Home")
public class HomeControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * 
     * @see HttpServlet#HttpServlet()
     */
    public HomeControl() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8") ;
		response.setCharacterEncoding("utf-8");
		
		//get session
		HttpSession session = request.getSession();

		//get list Category Books
		CategoryBo categoryBo = new CategoryBo();
		request.setAttribute("listCategory", categoryBo.getCategorys());
		
		//get list Books
		BookBo bookBo = new BookBo();
		request.setAttribute("listBook", bookBo.getBooks());
		
		//get User
		Customer user = (Customer) session.getAttribute("user");
		if(user != null)
			request.setAttribute("user", user);
		
		//get length Cart
		CartBo Cart = (CartBo)session.getAttribute("cart");
		if(Cart != null)
			request.setAttribute("lengthCart", Cart.size());
		
		//show home
		RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
