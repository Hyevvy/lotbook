package app.dto;

import app.enums.OrderStatusEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class OrderDetail {
	private long sequence;
	private int count;
	private int productPrice;
	private int productPoint;
	private OrderStatusEnum status;
	
	private long orderSequence;
	private long productSequence;

}
