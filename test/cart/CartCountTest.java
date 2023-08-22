package cart;


import org.junit.Before;
import org.junit.Test;

import app.impl.cart.CartServiceImpl;

public class CartCountTest {
	CartServiceImpl service;
	
	@Before
	public void before() throws Exception {
		service = new CartServiceImpl();
	}

	@Test
	public void test() {	
		try {
			int result = service.getCartCount(1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
