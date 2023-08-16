package app.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class Category {
	private int sequence;
	private String name;
	private int level;
	private int state;
	
	// FK
	private int parentCategory;
}
