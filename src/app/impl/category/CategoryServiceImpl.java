package app.impl.category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Product;
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
	
	public List<Product> selectCategoryByView(String view) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
        List<Product> productList = null;
        if ("1".equals(view) || "6".equals(view) || "10".equals(view)) {
            productList = categoryDao.selectBigCategory(Integer.parseInt(view), session);
        } else {
            productList = categoryDao.selectSmallCategory(Integer.parseInt(view), session);
        }
        return productList;
    }
}
