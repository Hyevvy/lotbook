package app.impl.orderdetail;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.web.bind.annotation.RequestParam;

import app.dto.entity.OrderDetail;
import app.dto.response.OrderDetailResponse;
import app.frame.DaoFrame;

public class OrderDetailDaoImpl implements DaoFrame<OrderDetail, OrderDetail> {

	@Override
	public int insert(OrderDetail v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.insert("orderdetail.insert", v);
	}

	@Override
	public int update(OrderDetail v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.update("orderdetail.updateOrderDetailState", v);
	}

	@Override
	public int delete(OrderDetail k, SqlSession session) throws Exception {
		// 현재는 구현 x
		return 0;
	}

	@Override
	public OrderDetail select(OrderDetail k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne("orderdetail.selectOne", k);
	}
	
	
	
	public List<OrderDetailResponse> selectAll(@RequestParam("orderId")long orderId, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return session.selectList("orderdetail.selectAllOrderDetailByOrderSequence", Integer.toString((int) orderId));
	}

	@Override
	public List<OrderDetail> select(SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
