package web.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;

import app.dto.entity.Member;
import app.dto.entity.Review;
import app.frame.ControllerFrame;
import app.impl.member.MemberServiceImpl;
import app.impl.review.ReviewServiceImpl;

/**
* Servlet implementation class ReviewServlet
*/
@WebServlet({"/review"})
public class ReviewServlet implements ControllerFrame {
	private ReviewServiceImpl reviewServiceImpl;
	private MemberServiceImpl memberServiceImpl;
	
	public ReviewServlet() {
        super();
        reviewServiceImpl = new ReviewServiceImpl();
        memberServiceImpl = new MemberServiceImpl();
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
				long orderdetailSequence = Long.parseLong(request.getParameter("orderdetailSequence"));
				int rating = Integer.parseInt(request.getParameter("rating"));
				String comment = request.getParameter("comment");
				
				Review reviewInfo = Review.builder()
						.rating(rating)
						.comment(comment)
						.memberSequence(memberSequence)
						.productSequence(productSequence)
						.orderdetailSequence(orderdetailSequence)
						.build();

				try {
					// 리뷰 등록
					reviewServiceImpl.register(reviewInfo);
					// 포인트 적립 
					memberServiceImpl.updatePoint(memberSequence);
					
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
			}else if(cmd.equals("delete")){
				long sequence = Long.parseLong(request.getParameter("sequence"));
				
				Review reviewInfo = Review.builder()
						.sequence(sequence)
						.build();
				
				try {
					HttpSession session = request.getSession();
					reviewServiceImpl.remove(reviewInfo);
					request.setAttribute("center", "mypage");
					return "main.bit?view=mypage&memberSeq="+((Member)session.getAttribute("logincust")).getSequence();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return "mypage";
	 }
}
