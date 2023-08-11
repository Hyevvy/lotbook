package app.dto;

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
