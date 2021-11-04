package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import Model.Bo.CustomerBo;

/**
 * Servlet implementation class RegisterControl
 */
@WebServlet("/Register")
public class RegisterControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterControl() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setAttribute("exist", "0");
		//show Login
		RequestDispatcher rd = request.getRequestDispatcher("Login.jsp");
		rd.forward(request, response);
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String name = request.getParameter("name").trim();
			String phone = request.getParameter("phone").trim();
			String email = request.getParameter("email").trim();
			String address = request.getParameter("address").trim();
			String pass = request.getParameter("pass").trim();
			
			CustomerBo Bo = new CustomerBo();
			PrintWriter out = response.getWriter();
			int mes = 0;
			JSONObject json = new JSONObject();
			
			if(name != null && phone != null && email != null && pass != null) {
				mes = Bo.Register(name, phone, email, address, pass);
			}
			json.put("mes", mes);
			out.print(json.toJSONString());
			out.flush();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
