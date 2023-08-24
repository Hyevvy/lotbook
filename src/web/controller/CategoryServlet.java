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
import web.dispatcher.Navi;

/**
 * Servlet implementation class CustServlet
 */
@WebServlet({"/category"})
public class CategoryServlet extends HttpServlet implements ControllerFrame {
	private static final long serialVersionUID = 1L;
	
	CustServiceImpl service = null;
	

    public CategoryServlet() {
        super();
        service = new CustServiceImpl();
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
            build(request, view);
        }

        RequestDispatcher rd = request.getRequestDispatcher(next);
        rd.forward(request, response);
    }

    
	private void build(HttpServletRequest request, String view) {
	    if (view.equals("computer")) {
	        request.setAttribute("center", "category");
	        request.setAttribute("navi", Navi.category);
	    } else if (view.equals("test")) {
	        // ...
	    } else if (view.equals("getall")){
	        // 기본값 설정 또는 처리
	    } else {
	    	
	    }
	}



}
