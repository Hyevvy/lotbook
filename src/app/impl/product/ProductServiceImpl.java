package app.impl.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import app.dto.entity.Product;
import app.dto.entity.Review;
import app.dto.response.ProductDetailWithReviews;
import app.enums.ProductStateEnum;
import app.frame.DaoFrame;
import app.frame.GetSessionFacroty;
import app.frame.ServiceFrame;
import app.impl.review.ReviewDaoImpl;

public class ProductServiceImpl implements ServiceFrame<Product, Product> {
	
	DaoFrame<Product, Product> productDao;
	ReviewDaoImpl reviewDao;
	SqlSession session;
	
	public ProductServiceImpl() {
		super();
		productDao = new ProductDaoImpl();
		reviewDao = new ReviewDaoImpl();
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
	public int remove(Product k) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Product get(Product k) throws Exception {
											
		return null;
	}

	@Override
	public List<Product> get() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public ProductDetailWithReviews getProductDetailWithReviews(Product k, SqlSession session) throws Exception {
		session = GetSessionFacroty.getInstance().openSession();
		Product product = productDao.select(k, session);
		List<Review> reviews = reviewDao.selectReviewsByProduct(product, session);
		int discountedPrice = product.getPrice() * (int)(100.0 - product.getDiscountRate()); //TODO: type safe using wrapper class
		int pointAccumulation = (int) (product.getPrice() * product.getPointAccumulationRate());
		ProductDetailWithReviews productDetailWithReviews = ProductDetailWithReviews.builder()
																					.sequence(product.getSequence())
																					.productImgurl(product.getProductImgurl())
																					.name(product.getName())
																					//TODO: original price
																					.price(discountedPrice)
																					.content(product.getContent())  
																					.stock(product.getStock())
																					.createdAt(product.getCreatedAt())
																					.pointAccumulation(pointAccumulation)
																					.salesCount(product.getSalesCount())
																					//TODO: ENUM type handler-from mybatis
																					.state(ProductStateEnum.ACTIVE)
																					.authorSequence(product.getAuthorSequence())
																					.authorName("작가이름")
																					.publisherSequence(product.getPublisherSequence())
																					.publisherName("출판사이름")
																					.categorySequence(product.getCategorySequence())
																					.categoryName("카테고리이름")
																					//TODO: reviewer name handling using dto with optional
																					.reviews(reviews)
																					.build();
		session.close();
		return productDetailWithReviews; //TODO: Optional handling
		
	}

}
