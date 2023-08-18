package web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import app.dto.entity.Product;
import app.impl.product.ProductServiceImpl;

/**
* Servlet implementation class CustServlet
*/
@WebServlet({"/product"})
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductServiceImpl productServiceImpl;
	private Logger user_log = Logger.getLogger("user");
	
    public ProductServlet() {
        super();
        productServiceImpl = new ProductServiceImpl();
    }
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String next = "index.jsp";
		String view = "ad";
		
		if(view != null){
			
			build(request, view);
		}

		RequestDispatcher rd = 
		request.getRequestDispatcher(next);
		rd.forward(request, response);
	}
    
    private List<Product> build(HttpServletRequest request,
			String view){
    	
    	ProductServiceImpl service;
		service = new ProductServiceImpl();
		List<Product> product = null;
		try {
			product = service.getLatest();
			
			System.out.println(product);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.setAttribute("clist", product);
		System.out.println("프로덕트");
		System.out.println(product);
		return product;
		
	}
}
