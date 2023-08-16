package web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import app.dto.Member;
import app.mem.MemServiceImpl;
import web.dispatcher.Navi;

/**
 * Servlet implementation class CustServlet
 */
@WebServlet({"/main"})
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemServiceImpl memServiceImpl;
	
    public MainServlet() {
        super();
        // TODO Auto-generated constructor stub
        memServiceImpl = new MemServiceImpl();
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
			request.setAttribute("center", "signin");
			request.setAttribute("navi", Navi.login);
		}else if(view.equals("loginimpl")) {
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			Member loginInfo = Member.builder()
					.email(email)
					.hashedPwd(password)
					.build();
			
			try {
				Member loginUser = memServiceImpl.get(loginInfo);
				if((loginUser.getEmail()).equals(email)) {
					HttpSession session = request.getSession();
					session.setAttribute("logincust",loginUser);
				} else {
					throw new Exception();
				}
			} catch (Exception e) {
				e.printStackTrace();
				request.setAttribute("center", "signin");
				request.setAttribute("errMsg", "email 또는 password가 일치하지 않습니다.");
			}
//			if(email.equals("aa") && password.equals("11")) {
//				HttpSession session = request.getSession();
//				Cust cust = new Cust("id01", "pwd01", "james");
//				session.setAttribute("logincust",cust);
//			}
		}else if(view.equals("custadd")){
			request.setAttribute("center", "cust/register");
		}else if(view.equals("productadd")){
			request.setAttribute("center", "product/register");
		}else if(view.equals("chart")){
			request.setAttribute("center", "chart/chart");
		}
		
	}
}
