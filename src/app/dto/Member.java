package app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class Member {
	private long sequence;
	private String email;
	private String hashedPwd;
	private String name;
	
	private String zipcode;
	private String streetAddress;
	private String addressDetail;
	
	private int accumulatedPoint;
	private String createdAt;
	private String lastLoginAt;
	private boolean isDormant; // 휴면계정여부
	private boolean isAdmin;
	private String memberPhone;
	
}
