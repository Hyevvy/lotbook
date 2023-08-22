package app.impl.search;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Product;
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
	
	
	public SearchResult getProductsByKeyword(String keyword) throws Exception {
		// TODO Auto-generated method stub
		session = GetSessionFacroty.getInstance().openSession();
		List<Product> products = searchDao.selectProductsByKeyword(keyword, session);
		session.close();
		return null;
	}

	
	

}
