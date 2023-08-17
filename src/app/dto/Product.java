package app.dto;

import app.enums.ProductStateEnum;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
@AllArgsConstructor
public class Product {
	private long sequence;
	private String productImgurl;
	private String name;
	private int price;
	private String content;
	private int stock;
	private String created_at;
	private String updated_at;
	private double pointAccumulationRate;
	private double discountRate;
	private long salesCount;
	private ProductStateEnum state;
	
	// FK
	private int authorSequence;
	private int publisherSequence;
	private int categorySequence;
	
}
