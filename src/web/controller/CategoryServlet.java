package web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.cust.CustServiceImpl;
import app.dto.entity.Cust;
import app.frame.ControllerFrame;
import app.impl.category.CategoryServiceImpl;
import web.dispatcher.Navi;

/**
 * Servlet implementation class CustServlet
 */
@WebServlet({"/category"})
public class CategoryServlet extends HttpServlet implements ControllerFrame {
	private static final long serialVersionUID = 1L;
	private CategoryServiceImpl categoryServiceImpl;
	

    public CategoryServlet() {
        super();
        categoryServiceImpl = new CategoryServiceImpl();
    }

    
    @Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String next = "index.jsp";
		String view = request.getParameter("view");

		if (view != null) {
			build(request, view);
		}

		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String next = "index.jsp";
        String view = request.getParameter("view");
        
        if (view != null) {
            try {
				build(request, view);
			} catch (Exception e) {
				e.printStackTrace();
			}
        }

        RequestDispatcher rd = request.getRequestDispatcher(next);
        rd.forward(request, response);
    }

    
	private void build(HttpServletRequest request, String view) throws Exception {
		if (view.equals("1") || view.equals("6") || view.equals("10")) {
	    	request.setAttribute("selectCategory",categoryServiceImpl.selectCategoryByView(view));
	    	request.setAttribute("center", "category");
	    } 
		else {
			request.setAttribute("selectCategory",categoryServiceImpl.selectCategoryByView(view));
	    	request.setAttribute("center", "category");
	    }
	}



}
