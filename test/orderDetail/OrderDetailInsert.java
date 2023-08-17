package orderDetail;

import static org.junit.Assert.assertEquals;

import org.junit.Test;

import app.dto.OrderDetail;
import app.impl.orderdetail.OrderDetailServiceImpl;

public class OrderDetailInsert {
	@Test
	public void test() {
		OrderDetailServiceImpl service;
		service = new OrderDetailServiceImpl();

		OrderDetail orderdetail = OrderDetail.builder()
				.count(3).productPoint(2000).productPoint(500).orderSequence(1).productSequence(3)
				.build();

		System.out.println(orderdetail);
		int result = 0;
		try {
			result = service.register(orderdetail);
			System.out.println(result);
			assertEquals("주문 상세 삽입 에러", result, 1);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}
