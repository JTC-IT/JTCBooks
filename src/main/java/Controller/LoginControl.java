package Controller;

import java.io.IOException;
import java.io.PrintWriter;

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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String uname = request.getParameter("username");
		String pass = request.getParameter("pass");
		
		PrintWriter out = response.getWriter();
		boolean mes = false;
		JSONObject json = new JSONObject();
		
		if(uname != null && pass != null) {
			Customer user = new CustomerBo().Login(uname, pass);
			if(user != null) {
				session.setAttribute("user", user);
				mes = true;
			}else mes = false;
		}
		json.put("mes", mes);
		out.print(json.toJSONString());
		out.flush();
	}

}
