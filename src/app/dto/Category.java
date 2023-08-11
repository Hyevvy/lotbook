package app.dto;

public class Category {
	private int sequence;
	private String name;
	private int level;
	private int state;
	
	// FK
	private int parentCategory;
}
