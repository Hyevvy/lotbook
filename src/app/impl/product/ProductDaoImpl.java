package app.impl.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.OrderDetail;
import app.dto.entity.Product;
import app.dto.mapper.ProductRelatedNameMapper;
import app.frame.DaoFrame;
public class ProductDaoImpl implements DaoFrame<Product, Product> {

	@Override
	public int insert(Product v, SqlSession session) throws Exception {
		return 0;
	}

	@Override
	public int update(Product v, SqlSession session) throws Exception {
		return 0;
	}

	@Override
	public int delete(Product k, SqlSession session) throws Exception {
		return 0;
	}

	@Override
	public Product select(Product k, SqlSession session) throws Exception {
		return session.selectOne("product.selectProduct", k);
	}
	
	public ProductRelatedNameMapper selectRelatedName(Product k, SqlSession session) throws Exception {
//		ProductRelatedNameMapper productRelatedNameMapper = session.selectOne("product.selectRelatedName", k);
		
		 //TODO: Optional.ofNullable(product)
		return session.selectOne("product.selectRelatedNameAndCategory", k);
	}

	@Override
	public List<Product> select(SqlSession session) throws Exception {
		return null;
	}

	public List<Product> getLatest(SqlSession session) throws Exception {
		return session.selectList("product.latest");
	}
	
	public int updateByProductKeyWithSalesCount(OrderDetail k, SqlSession session) throws Exception {
		return session.update("product.updateByProductKeyWithSalesCount", k);
	}
}
