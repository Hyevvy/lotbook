package review;

import static org.junit.Assert.assertEquals;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import app.frame.GetSessionFacroty;
import app.impl.member.MemberDaoImpl;

public class ReviewUpdatePoint {

	@Test
	public void test() {
		SqlSession session;
		session = GetSessionFacroty.getInstance().openSession();
		MemberDaoImpl dao = new MemberDaoImpl();
		
		long memberSequence = 1; 
				
		try {
			int result = dao.updatePoint(memberSequence, session);
			assertEquals("리뷰 포인트가 적립되었습니다", result, 1);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

}
