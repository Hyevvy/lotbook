package app.impl.cart;

import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.Cart;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;

public class CartServiceImpl implements ServiceFrame<Cart, Cart>{

	CartDaoImpl dao;
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
			int stock = dao.checkProductStock(v, session);
			
			if (stock < v.getCount()) {
				throw new Exception("ER2002 - 재고 부족");
			}
			
			result = dao.insert(v, session);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
			throw new Exception("ER2000 - 장바구니 에러");
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
		session = GetSessionFacroty.getInstance().openSession();
		
		return null;
	}
	
	public List<Cart> getAll(Cart v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		try {
			List<Cart> cart = dao.selectAllMyCart(v, session);
			for (int i = 0; i < cart.size(); i++) {
				System.out.println(cart.get(i));
			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("ER2000 - 장바구니 에러");
		} finally {
			session.close();
		}
		return null;
	}
}
