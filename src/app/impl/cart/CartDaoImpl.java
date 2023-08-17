package app.impl.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.Cart;
import app.frame.DaoFrame;

public class CartDaoImpl implements DaoFrame<Cart, Cart> {

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
		// TODO Auto-generated method stub
		return null;
	}


}
