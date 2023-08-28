package review;

import static org.junit.Assert.assertEquals;

import java.util.logging.Logger;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import app.dto.entity.Review;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;
import app.impl.review.ReviewDaoImpl;

public class ReviewSelectByProductAndMember {
	private final static Logger LOGGER = Logger.getLogger(ReviewsSelect.class.getName());
	ServiceFrame<Review, Review> service;
	
	@Test
	public void test() {
		SqlSession session;
		session = GetSessionFacroty.getInstance().openSession();
		ReviewDaoImpl dao = new ReviewDaoImpl();
		
		Review reviewInfo = Review.builder()
								 .orderdetailSequence(20)
								 .build();
				
		try {
			Review review = dao.selectReviewByOrderdetail(reviewInfo, session);
			assertEquals("리뷰가 존재하지 않습니다", review.getSequence(), 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

}
