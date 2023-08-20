package web.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.dto.entity.Product;
import app.dto.response.ProductDetailWithReviews;
import app.impl.product.ProductServiceImpl;

@WebServlet("/product")
public class ProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ProductServiceImpl productServiceImpl;
    
    public ProductServlet() {
        super();
        productServiceImpl = new ProductServiceImpl();
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Product> productList = getProductListFromDatabase(); // 데이터베이스에서 상품 리스트를 가져오는 메서드 호출
        
        StringBuilder json = new StringBuilder();
        json.append("[");

        for (Product product : productList) {
            json.append("{");
            json.append("\"sequence\":").append(product.getSequence()).append(",");
            json.append("\"productImgurl\":\"").append(product.getProductImgurl()).append("\",");
            json.append("\"name\":\"").append(product.getName()).append("\",");
            json.append("\"price\":").append(product.getPrice()).append(",");
            json.append("\"content\":\"").append(product.getContent()).append("\",");
            json.append("\"stock\":").append(product.getStock()).append(",");
            json.append("\"createdAt\":\"").append(product.getCreatedAt()).append("\",");
            json.append("\"updatedAt\":\"").append(product.getUpdatedAt()).append("\",");
            json.append("\"pointAccumulationRate\":").append(product.getPointAccumulationRate()).append(",");
            json.append("\"discountRate\":").append(product.getDiscountRate()).append(",");
            json.append("\"salesCount\":").append(product.getSalesCount()).append(",");
            json.append("\"state\":\"").append(product.getState()).append("\",");
            json.append("\"authorSequence\":").append(product.getAuthorSequence()).append(",");
            json.append("\"publisherSequence\":").append(product.getPublisherSequence()).append(",");
            json.append("\"categorySequence\":").append(product.getCategorySequence());
            json.append("},");
        }

        if (!productList.isEmpty()) {
            json.setLength(json.length() - 1); // 마지막 쉼표 제거
        }

        json.append("]");

        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        // JSON 데이터를 클라이언트로 보냄
        PrintWriter out = response.getWriter();
        out.print(json.toString());
        out.flush();
    }
    
    private List<Product> getProductListFromDatabase() {
        List<Product> productList = null;
        try {
            productList = productServiceImpl.getLatest();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }
    
    
    private ProductDetailWithReviews getProductDetailWithReviews() {
    	ProductDetailWithReviews productDetailWithReviews = null;
		return productDetailWithReviews;
    	
    	
    	
    }
}
