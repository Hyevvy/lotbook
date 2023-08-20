package product;


import java.util.List;
import java.util.logging.Logger;

import org.apache.ibatis.session.SqlSession;
import org.junit.Before;
import org.junit.Test;

import app.dto.entity.Product;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;
import app.impl.product.ProductDaoImpl;
import app.impl.product.ProductServiceImpl;

public class ProductSelect {
	private final static Logger LOGGER = Logger.getLogger(ProductSelect.class.getName());
	ServiceFrame<Product, Product> service;

	@Before
	public void before() throws Exception {
//		SqlSession session;
//		session = GetSessionFacroty.getInstance().openSession();
//		ReviewDaoImpl dao = new ReviewDaoImpl();

//		service = new ReviewServiceImpl();

	}

	@Test
	public void test() {
		SqlSession session;
		session = GetSessionFacroty.getInstance().openSession();
		ProductServiceImpl service = new ProductServiceImpl();

		try {
			for (int i = 1; i < 10; i++) {
				Product product = Product.builder().sequence(i).build();
				Product res = service.get(product);
				LOGGER.info(res.toString());
				assert res.getSequence() == product.getSequence() : "Product sequence does not match given one";

			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	@Test
	public void test2() {
		ProductServiceImpl service;
		service = new ProductServiceImpl();
		
		List<Product> product = null;
			System.out.println("서비스동작");
		try {
			product = service.getLatest();
			System.out.println(product);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
