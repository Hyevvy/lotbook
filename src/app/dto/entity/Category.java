package app.dto.entity;

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
	private String state;
	
	// FK
	private int parentCategory;
}
