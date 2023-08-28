package app.impl.category;

import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Product;
import app.dto.mapper.SearchProductMapper;
import app.frame.DaoFrame;
import app.frame.GetSessionFacroty;

public class CategoryServiceImpl implements DaoFrame<Product, Product> {

	SqlSession session;
	CategoryDaoImpl categoryDao;

	public CategoryServiceImpl() {
		super();
		categoryDao = new CategoryDaoImpl();
	}

	@Override
	public int insert(Product v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Product v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Product k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Product select(Product k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Product> select(SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public Object selectComputerCategory() throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		List<Product> list = null;
		try {
			list = categoryDao.selectComputerCategory(list, session);
		} catch (Exception e) {
			e.getStackTrace();
			e.printStackTrace();
			throw new Exception("컴퓨터 카테고리 책 검색 에러");
		}
		return list;
	}

	public List<Product> selectCategoryByView(String view, String orderby) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		List<Product> productList = null;
		if ("1".equals(view) || "6".equals(view) || "10".equals(view)) {
			productList = categoryDao.selectBigCategory(Integer.parseInt(view), session);
		} else {
			productList = categoryDao.selectSmallCategory(Integer.parseInt(view), session);
		}
		
		for (Product product : productList) {
		    int currentPrice = product.getPrice();
		    double discountRate = product.getDiscountRate();
		    int newPrice = (int) (currentPrice * (1 - discountRate / 100));
		    newPrice = (newPrice / 10) * 10;
		    product.setPrice(newPrice);
		}
			
		if(orderby == null)
			orderby = "sales";

		switch (orderby.toLowerCase()) {
		case "latest":
			productList.sort(Comparator.comparing(Product::getCreatedAt).reversed());
			break;
		case "sales":
			productList.sort(Comparator.comparing(Product::getSalesCount).reversed());
			break;
		case "high_to_low":
			productList.sort(Comparator.comparing(Product::getPrice).reversed());
			break;
		case "low_to_high":
			productList.sort(Comparator.comparing(Product::getPrice));
			break;
		default:
			productList.sort(Comparator.comparing(Product::getSalesCount).reversed());
			break;
		}

		return productList;
	}
}
