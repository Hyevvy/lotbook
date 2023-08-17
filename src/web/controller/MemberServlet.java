package web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import app.dto.entity.Member;
import app.impl.member.MemberServiceImpl;
import web.dispatcher.Navi;

/**
* Servlet implementation class CustServlet
*/
@WebServlet({"/member"})
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private MemberServiceImpl memServiceImpl;
	private Logger user_log = Logger.getLogger("user");
	
    public MemberServlet() {
        super();
        memServiceImpl = new MemberServiceImpl();
        bCryptPasswordEncoder = new BCryptPasswordEncoder();
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
				user_log.debug("로그인된 이메일 정보: "+loginUser);
				if(loginUser!=null) {
					HttpSession session = request.getSession();
					session.setAttribute("logincust",loginUser);
				} else {
					request.setAttribute("center", "signin");
					request.setAttribute("errMsg", "email 또는 password가 일치하지 않습니다.");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}
}