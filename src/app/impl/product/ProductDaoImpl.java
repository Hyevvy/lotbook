package app.impl.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.Product;
import app.frame.DaoFrame;

public class ProductDaoImpl implements DaoFrame<String, Product> {

	@Override
	public int insert(Product v, SqlSession session) throws Exception {
		return 0;
	}

	@Override
	public int update(Product v, SqlSession session) throws Exception {
		return 0;
	}

	@Override
	public int delete(String k, SqlSession session) throws Exception {
		return 0;
	}


	@Override
	public Product select(String k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> select(SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public List<Product> getLatest(SqlSession session) throws Exception {
		return session.selectList("product.latest");
	}




}
