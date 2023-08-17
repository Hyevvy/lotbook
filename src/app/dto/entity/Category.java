package app.dto.entity;

import app.enums.CategoryStateEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Category {
	private int sequence;
	private String name;
	private int level;
	private CategoryStateEnum state;
	
	// FK
	private int parentCategory;
}
