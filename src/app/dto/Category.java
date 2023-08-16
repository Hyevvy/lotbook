package app.dto;

import app.enums.CategoryStateEnum;
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
	private CategoryStateEnum state;
	
	// FK
	private int parentCategory;
}
