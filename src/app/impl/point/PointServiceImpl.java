package app.impl.point;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Point;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;

public class PointServiceImpl implements ServiceFrame<Point, Point>{

	PointDaoImpl dao;
	SqlSession session;
	
	public PointServiceImpl() {
		super();
		dao = new PointDaoImpl();
	}

	@Override
	public int register(Point v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		int result = 0;
		try {
			result = dao.insert(v, session);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new Exception("ER6001 - 포인트 적립 에러");
		} finally {
			session.close();
		}
		
		return result;
	}

	@Override
	public int modify(Point v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		int result = 0;
		try {
			result = dao.update(v, session);
			System.out.println(result);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new Exception("ER6002 - 사용자 포인트 수정 에러");
		} finally {
			session.close();
		}
		
		return result;
	}

	@Override
	public int remove(Point k) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Point get(Point k) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public int getMemberSeq() throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		
		int result = 0;
		try {
			result = dao.selectMemberSeq(session);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new Exception("ER6003 - 사용자 정보 조회 에러");
		} finally {
			session.close();
		}
		
		return result;
	}
	@Override
	public List<Point> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Point> getAll(Point v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		List<Point> points = new ArrayList<>();
		try {
			points = dao.selectAll(v, session);
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("ER6004 - 포인트 조회 에러");
		} finally {
			session.close();
		}
		return points;
	}	
}
