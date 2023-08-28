package app.dto.response;

import java.util.List;
import java.util.Map;

import app.dto.mapper.SearchProductMapper;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SearchResult {
	private String searchKeyword;
	
	private int totalCount;
	private int categoryCount;
	private int currentCategorySequence;
	private String currentCategoryName;
	
	
	private Map<String, Integer> countByCategory; //service에서 count해서 카테고리별 몇개인지 포장해주자.
	
	private String orderBy;
	
	private List<SearchProductMapper> searchList;
}
