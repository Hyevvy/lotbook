package app.impl.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.Order;
import app.frame.DaoFrame;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;
import app.impl.order.OrderDaoImpl;

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
	public int modify(Order v) throws Exception {
		return 0;

	}

	@Override
	public int remove(Order k) throws Exception {
		return 0;

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
