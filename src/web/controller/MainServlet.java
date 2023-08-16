package web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import app.cust.CustServiceImpl;
import app.dto.Cust;

/**
 * Servlet implementation class CustServlet
 */
@WebServlet({"/main"})
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CustServiceImpl custService;
	
    public MainServlet() {
        super();
        custService = new CustServiceImpl();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String next = "index.jsp";
		String view = request.getParameter("view");

		if(view != null){
			build(request, view);
		}

		RequestDispatcher rd = 
		request.getRequestDispatcher(next);
		rd.forward(request, response);
	}


	private void build(HttpServletRequest request,
			String view){
		if(view.equals("signup")){
			request.setAttribute("center", "signup");
		}else if(view.equals("signin")){
			request.setAttribute("center", "signin");
		}else if(view.equals("loginimpl")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			// 로그인
		}else if(view.equals("mypage")){
			request.setAttribute("center", "mypage");
		}else if(view.equals("checkout")){
			request.setAttribute("center", "checkout");
		}else if(view.equals("contact")){
			request.setAttribute("center", "contact");
		}else if(view.equals("shop-details")){
			request.setAttribute("center", "shop-details");
		}else if(view.equals("shop-grid")){
			request.setAttribute("center", "shop-grid");
		}else if(view.equals("shoping-cart")){
			request.setAttribute("center", "shoping-cart");
		}
		
	}
}
