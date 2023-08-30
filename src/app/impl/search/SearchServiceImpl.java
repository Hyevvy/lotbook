package app.impl.search;

import java.util.Comparator;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.log4j.Logger;

import app.dto.entity.Category;
import app.dto.entity.Product;
import app.dto.mapper.SearchProductMapper;
import app.dto.response.SearchResult;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;
import app.impl.category.CategoryDaoImpl;

public class SearchServiceImpl implements ServiceFrame<String, Product> {
	SearchDaoImpl searchDao;
	CategoryDaoImpl categoryDao;
	SqlSession session;
	private Logger search_log = Logger.getLogger("search");

	public SearchServiceImpl() {
		super();
		searchDao = new SearchDaoImpl();
		categoryDao = new CategoryDaoImpl();
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

	public SearchResult getProductsByKeyword(String keyword, String orderby, String category) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		List<SearchProductMapper> searchedList = searchDao.selectProductsByKeyword(keyword, session);
		List<SearchProductMapper> filteredList;
		SearchResult searchResult = null;

		try {
			// popularity, pointAccumulation, discountedPrice 계산 및 설정
			searchedList.forEach(item -> {
				long popularity = calculatePopularity(item);
				int pointAccumulation = calculatePointAccumulation(item);
				int discountedPrice = calculateDiscountedPrice(item);

				item.setPopularity(popularity);
				item.setPointAccumulation(pointAccumulation);
				item.setDiscountedPrice(discountedPrice);
			});

			// 정렬 기준을 적용
			orderBy(searchedList, orderby);

			// 카테고리별 검색결과 수 계산하기. -> 카테고리 별 검색결과 screening 하기 전에 개수만 파악.
			Map<String, Integer> countByCategory = searchedList.stream().collect(
					Collectors.groupingBy(SearchProductMapper::getCategoryName, Collectors.summingInt(item -> 1)));
			countByCategory.put("전체", searchedList.size());

			// 카테고리 기본값 0 -> 전체를 의미. 나머지는 매칭되는거를 걸러줌.
			int categorySequence = 0;
			String categoryName = "전체";
			if (category != null) {
				categorySequence = Integer.parseInt(category);
				Category categoryInstance = Category.builder().sequence(categorySequence).build();
				Category resultCategoryInstance = categoryDao.select(categoryInstance, session);
				categoryName = resultCategoryInstance.getName();
			}

			switch (categorySequence) {
			case 0:
				// 모든 검색결과 할당
				filteredList = searchedList; // 모든 검색결과 할당
				break;
			default:
				List<Integer> subcategoryIds = categoryDao.selectSubcategorySequences(categorySequence, session);
				subcategoryIds.add(categorySequence); // 하위카테고리 선택을 위한 자기 자신 넣기.

				filteredList = searchedList.stream().filter(item -> subcategoryIds.contains(item.getCategorySequence()))
						.collect(Collectors.toList());
			}

			searchResult = SearchResult.builder().searchKeyword(keyword).totalCount(searchedList.size())
					.categoryCount(filteredList.size()).countByCategory(countByCategory)
					.currentCategorySequence(categorySequence).currentCategoryName(categoryName).orderBy(orderby)
					.searchList(filteredList).build();
		} catch (Exception e) {
			e. printStackTrace();
		} finally {
			session.close();
		}
		return searchResult;
	}

	private void orderBy(List<SearchProductMapper> list, String orderBy) {
		switch (orderBy.toLowerCase()) {
		case "latest":
			list.sort(Comparator.comparing(SearchProductMapper::getCreatedAt).reversed());
			break;
		case "sales":
			list.sort(Comparator.comparing(SearchProductMapper::getSalesCount).reversed());
			break;
		case "high_to_low":
			list.sort(Comparator.comparing(SearchProductMapper::getDiscountedPrice).reversed());
			break;
		case "low_to_high":
			list.sort(Comparator.comparing(SearchProductMapper::getDiscountedPrice));
			break;
		case "popular":
		default:
			list.sort(Comparator.comparingLong(SearchProductMapper::getPopularity).reversed());
			break;
		}
	}

	private long calculatePopularity(SearchProductMapper item) {
		return item.getSalesCount() + (item.getRatingAvg() == 0 ? 300 : (long) item.getRatingAvg() * 100);
	}

	private int calculatePointAccumulation(SearchProductMapper item) {
		return (int) (item.getPrice() * item.getPointAccumulationRate() / 100);
	}

	private int calculateDiscountedPrice(SearchProductMapper item) {
		double discountRate = item.getDiscountRate();
		int discountedPrice = (int) (item.getPrice() * (1 - discountRate / 100));
		return (discountedPrice / 10) * 10;
	}

}
