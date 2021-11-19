package Controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import Model.Bo.BillBo;
import Model.Bo.BookBo;
import Model.Bo.CategoryBo;

/**
 * Servlet implementation class AddBookControl
 */
@WebServlet("/AddBook")
public class AddBookControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddBookControl() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			
			DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(fileItemFactory);

			List<FileItem> fileItems = upload.parseRequest(request);//Lấy về các đối tượng gửi lên
			
			BookBo bookBo = new BookBo();
			String Name = "";
			String Author = "";
			String Img = "";
			int Amount = 0;
			int Price = 0;
			int CategoryId = 0;
			
			for (FileItem fileItem : fileItems) {
				if (!fileItem.isFormField()){//Nếu ko phải các control=>upfile lên
					String img_name = CategoryId +"_"+ (bookBo.getTotalBooks(CategoryId)+1);
					Img = fileItem.getName();
					
					if (!Img.equals("")) {
				        //Lấy đường dẫn hiện tại
						String dirUrl = request.getServletContext().getRealPath("") + "IMG";
						File dir = new File(dirUrl);
						
						if (!dir.exists())//nếu ko có thư mục thì tạo ra
							dir.mkdir();
						
						Img = img_name + "." + Img.split("[.]")[1].trim();
				        File file = new File(dirUrl + File.separator + Img);//tạo file
			            try {
			            	fileItem.write(file);//lưu file
						} catch (Exception e) {
						    e.printStackTrace();
						}
					}
				}
				else//Neu la control
				{
					switch(fileItem.getFieldName().trim()) {
						case "name": Name = fileItem.getString(request.getCharacterEncoding());
							break;
						case "author": Author = fileItem.getString(request.getCharacterEncoding());
							break;
						case "amount": Amount = Integer.parseInt(fileItem.getString());
							break;
						case "price": Price = Integer.parseInt(fileItem.getString());
							break;
						case "category": CategoryId = Integer.parseInt(fileItem.getString());
							break;
					}
				}
			}
			bookBo.addBook(Name, Author, Amount, Price, Img, CategoryId);
			
			response.sendRedirect("BooksManage");
		} catch (Exception e) {
			try {
				// get list Category Books
				CategoryBo categoryBo = new CategoryBo();
				request.setAttribute("listCategory", categoryBo.getCategorys());
				
				// get quantity bills
				BillBo billBo = new BillBo();
				request.setAttribute("quantityBill", billBo.getQuantityBills());
				
				RequestDispatcher rd = request.getRequestDispatcher("AddBook.jsp");
				rd.forward(request, response);
				return;
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
