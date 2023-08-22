package app.dto.mapper;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class SearchProductMapper {
	private long sequence;
	private String productImgurl;
	private String name;
	private int price;
	private double pointAccumulationRate;
	private int stock;
	private int salesCount;
	
	private String createdAt;
	
	private int authorSequence;
	private String authorName;
	private int publisherSequence;
	private String publisherName;
	private int categorySequence;
	private String categoryName;
	
	//aggregation data
	private String nameWithoutBlank;
	private int reviewCount;
	private double ratingAvg;
	

}
