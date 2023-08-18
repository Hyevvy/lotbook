package app.impl.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.Product;
import app.frame.DaoFrame;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;

public class ProductServiceImpl implements ServiceFrame<Product, Product>{

	DaoFrame<String, Product> dao;
	SqlSession session;
	
	public ProductServiceImpl() {
		dao = new ProductDaoImpl();
		session = GetSessionFacroty.getInstance().openSession();
	}

	@Override
	public int register(Product v) throws Exception {
		return 0;
		// TODO Auto-generated method stub
		
	}

	@Override
	public int modify(Product v) throws Exception {
		return 0;
		// TODO Auto-generated method stub
		
	}

	@Override
	public int remove(Product k) throws Exception {
		return 0;
		// TODO Auto-generated method stub
		
	}

	@Override
	public Product get(Product k) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> get() throws Exception {
		return null;
	}

	public List<Product> getLatest() throws Exception {
		List<Product> list = null;
		try{
			list = session.selectList("product.latest");
		}
		catch(Exception e) {
			e.getStackTrace();
			e.printStackTrace();
			throw new Exception("베스트셀러");
		}
		return list;
	}
}
