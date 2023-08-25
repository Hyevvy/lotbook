package web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import app.dto.entity.Review;
import app.frame.ControllerFrame;
import app.impl.review.ReviewServiceImpl;

/**
* Servlet implementation class ReviewServlet
*/
@WebServlet({"/review"})
public class ReviewServlet implements ControllerFrame {
	private static final long serialVersionUID = 1L;
	
	private ReviewServiceImpl reviewServiceImpl;
	
	private Logger user_log = Logger.getLogger("user");
	
	public ReviewServlet() {
        super();
        reviewServiceImpl = new ReviewServiceImpl();
    }
	
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String next = "index.jsp";
		String view = request.getParameter("cmd");

		build(request, view);

		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}
	
	 private void build(HttpServletRequest request,
				String view){
		 	System.out.println("리뷰 등록!");
		 	if (view == null) {
		 		System.out.println("리뷰 요청");
		 	}
			if(view.equals("register")){
				long memberSequence = Long.parseLong(request.getParameter("memberSequence"));
				long productSequence = Long.parseLong(request.getParameter("productSequence"));
				int rating = Integer.parseInt(request.getParameter("rating"));
				String comment = request.getParameter("comment");
				
				System.out.println(memberSequence +" "+ productSequence +" "+ rating +" "+ comment);
				
				Review reviewInfo = Review.builder()
						.rating(rating)
						.comment(comment)
						.memberSequence(memberSequence)
						.productSequence(productSequence)
						.build();

				System.out.println("리뷰 등록!");
				try {
					reviewServiceImpl.register(reviewInfo);
					request.setAttribute("center", "mypage");
				} catch (Exception e) {
					e.printStackTrace();
				}
			}else if(view.equals("login")){
				request.setAttribute("center", "signin");
			}
	 }
}
