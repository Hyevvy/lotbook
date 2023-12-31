package app.impl.review;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Member;
import app.dto.entity.Review;
import app.dto.response.ReviewDetails;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;

public class ReviewServiceImpl implements ServiceFrame<Review, Review>{
	ReviewDaoImpl dao;
	SqlSession session;
	
	
	public ReviewServiceImpl() {
		super();
		dao = new ReviewDaoImpl();
	}

	@Override
	public int register(Review v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		
		int result = 0;
		try {
			result = dao.insert(v, session);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new Exception("ER7001 - 리뷰 생성 에러");
		} finally {
			session.close();
		}
		return result;
		
	}

	@Override
	public int modify(Review v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		
		int result = 0;
		try {
			result = dao.update(v, session);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new Exception("ER7002 - 리뷰 수정 에러");
		} finally {
			session.close();
		}
		
		return result;
	}

	@Override
	public int remove(Review k) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		int result = 0;
		try {
			result = dao.delete(k, session);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new Exception("ER7003 - 리뷰 삭제 에러");
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public Review get(Review k) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();

		Review review = null;

		try {
			review = dao.selectReviewByOrderdetail(k, session);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ER7004");
		} finally {
			session.close();
		}

		return review;
	}

	@Override
	public List<Review> get() throws Exception {
		return null;
	}
	
	public List<ReviewDetails> get(Member member) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		List<ReviewDetails> reviewDetail = new ArrayList<>();
		try {
			reviewDetail = dao.selectReviewsByMember(member, session);
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("ER7005");
		} finally {
			session.close();
		}
		return reviewDetail;
	}

}
