package app.impl.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.Cust;
import app.frame.DaoFrame;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;

public class CustServiceImpl implements ServiceFrame<String, Cust>{

	DaoFrame<String, Cust> dao;
	SqlSession session;
	
	public CustServiceImpl() {
		dao = new CustDaoImpl();
		session = GetSessionFacroty.getInstance().openSession();
	}
	
	@Override
	public void register(Cust v) throws Exception {
		try{
			dao.insert(v, session);		
//			dao.insert(v, session);		
			session.commit();
		}
		catch(Exception e) {
			session.rollback();
			throw new Exception("ER0001");
		}
	}

	@Override
	public void modify(Cust v) throws Exception {
		try{
			dao.update(v, session);		
//			dao.insert(v, session);		
			session.commit();
		}
		catch(Exception e) {
			session.rollback();
			throw new Exception("ER0001");
		}
	}
		

	@Override
	public void remove(String k) throws Exception {
		try{
			dao.delete(k, session);		
			session.commit();
		}
		catch(Exception e) {
			session.rollback();
			throw new Exception("ER0001");
		}
	}
		

	@Override
	public Cust get(String k) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();

		Cust cust = null;
		try {
			cust = dao.select(k, session);
		}catch(Exception e) {
			throw new Exception("ER0003");
		}finally {
			session.close();
		}
		return cust;
	}

	@Override
	public List<Cust> get() throws Exception {
		List<Cust> list = null;
		try{
			list = dao.select(session);
		}
		catch(Exception e) {
			throw new Exception("ER0001");
		}
		return list;
	}

}
