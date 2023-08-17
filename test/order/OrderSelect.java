package order;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import app.dto.Order;
import app.impl.order.OrderServiceImpl;

public class OrderSelect {
	@Test
	public void test() {
		OrderServiceImpl service;
		service = new OrderServiceImpl();

		Order order = Order.builder()
				.sequence(2)
				.zipcode("08533")
				.orderPhone("01099999999")
				.vendorMessage("조심히 와주세요")
				.streetAddress("비트교육센터")
				.addressDetail("101동")
				.receiverName("2조")
				.build();

		System.out.println(order);
		Order testOrder = null;
		try {
			testOrder = service.get(order);
			System.out.println(testOrder);
			assertEquals("login 에러", "08533", testOrder.getZipcode());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
