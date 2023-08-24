package web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import app.dto.entity.Product;
import app.dto.response.ProductDetailWithReviews;
import app.frame.ControllerFrame;
import app.impl.product.ProductServiceImpl;

@WebServlet("/product-detail")
public class ProductDetailServlet implements ControllerFrame {
	private static final long serialVersionUID = 1L;
	private ProductServiceImpl productServiceImpl;
	private Logger product_detail_log = Logger.getLogger("product-detail");

	public ProductDetailServlet() {
		super();
		productServiceImpl = new ProductServiceImpl();
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String next = "index.jsp";
		String view = request.getParameter("view");

		if (view != null) {
			build(request, view);
		}

		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}

	private void build(HttpServletRequest request, String view) {
		switch (view) {
		case "shop-details":
			handleProductDetails(request);
			break;
		default:

		}

//    	if(view.equals("register")){
//			
//			request.setAttribute("center", "cust/register");
//			request.setAttribute("navi", Navi.custRegister);
//		}else if(view.equals("getall")){
//			List<Cust> list = null;
//			try {
//				list = service.get();
//				request.setAttribute("clist", list);
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			request.setAttribute("center", "cust/getall");
//			request.setAttribute("navi", Navi.custGet);
//		}

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 원하는 상품의 pk를 받아옵니다
		String productSequence = request.getParameter("sequence");

		// 상품 정보와 관련 리뷰를 가져옴
		ProductDetailWithReviews productDetailWithReviews = getProductDetailWithReviews(productSequence);

		// 상품 상세 정보를 request 객체에 속성으로 추가
		request.setAttribute("productDetailWithReviews", productDetailWithReviews);

		// JSP 페이지로 전달
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/shop-details.jsp");
		dispatcher.forward(request, response);
	}

	private ProductDetailWithReviews getProductDetailWithReviews(String productSequence) {
		// 상품 정보와 관련 리뷰를 가져오는 로직. ProductService에서 가져옴.
		// 여기에 필요한 메서드를 호출하고, 필요한 파라미터를 전달하시면 됩니다. 이 예시에서는 null을 반환합니다.
		// 상품상세페이지에 띄워 정보와 댓글 첫페이지(10개)를 가진 데이터를 로드합니다.
		return null;
	}

	private void handleProductDetails(HttpServletRequest request) {
		// 원하는 상품의 pk를 받아옴
		String stringProductSequence = request.getParameter("sequence");
		String viewTest = request.getParameter("view");
		product_detail_log.debug(stringProductSequence);
		product_detail_log.debug("일단 여기로 들어오긴했어.");
		
		int productSequence = 3;
		if (stringProductSequence != null) {
			productSequence = Integer.parseInt(stringProductSequence);
		}
		// 상품 정보와 관련 리뷰를 가져옴
		ProductDetailWithReviews productDetailWithReviews = getProductDetailWithReviews(productSequence);
		product_detail_log.debug("여기에요");
		product_detail_log.debug(productDetailWithReviews.toString());

		// 상품 상세 정보를 request 객체에 속성으로 추가
		request.setAttribute("productDetailWithReviews", productDetailWithReviews);

		request.setAttribute("center", "shop-details");
	}

	private ProductDetailWithReviews getProductDetailWithReviews(int productId) {
		ProductDetailWithReviews productDetailWithReviews = null;
		// 상품 정보와 관련 리뷰를 가져오는 로직. ProductService에서 가져옴..
		Product selectedProduct = Product.builder().sequence(productId).build();
		try {
			productDetailWithReviews = productServiceImpl.getProductDetailWithReviews(selectedProduct);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return productDetailWithReviews;
	}

}