package app.impl.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Product;
import app.dto.entity.Review;
import app.frame.DaoFrame;

public class ReviewDaoImpl implements DaoFrame<Review, Review>{

	@Override
	public int insert(Review v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Review v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Review k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Review select(Review k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> select(SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public List<Review> selectReviewsByProduct(Product k, SqlSession session) throws Exception {
		List<Review> reviews = session.selectList("review.selectReviewsByProduct", k);
		//TODO: Modify DTO
		return reviews;
	}

}
