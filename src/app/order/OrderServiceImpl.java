package app.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.Member;
import app.frame.DaoFrame;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;

public class OrderServiceImpl implements ServiceFrame<Member, Member>{
	DaoFrame<Member, Member> dao;
	SqlSession session;
	
	
	
	public OrderServiceImpl() {
		super();
		dao = new OrderDaoImpl();
	}

	@Override
	public void register(Member v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void modify(Member v) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void remove(Member k) throws Exception {
		// TODO Auto-generated method stub
		
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
	
}
