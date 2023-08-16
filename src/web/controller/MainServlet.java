package web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import app.dto.Cust;
import web.dispatcher.Navi;

/**
 * Servlet implementation class CustServlet
 */
@WebServlet({"/main"})
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
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
		if(view.equals("register")){
			request.setAttribute("center", "register");
			request.setAttribute("navi", Navi.register);
		}else if(view.equals("login")){
			request.setAttribute("center", "login");
			request.setAttribute("navi", Navi.login);
		}else if(view.equals("loginimpl")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			if(id.equals("aa") && pwd.equals("11")) {
				HttpSession session = request.getSession();
				Cust cust = new Cust("id01", "pwd01", "james");
				session.setAttribute("logincust",cust);
			}
		}else if(view.equals("custadd")){
			request.setAttribute("center", "cust/register");
		}else if(view.equals("productadd")){
			request.setAttribute("center", "product/register");
		}else if(view.equals("chart")){
			request.setAttribute("center", "chart/chart");
		}
		
	}
}
