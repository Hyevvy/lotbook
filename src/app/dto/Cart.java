package app.dto;

public class Cart {
	private long productSequence; //FK
	private long memberSequence; //FK
	
	private int count;
	private int updatedAt;
	private boolean isDeleted;
}
