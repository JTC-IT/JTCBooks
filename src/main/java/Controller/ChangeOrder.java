package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Model.Bo.CartBo;

/**
 * Servlet implementation class ChangeOrder
 */
@WebServlet("/ChangeOrder")
public class ChangeOrder extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangeOrder() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");

		String bookId = request.getParameter("id");
		String amount = request.getParameter("amount");

		HttpSession session = request.getSession();
		PrintWriter out = response.getWriter();

		CartBo cart = (CartBo) session.getAttribute("cart");

		if (amount != null && cart != null) {
			if (amount.equals("-1")) {
				cart.clearCart();
				out.print("0 đ");
			} else if (bookId != null) {
				if (amount.equals("0")) {
					cart.removeItem(Integer.parseInt(bookId));
					out.print(cart.getThanhTien());
				} else {
					String result = cart.setAmount(Integer.parseInt(bookId), Integer.parseInt(amount));
					if (result != null)
						out.print(result + ";" + cart.getThanhTien());
				}
			}
			session.setAttribute("cart", cart);
		} else
			out.print("0 đ");
	}
}
