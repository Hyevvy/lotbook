package app.dto.response;

import java.util.List;

import app.dto.entity.Review;
import app.enums.ProductStateEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductDetailWithReviews {
	
	private long sequence;
	private String productImgurl;
	private String name;
	private int price;
	private String content;
	private int stock;
	private String createdAt;

	private double pointAccumulationRate;
	private double discountRate;
	private long salesCount;
	private ProductStateEnum state;
	
	// FK
	private int authorSequence;
	private int publisherSequence;
	private int categorySequence;
	
	private List<Review> reviews;

}
