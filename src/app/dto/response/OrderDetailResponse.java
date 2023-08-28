package app.dto.response;

import app.dto.entity.Product;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailResponse{
	private long sequence;
	private int count;
	private int productPrice;
	private double productPoint;
//	private OrderStateEnum state;
	private String state;
	
	private long orderSequence;
	private long productSequence;
	private Product orderDetailProduct;
	private String reviewState; 	// EXIST, NONEXIST
}
