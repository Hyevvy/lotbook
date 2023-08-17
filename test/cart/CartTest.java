package cart;


import org.junit.Before;
import org.junit.Test;

import app.dto.Cart;
import app.frame.ServiceFrame;
import app.impl.cart.CartServiceImpl;

public class CartTest {
	ServiceFrame<Cart, Cart> service;
	
	@Before
	public void before() throws Exception {
		service = new CartServiceImpl();
	}

	@Test
	public void test() {
		Cart cart = Cart.builder().
				count(5).
				memberSequence(1).
				productSequence(5).
				build();
		
		try {
			int result = service.register(cart);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
