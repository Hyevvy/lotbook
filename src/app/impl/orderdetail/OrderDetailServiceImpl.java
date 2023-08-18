package app.impl.orderdetail;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.OrderDetail;
import app.frame.DaoFrame;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;

public class OrderDetailServiceImpl implements ServiceFrame<OrderDetail, OrderDetail> {
	DaoFrame<OrderDetail, OrderDetail> dao;
	SqlSession session;

	public OrderDetailServiceImpl() {
		super();
		dao = new OrderDetailDaoImpl();
	}

	@Override
	public int register(OrderDetail v) throws Exception {
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
	public int modify(OrderDetail v) throws Exception {
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
	public int remove(OrderDetail k) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public OrderDetail get(OrderDetail k) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();

		OrderDetail orderDetail = null;

		try {
			orderDetail = dao.select(k, session);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ER1001");
		} finally {
			session.close();
		}
		
		return orderDetail;
	}

	@Override
	public List<OrderDetail> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
