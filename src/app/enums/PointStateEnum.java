package app.enums;

public enum PointStateEnum {
	REGISTERED("가입 축하 적립금"),
	ACCUMULATED("주문 확정 적립금"),
	REVIEWED("리뷰 작성 적립금"),
	USED("적립금 사용");
	
	private String message;
	
	PointStateEnum(String message) {
		this.message = message;
	}
	
	public String getMessage() {
		return message;
	}
	
	
}
