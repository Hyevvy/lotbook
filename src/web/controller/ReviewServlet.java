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

import app.dto.entity.Member;
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
		String next = "mypage.jsp";
		String cmd = request.getParameter("cmd");

		next = build(request, cmd);

		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}
	
	 private String build(HttpServletRequest request,
				String cmd){
		 	if (cmd == null) {
		 		System.out.println("리뷰 요청");
		 	}
			if(cmd.equals("register")){
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
			}else if(cmd.equals("update")){
				long sequence = Long.parseLong(request.getParameter("sequence"));
				long memberSequence = Long.parseLong(request.getParameter("memberSequence"));
				long productSequence = Long.parseLong(request.getParameter("productSequence"));
				int rating = Integer.parseInt(request.getParameter("rating"));
				String comment = request.getParameter("comment");
				
				Review reviewInfo = Review.builder()
						.sequence(sequence)
						.rating(rating)
						.comment(comment)
						.memberSequence(memberSequence)
						.productSequence(productSequence)
						.build();
				
				try {
					HttpSession session = request.getSession();
					reviewServiceImpl.modify(reviewInfo);
					request.setAttribute("center", "mypage");
					return "main.bit?view=mypage&memberSeq="+((Member)session.getAttribute("logincust")).getSequence();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return "mypage";
	 }
}
