package orderDetail;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import app.dto.OrderDetail;
import app.impl.orderdetail.OrderDetailServiceImpl;

public class OrderDetailSelect {
	@Test
	public void test() {
		OrderDetailServiceImpl service;
		service = new OrderDetailServiceImpl();

		OrderDetail orderDetail = OrderDetail.builder()
				.sequence(1)
				.build();

		System.out.println(orderDetail);
		OrderDetail testOrder = null;
		
		try {
			testOrder = service.get(orderDetail);
			System.out.println(testOrder);
			assertEquals("login 에러", 1, testOrder.getSequence());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
