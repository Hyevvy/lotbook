package product;


import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;

import app.dto.Product;
import app.impl.product.ProductServiceImpl;

public class ProductSelect {
		@Test
		public void test() {
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
