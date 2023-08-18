package app.dto.entity;

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
	

    public Product(
        long sequence,
        String productImgurl,
        String name,
        int price,
        String content,
        int stock,
        String createdAt,
        String updatedAt,
        double pointAccumulationRate,
        double discountRate,
        long salesCount,
        String state,
        int authorSequence,
        int publisherSequence,
        int categorySequence
    ) {
        this.sequence = sequence;
        this.productImgurl = productImgurl;
        this.name = name;
        this.price = price;
        this.content = content;
        this.stock = stock;
        this.createdAt = createdAt;
        this.updatedAt = updatedAt;
        this.pointAccumulationRate = pointAccumulationRate;
        this.discountRate = discountRate;
        this.salesCount = salesCount;
        this.state = state;
        this.authorSequence = authorSequence;
        this.publisherSequence = publisherSequence;
        this.categorySequence = categorySequence;
    }
}
