package app.impl.member;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Member;
import app.frame.DaoFrame;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;

public class MemberServiceImpl implements ServiceFrame<Member, Member>{
	DaoFrame<Member, Member> dao;
	SqlSession session;
	
	
	public MemberServiceImpl() {
		super();
		dao = new MemberDaoImpl();
	}

	@Override
	public int register(Member v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		int result;
		try {
			result = dao.insert(v, session);
			session.commit();			
		} catch(Exception e){
			e.printStackTrace();
			throw new Exception("ER1002");
		} finally {
			session.close();
		}
		return result;
	}

	@Override
	public int modify(Member v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		
		int result = 0;
		try {
			result = dao.update(v, session);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ER1001");
		} finally {
			session.close();
		}
		
		return result;
	}

	@Override
	public int remove(Member k) throws Exception {
		return 0;
		
	}

	@Override
	public Member get(Member k) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		
		Member mem = null;
		
		try {
			mem = dao.select(k, session);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ER1001");
		} finally {
			session.close();
		}
		
		return mem;
	}

	@Override
	public List<Member> get() throws Exception {
		return null;
	}

	public int modifyInfo(Member v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		
		int result = 0;
		try {
			result = ((MemberDaoImpl) dao).updateInfo(v, session);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return result;
	}

	public int updatePoint(long memberSequence) {
		session = GetSessionFacroty.getInstance().openSession();
		
		int result = 0;
		try {
			result = ((MemberDaoImpl) dao).updatePoint(memberSequence, session);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return result;
		
	}
	
}
