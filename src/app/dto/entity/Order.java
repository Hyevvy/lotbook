package app.dto.entity;

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
	
	private String orderPhone;
	private String receiverName;
	
	private String vendorMessage;
	
	private long memberSequence;
}
