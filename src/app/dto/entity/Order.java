package app.dto.entity;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Order {
	private long sequence;
	private String createdAt;
	
	private String zipcode;
	private String streetAddress;
	private String addressDetail;
	private String receiverEmail;
	private String orderPhone;
	private String receiverName;
	
	private String vendorMessage;
	private long memberSequence;
	
	private List<OrderDetail> orderDetailList;
}
