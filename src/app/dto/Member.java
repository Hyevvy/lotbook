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
	private String streetAddress; // addressDetail, zipcode 넣어야할까?
	private int accumulatedPoint;
	private String createdAt;
	private String lastLoginAt;
	private boolean isDormant; // 휴면게정여부
	private boolean isAdmin;
	private String memberPhone;
	
}
