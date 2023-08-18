package app.impl.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Order;
import app.frame.DaoFrame;

public class OrderDaoImpl implements DaoFrame<Order, Order> {

	@Override
	public int insert(Order v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("order.insert", v);
	}

	@Override
	public int update(Order v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("order.update", v);
	}

	@Override
	public int delete(Order k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("order.delete", k);
	}

	@Override
	public Order select(Order k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("order.select", k);
	}

	@Override
	public List<Order> select(SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("order.selectall");
	}

	

}
