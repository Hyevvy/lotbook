package app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class Order {
	private long sequence;
	private int state;
	private String createdAt;
	private String streetAddress;
	private String phone;
	private String receiverName;
	
	private long member_sequence;
}
