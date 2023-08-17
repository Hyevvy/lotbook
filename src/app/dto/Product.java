package app.dto;

import app.enums.ProductStateEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Product {
	private long sequence;
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
	private ProductStateEnum state;
	
	// FK
	private int authorSequence;
	private int publisherSequence;
	private int categorySequence;
	
}
