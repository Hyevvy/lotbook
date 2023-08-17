package order;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import app.dto.Order;
import app.impl.order.OrderServiceImpl;

public class OrderInsert {
	@Test
	public void test() {
		OrderServiceImpl service;
		service = new OrderServiceImpl();

		Order order = Order.builder().zipcode("08888").orderPhone("01099999999").vendorMessage("조심히 와주세요")
				.streetAddress("비트교육센터").addressDetail("101동").receiverName("2조").memberSequence(1).build();

		System.out.println(order);
		int result = 0;
		try {
			result = service.register(order);
			System.out.println(result);
			assertEquals("주문 삽입 에러", result, 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
