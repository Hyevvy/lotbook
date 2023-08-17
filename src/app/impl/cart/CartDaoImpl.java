package app.impl.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.Cart;
import app.frame.DaoFrame;

public class CartDaoImpl implements DaoFrame<Cart, Cart> {

	/**
	 * 상품 재고 확인
	 */
	public int checkProductStock(Cart v, SqlSession session) throws Exception {
		return session.selectOne("cart.checkProductStock", v);
	}
	/**
	 * 장바구니 담기
	 */
	@Override
	public int insert(Cart v, SqlSession session) throws Exception {
		return session.insert("cart.addToCart", v);
	}

	@Override
	public int update(Cart v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Cart k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Cart select(Cart k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Cart> select(SqlSession session) throws Exception {
		return null;
	}
	
	/**
	 * 내 장바구니 전체 조회
	 */
	public List<Cart> selectAllMyCart(Cart v, SqlSession session) throws Exception {
		return session.selectList("cart.selectCartAll", v);
	}

}
