package app.dto.response;

import java.util.List;
import java.util.Map;

import app.dto.mapper.SearchProductMapper;

public class SearchResult {
	private String searchKeyword;
	
	private int count;
	private Map<String, Integer> countByCategory; //service에서 count해서 카테고리별 몇개인지 포장해주자.
	
	private String orderBy;
	
	private List<SearchProductMapper> searchList;
}
