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
import web.dispatcher.Navi;

/**
 * Servlet implementation class CustServlet
 */
@WebServlet({"/cust"})
public class CustServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	CustServiceImpl service = null;
	

    public CustServlet() {
        super();
        service = new CustServiceImpl();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String next = "main.jsp";
		String view = request.getParameter("view");
		System.out.println(request);
		System.out.println(next);
		System.out.println(view);

		if(view != null){
			build(request, view);
		}

		RequestDispatcher rd = 
				request.getRequestDispatcher(next);
				rd.forward(request, response);
	}
	private void build(HttpServletRequest request,
			String view){
		if(view.equals("register")){
			
			request.setAttribute("center", "cust/register");
			request.setAttribute("navi", Navi.custRegister);
		}else if(view.equals("getall")){
			List<Cust> list = null;
			try {
				list = service.get();
				request.setAttribute("clist", list);
			} catch (Exception e) {
				e.printStackTrace();
			}
			request.setAttribute("center", "cust/getall");
			request.setAttribute("navi", Navi.custGet);
		}
		
	}


}
