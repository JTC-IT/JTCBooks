package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Bo.BillBo;

/**
 * Servlet implementation class AceptBillControl
 */
@WebServlet("/AceptBill")
public class AceptBillControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AceptBillControl() {
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
			
			String id = request.getParameter("id");
			String acept = request.getParameter("acept");
			
			BillBo billBo = new BillBo();
			
			if(id != null && id != "") {
				if(acept.equals("1"))
					billBo.aceptBill(Integer.parseInt(id));
				else if(acept.equals("0"))
					billBo.removeBill(Integer.parseInt(id));
			}
			
			//get list bill history
			request.setAttribute("listBills", billBo.getBills());

			// get quantity bills
			request.setAttribute("quantityBill", billBo.getQuantityBills());

			// show home
			RequestDispatcher rd = request.getRequestDispatcher("AceptBill.jsp");
			rd.forward(request, response);
			
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
