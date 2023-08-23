package app.dto.mapper;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CategoryMapper {
	private String mainCategorySequence;
	private String mainCategoryName;
	private String subCategorySequence;
	private String subCategoryName;

}
