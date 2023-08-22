package app.impl.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Cart;
import app.dto.response.CartProduct;
import app.frame.DaoFrame;

public class CartDaoImpl implements DaoFrame<Cart, Cart> {

	/**
	 * 상품 재고 확인
	 */
	public int checkProductStock(Cart v, SqlSession session) throws Exception {
		return session.selectOne("cart.checkProductStock", v);
	}
	
	/**
	 * 중복 상품 판별
	 */
	public int checkDuplicatedProduct(Cart v, SqlSession session) throws Exception {
		return session.selectOne("cart.checkDuplicatedProduct", v);
	}
	
	/**
	 * 중복 상품 장바구니 개수 증가
	 */
	public int updateDuplicatedProduct(Cart v, SqlSession session) throws Exception {
		return session.update("cart.updateDuplicatedProduct", v);
	}
	
	/**
	 * 장바구니 담기
	 */
	@Override
	public int insert(Cart v, SqlSession session) throws Exception {
		return session.insert("cart.addToCart", v);
	}

	/**
	 * 장바구니 수량 변경
	 */
	@Override
	public int update(Cart v, SqlSession session) throws Exception {
		return session.update("cart.updateCartProductCount", v);
	}
	
	/**
	 * 장바구니 상태 변경(구매/삭제)
	 */
	@Override
	public int delete(Cart k, SqlSession session) throws Exception {
		return session.update("cart.updateCartState", k);
	}

	/**
	 * 장바구니 개별 조회
	 */
	@Override
	public Cart select(Cart k, SqlSession session) throws Exception {
		return session.selectOne("cart.selectCartDetail", k);
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
	
	/**
	 * 내 장바구니 상품 정보 전체 조회
	 */
	public List<CartProduct> selectProductInfo(Cart v, SqlSession session) throws Exception {
		return session.selectList("cart.selectProductInfo", v);
	}

}
