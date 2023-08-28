package app.impl.orderdetail;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.OrderDetail;
import app.dto.response.OrderDetailResponse;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;
import app.impl.product.ProductDaoImpl;

public class OrderDetailServiceImpl implements ServiceFrame<OrderDetail, OrderDetail> {
	OrderDetailDaoImpl dao;
	ProductDaoImpl productDao;
	SqlSession session;

	public OrderDetailServiceImpl() {
		super();
		dao = new OrderDetailDaoImpl();
		productDao = new ProductDaoImpl();
	}

	@Override
	public int register(OrderDetail v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();

		int result = 0;
	
		try {
			result = dao.insert(v, session);
			if(result == 1) {
				// 성공
				productDao.updateByProductKeyWithSalesCount(v, session);
				
			} else {
				throw new Exception("주문 삽입 실패");
			}
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

	
	public List<OrderDetailResponse> get(long orderId) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		List<OrderDetailResponse> orderDetail = new ArrayList<>();
		try {
			orderDetail = dao.selectAll(orderId, session);
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("ER2000 - 장바구니 에러");
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
