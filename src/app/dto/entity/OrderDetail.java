package app.dto.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetail {
	private long sequence;
	private int count;
	private int productPrice;
	private double productPoint;
//	private OrderStateEnum state;
	private String state;
	
	private long orderSequence;
	private long productSequence;
	private Product orderDetailProduct;
}
