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
import Model.Bo.BillBo;
import Model.Bo.CartBo;

/**
 * Servlet implementation class HistoryOrderControl
 */
@WebServlet("/HistoryOrder")
public class HistoryOrderControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");

			// get session
			HttpSession session = request.getSession();
			
			//get user
			Customer user = (Customer) session.getAttribute("user");
			if(user == null)
				response.sendRedirect("Login");
			else {
				//get list bill history
				BillBo billBo = new BillBo();
				request.setAttribute("listBills", billBo.getBills(user.getId()));

				// get length Cart
				CartBo Cart = (CartBo) session.getAttribute("cart");
				if (Cart != null)
					request.setAttribute("lengthCart", Cart.size());

				// show home
				RequestDispatcher rd = request.getRequestDispatcher("HistoryOrder.jsp");
				rd.forward(request, response);
			}
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
