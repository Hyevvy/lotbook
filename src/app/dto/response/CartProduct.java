package app.dto.response;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CartProduct {
	private long sequence;
	private long productSequence;
	private long memberSequence;
	private int isDeleted;
	private int count;
	
	private String productImgurl;
	private String name;
	private int price;
	private String content;
	private int stock;
	private String createdAt;
	private String updatedAt;
	private double pointAccumulationRate;
	private double discountRate;
	private long salesCount;
	private String state;
	
	// FK
	private int authorSequence;
	private int publisherSequence;
	private int categorySequence;
}
