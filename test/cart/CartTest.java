package cart;


import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import app.dto.entity.Cart;
import app.dto.response.CartProduct;
import app.impl.cart.CartServiceImpl;

public class CartTest {
	CartServiceImpl service;
	
	@Before
	public void before() throws Exception {
		service = new CartServiceImpl();
	}

	@Test
	public void test() {
		Cart cart = Cart.builder().
				count(1).
				memberSequence(1).
				productSequence(1).
				build();
		
		try {
			int result = service.register(cart);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Test
	public void getAllTest() {
		Cart cart = Cart.builder().
				memberSequence(1).build();
		List<CartProduct> productList = new ArrayList<>();
		try {
			List<Cart> cartList = service.getAll(cart);
			productList = service.getProductInfo(cart);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
