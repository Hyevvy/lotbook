package app.impl.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Member;
import app.dto.entity.Product;
import app.dto.entity.Review;
import app.dto.mapper.ReviewWithNameMapper;
import app.dto.response.ReviewDetails;
import app.frame.DaoFrame;

public class ReviewDaoImpl implements DaoFrame<Review, Review>{

	@Override
	public int insert(Review v, SqlSession session) throws Exception {
		return session.insert("review.insert", v);
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
	
	public List<ReviewWithNameMapper> selectReviewsByProduct(Product k, SqlSession session) throws Exception {
		List<ReviewWithNameMapper> reviews = session.selectList("review.selectReviewsByProduct", k);
		//TODO: Modify DTO
		return reviews;
	}
	
	public List<ReviewDetails> selectReviewsByMember(Member k, SqlSession session) throws Exception {
		List<ReviewDetails> reviews = session.selectList("review.selectReviewsByMember", k);
		return reviews;
	}

}
