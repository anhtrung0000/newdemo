package Servlet;

import java.io.IOException;
import java.nio.file.Paths;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import javax.xml.ws.Response;

import BLL.admin_BLL;
import DTO.Product_DTO;

/**
 * Servlet implementation class Addproduct_Servlet
 */
@WebServlet("/Addproduct")
@MultipartConfig
public class Addproduct_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addproduct_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		admin_BLL admin= new admin_BLL();
		Product_DTO product = new Product_DTO();
		
		
		product.setProductCategoryId(admin.select_CategoryId(request.getParameter("Category")));
		product.setProductName(request.getParameter("name"));
		product.setPrice(Float.parseFloat(request.getParameter("price")));
		product.setColor(request.getParameter("color"));
		product.setSize(request.getParameter("size"));
		product.setDecription(request.getParameter("mota"));
		product.setImages(request.getParameter("img"));
		
		admin.addProduct(product);
		RequestDispatcher dispatcher = request.getRequestDispatcher("adminpage.jsp");
		dispatcher.forward(request, response);
	}

}
