package app.impl.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Product;
import app.dto.entity.Review;
import app.dto.mapper.ProductRelatedNameMapper;
import app.dto.response.ProductDetailWithReviews;
import app.enums.ProductStateEnum;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;
import app.impl.category.CategoryDaoImpl;
import app.impl.review.ReviewDaoImpl;

public class ProductServiceImpl implements ServiceFrame<Product, Product> {

	ProductDaoImpl productDao;
	ReviewDaoImpl reviewDao;
	CategoryDaoImpl categoryDao;
	SqlSession session;

	public ProductServiceImpl() {
		super();
		productDao = new ProductDaoImpl();
		reviewDao = new ReviewDaoImpl();
		categoryDao = new CategoryDaoImpl();
	}

	@Override
	public int register(Product v) throws Exception {
		return 0;
		// TODO Auto-generated method stub

	}

	@Override
	public int modify(Product v) throws Exception {
		return 0;
		// TODO Auto-generated method stub

	}

	@Override
	public int remove(Product k) throws Exception {
		return 0;
		// TODO Auto-generated method stub

	}

	@Override
	public Product get(Product k) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();

		Product product = null;

		try {
			product = productDao.select(k, session);
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("ER1001");
		} finally {
			session.close();
		}

		return product;
	}

	@Override
	public List<Product> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	public ProductDetailWithReviews getProductDetailWithReviews(Product k) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		Product product = productDao.select(k, session);
		List<Review> reviews = reviewDao.selectReviewsByProduct(product, session);
		ProductRelatedNameMapper productRelatedNameMapper = productDao.selectRelatedName(product, session);
		
		int discountedPrice = product.getPrice() * (int) (100.0 - product.getDiscountRate()) / 100; // TODO: type safe using
																								// wrapper class
		int pointAccumulation = (int) (product.getPrice() * product.getPointAccumulationRate() / 100);
		ProductDetailWithReviews productDetailWithReviews = ProductDetailWithReviews.builder()
																					.sequence(product.getSequence())
																					.productImgurl(product.getProductImgurl())
																					.name(product.getName())
																					.originalPrice(product.getPrice())
																					.discountRate(product.getDiscountRate())
																					.price(discountedPrice)
																					.content(product.getContent())
																					.stock(product.getStock())
																					.createdAt(product.getCreatedAt())
																					.pointAccumulationRate(product.getPointAccumulationRate())
																					.pointAccumulation(pointAccumulation)
																					.salesCount(product.getSalesCount())
																					// TODO: ENUM type handler-from mybatis
																					.state(ProductStateEnum.ACTIVE)
																					.authorSequence(product.getAuthorSequence())
																					.authorName(productRelatedNameMapper.getAuthorName())
																					.publisherSequence(product.getPublisherSequence())
																					.publisherName(productRelatedNameMapper.getPublisherName())
																					.mainCategorySequence(productRelatedNameMapper.getMainCategorySequence())
																					.mainCategoryName(productRelatedNameMapper.getMainCategoryName())
																					.subCategorySequence(productRelatedNameMapper.getSubCategorySequence())
																					.subCategoryName(productRelatedNameMapper.getSubCategoryName())
																					// TODO: reviewer name handling using dto with optional
																					.reviews(reviews)
																					.build();
		session.close();
		return productDetailWithReviews; // TODO: Optional handling

	}

	public List<Product> getLatest() throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		List<Product> list = null;
		try {
			list = session.selectList("product.latest");
		} catch (Exception e) {
			e.getStackTrace();
			e.printStackTrace();
			throw new Exception("베스트셀러");
		}
		return list;
	}
}
