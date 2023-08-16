package app.dto;

import app.enums.OrderStateEnum;
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
	private OrderStateEnum state;
	
	private long orderSequence;
	private long productSequence;

}
