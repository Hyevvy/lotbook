package app.impl.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.Cart;
import app.dto.Cust;
import app.frame.DaoFrame;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;

public class CartServiceImpl implements ServiceFrame<Cart, Cart>{

	DaoFrame<Cart, Cart> dao;
	SqlSession session;
	
	public CartServiceImpl() {
		super();
		dao = new CartDaoImpl();
	}
	
	@Override
	public int register(Cart v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		
		int result = 0;
		try {
			result = dao.insert(v, session);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new Exception("ER2001");
		} finally {
			session.close();
		}
		
		return result;
		
	}
	@Override
	public int modify(Cart v) throws Exception {
		return 0;
		
	}
	@Override
	public int remove(Cart k) throws Exception {
		return 0;
		
	}
	@Override
	public Cart get(Cart k) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Cart> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	

}
