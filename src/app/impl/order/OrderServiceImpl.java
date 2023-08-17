package app.impl.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.Member;
import app.dto.Order;
import app.frame.DaoFrame;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;

public class OrderServiceImpl implements ServiceFrame<Order, Order> {
	DaoFrame<Order, Order> dao;
	SqlSession session;

	public OrderServiceImpl() {
		super();
		dao = new OrderDaoImpl();
	}

	@Override
	public int register(Order v) throws Exception {
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
	public void modify(Order v) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void remove(Order k) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public Order get(Order k) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();

		Order order = null;

		try {
			order = dao.select(k, session);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ER1001");
		} finally {
			session.close();
		}

		return order;
	}

	@Override
	public List<Order> get() throws Exception {
		return null;
	}

}
