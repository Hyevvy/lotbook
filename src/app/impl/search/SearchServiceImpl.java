package app.impl.search;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Product;
import app.dto.mapper.SearchProductMapper;
import app.dto.response.SearchResult;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;

public class SearchServiceImpl implements ServiceFrame<String, Product> {
	SearchDaoImpl searchDao;
	SqlSession session;
	
	public SearchServiceImpl() {
		super();
		searchDao = new SearchDaoImpl();
	}
	
	
	@Override
	public int register(Product v) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int modify(Product v) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int remove(String k) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Product get(String k) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	public SearchResult getProductsByKeyword(String keyword, String orderby) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		List<SearchProductMapper> searchedList = searchDao.selectProductsByKeyword(keyword, session);
		searchedList.forEach(item -> System.out.println(item.toString()));
		session.close();
		
		// popularity, pointAccumulation, discountedPrice 계산 및 설정
		searchedList.forEach(item -> {
		    long popularity = item.getSalesCount() + (item.getRatingAvg() == 0 ? 300 : (long) item.getRatingAvg() * 100);
		    int pointAccumulation = (int) (item.getPrice() * item.getPointAccumulationRate() / 100);
		    
		    // 할인된 가격 계산 및 10의 단위 절삭
		    double discountRate = item.getDiscountRate();
		    int discountedPrice = (int) (item.getPrice() * (1 - discountRate / 100));
		    discountedPrice = (discountedPrice / 10) * 10;
		    
		    item.setPopularity(popularity);
		    item.setPointAccumulation(pointAccumulation);
		    item.setDiscountedPrice(discountedPrice);
		});
		
		// 정렬 기준을 적용
	    switch (orderby.toLowerCase()) {
	        case "latest":
	            searchedList.sort(Comparator.comparing(SearchProductMapper::getCreatedAt).reversed());
	            break;
	        case "sales":
	            searchedList.sort(Comparator.comparing(SearchProductMapper::getSalesCount).reversed());
	            break;
	        case "high to low":
	            searchedList.sort(Comparator.comparing(SearchProductMapper::getPrice).reversed());
	            break;
	        case "low to high":
	            searchedList.sort(Comparator.comparing(SearchProductMapper::getPrice));
	            break;
	        case "popular": // 기본이 popular. popular 점수에 리뷰점수가 없는(쿼리에서 null 대용으로 0 넣었음.) 경우 3점으로 세팅
	        default:
	        	searchedList.sort(Comparator.comparingLong(SearchProductMapper::getPopularity).reversed());
	            break;
	            // throw new IllegalArgumentException("Invalid orderby parameter");
	    }
	    
	    // 카테고리별 검색결과 수 계산하기.
	    Map<String, Integer> countByCategory = searchedList.stream()
	            .collect(Collectors.groupingBy(SearchProductMapper::getCategoryName, Collectors.summingInt(item -> 1)));
	    System.out.println(countByCategory.toString());
	    
	    SearchResult searchResult = SearchResult.builder()
	    										.searchKeyword(keyword)
	    										.count(searchedList.size())
	    										.countByCategory(countByCategory)
	    										.orderBy(orderby)
	    										.searchList(searchedList)
	    										.build();
	    
		
		return searchResult;
	}

	
	

}
