package cart;


import org.junit.Before;
import org.junit.Test;

import app.dto.entity.Cart;
import app.impl.cart.CartServiceImpl;

public class CartDeleteTest {
	CartServiceImpl service;
	
	@Before
	public void before() throws Exception {
		service = new CartServiceImpl();
	}

	@Test
	public void test() {
		Cart cart = Cart.builder().
				sequence(2).
				build();
		
		try {
			int result = service.remove(cart);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
