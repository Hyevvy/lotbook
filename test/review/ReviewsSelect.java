package review;


import java.util.List;
import java.util.logging.Logger;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;

import app.dto.entity.Product;
import app.dto.entity.Review;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;
import app.impl.review.ReviewDaoImpl;

public class ReviewsSelect {
	private final static Logger LOGGER = Logger.getLogger(ReviewsSelect.class.getName());
	ServiceFrame<Review, Review> service;
	
	@Before
	public void before() throws Exception {
//		SqlSession session;
//		session = GetSessionFacroty.getInstance().openSession();
//		ReviewDaoImpl dao = new ReviewDaoImpl();
		
//		service = new ReviewServiceImpl();
		
	}

	@Test
	public void test() {
		SqlSession session;
		session = GetSessionFacroty.getInstance().openSession();
		ReviewDaoImpl dao = new ReviewDaoImpl();
		
		Product product = Product.builder()
								 .sequence(1)
								 .build();
		
				
		try {
			List<Review> reviews = dao.selectReviewsByProduct(product, session);
			 reviews.forEach(review -> {
	                LOGGER.info(review.toString());
	                assert review.getProductSequence() == product.getSequence() : "Product sequence in review does not match expected value";
	            });
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

}
