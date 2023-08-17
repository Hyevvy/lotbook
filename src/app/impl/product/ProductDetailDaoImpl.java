package app.impl.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Product;
import app.frame.DaoFrame;

public class ProductDetailDaoImpl implements DaoFrame<Product, Product> {

	@Override
	public int insert(Product v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Product v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Product k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Product select(Product k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> select(SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
