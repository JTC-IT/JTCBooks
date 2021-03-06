package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import Model.Bean.Customer;
import Model.Bo.CustomerBo;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginControl() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setAttribute("exist", "1");
		// show Login
		RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			HttpSession session = request.getSession();
			String uname = request.getParameter("username");
			String pass = request.getParameter("pass");

			PrintWriter out = response.getWriter();
			int mes = -1;
			JSONObject json = new JSONObject();

			if (uname != null && pass != null) {
				Customer user = new CustomerBo().Login(uname, pass);
				if (user != null) {
					session.setAttribute("user", user);
					if(user.isAdmin())
						mes = 1;
					else mes = 0;
				} else
					mes = -1;
			}
			json.put("mes", mes);
			out.print(json.toJSONString());
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
