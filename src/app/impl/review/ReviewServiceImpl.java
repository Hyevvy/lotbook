package app.impl.review;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Review;
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
			throw new Exception("ER1001");
		} finally {
			session.close();
		}
		return result;
		
	}

	@Override
	public int modify(Review v) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int remove(Review k) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Review get(Review k) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Review> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
