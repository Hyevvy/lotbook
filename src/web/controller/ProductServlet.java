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
		String type = request.getParameter("type");
		List<Product> productList = null;
		
			if ("latest".equals(type)) {
				productList = getLastestProduct(); 
		    } else if ("point".equals(type)) {
		        productList = getPointProduct(); 
		    } else if ("discount".equals(type)) {
		        productList = getDiscount(); 
		    } else if ("bestseller".equals(type)) {
		        productList = getBestseller(); 
		    } else {
		        System.out.println("ProductList 에러입니다.");
		        } 
        
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
            json.setLength(json.length() - 1);
        }

        json.append("]");

        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        PrintWriter out = response.getWriter();
        out.print(json.toString());
        out.flush();
    }
    
    private List<Product> getLastestProduct() {
        List<Product> productList = null;
        try {
            productList = productServiceImpl.getLatest();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }
    
    private List<Product> getPointProduct() {
        List<Product> productList = null;
        try {
            productList = productServiceImpl.getPoint();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }
    
    private List<Product> getDiscount() {
        List<Product> productList = null;
        try {
            productList = productServiceImpl.getDiscount();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }
    
    private List<Product> getBestseller() {
        List<Product> productList = null;
        try {
            productList = productServiceImpl.getBestseller();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return productList;
    }
}
