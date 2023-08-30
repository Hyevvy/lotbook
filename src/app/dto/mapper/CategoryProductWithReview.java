package app.dto.mapper;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class CategoryProductWithReview {
    private long sequence;
    private String productImgurl;
    private String productDetailImgurl;
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
    private int authorSequence;
    private int publisherSequence;
    private int categorySequence;
    private int review_count;
    private long rating_avg;
    private long popularity;
}
