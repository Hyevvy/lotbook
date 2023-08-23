package app.impl.cart;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Cart;
import app.dto.response.CartProduct;
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
			
			int dupSeq = dao.checkDuplicatedProduct(v, session);
			if (dupSeq == 0) { // 중복 상품 없음
				result = dao.insert(v, session);
			} else if (dupSeq >= 1) { // 중복 상품 있음
				v.setSequence(dupSeq);
				result = dao.updateDuplicatedProduct(v, session);
			}
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
		session = GetSessionFacroty.getInstance().openSession();
		int result = 0;
		try {
			int stock = dao.checkProductStock(v, session);
			if (stock < v.getCount()) {
				throw new Exception("ER2002 - 재고 부족");
			}
			
			result = dao.update(v, session);
			
			session.commit();
		} catch (Exception e) {
			// e.printStackTrace();
			session.rollback();
			throw e;
		} finally {
			session.close();
		}
		return result;
		
	}
	@Override
	public int remove(Cart k) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		int result = 0;
		try {
			result = dao.delete(k, session);
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();
		} finally {
			session.close();
		}
		return result;
		
	}
	@Override
	public Cart get(Cart k) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		Cart cart = null;
		try {
			cart = dao.select(k, session);
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("ER2000 - 장바구니 에러");
		} finally {
			session.close();
		} 
		return cart;
	}
	
	public CartProduct cartGet(Cart k) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		CartProduct cart = null;
		try {
			cart = dao.selectedCart(k, session);
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("ER2002 - 장바구니 상품 구매 에러");
		} finally {
			session.close();
		}
		return cart;
	}
	
	public int getCartCount(long sequence) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		int count = 0;
		try {
			count = dao.getCount(sequence, session);
			System.out.println(count);
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("ER2003 - 장바구니 개수 조회 에러");
		} finally {
			session.close();
		}
		return count;
	}
	@Override
	public List<Cart> get() throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		
		return null;
	}
	
	public List<Cart> getAll(Cart v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		List<Cart> cart = new ArrayList<>();
		try {
			cart = dao.selectAllMyCart(v, session);
//			for (int i = 0; i < cart.size(); i++) {
//				System.out.println(cart.get(i));
//			}
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("ER2000 - 장바구니 에러");
		} finally {
			session.close();
		}
		return cart;
	}
	
	public List<CartProduct> getProductInfo(Cart v) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		List<CartProduct> product = null;
		try {
			product = dao.selectProductInfo(v, session);
		} catch(Exception e) {
			e.printStackTrace();
			throw new Exception("ER2000 - 장바구니 에러");
		} finally {
			session.close();
		}
		return product;
	}
}
