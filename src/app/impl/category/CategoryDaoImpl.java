package app.impl.category;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Category;
import app.dto.entity.Product;
import app.dto.mapper.CategoryMapper;
import app.frame.DaoFrame;

public class CategoryDaoImpl implements DaoFrame<Category, Category>{

	@Override
	public int insert(Category v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int update(Category v, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int delete(Category k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Category select(Category k, SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Category> select(SqlSession session) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public CategoryMapper selectCategorybyProductSequence(Product k, SqlSession session) throws Exception {
		return session.selectOne("category.findCategorybyProductSequence", k);
		
	}
	
	public List<Product> selectComputerCategory(List<Product> v, SqlSession session) {
		return session.selectList("category.selectComputerCategory", v);
	}


	public List<Product> selectBigCategory(int categoryCode, SqlSession session) {
	    List<Product> products = session.selectList("selectBigCategory", categoryCode);
	    return products;
	}


	public List<Product> selectSmallCategory(int categoryCode, SqlSession session) {
	    List<Product> products = session.selectList("selectSmallCategory", categoryCode);
	    return products;
	}
	
}
