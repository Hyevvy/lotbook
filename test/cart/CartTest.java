package cart;


import java.util.ArrayList;
import java.util.List;

import org.junit.Before;
import org.junit.Test;

import app.dto.entity.Cart;
import app.dto.entity.Product;
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
	
	@Test
	public void getAllTest() {
		Cart cart = Cart.builder().
				memberSequence(1).build();
		List<Product> productList = new ArrayList<>();
		try {
			List<Cart> cartList = service.getAll(cart);
			for (int i = 0; i < cartList.size(); i++) {
				productList.add((service.getProductInfo(cartList.get(i))));
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	

}
