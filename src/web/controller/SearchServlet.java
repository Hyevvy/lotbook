package web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import app.dto.entity.Product;
import app.dto.response.ProductDetailWithReviews;
import app.dto.response.SearchResult;
import app.impl.product.ProductServiceImpl;

@WebServlet("/search")
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ProductServiceImpl productServiceImpl; //
	private Logger search_log = Logger.getLogger("SearchController"); //

	public SearchServlet() {
		super();
		productServiceImpl = new ProductServiceImpl();
	}

	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("검색컨트롤러 서비스 메소드 입장");
		String next = "index.jsp";
		System.out.println(next);
		String view = request.getParameter("view");
		System.out.println(view);
		search_log.debug("상품 디테일 컨트롤러로 들어옴");
		if (view != null) {
			build(request, view);
		}

		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);

	}

	private void build(HttpServletRequest request, String view) {
		System.out.println("검색 빌드메소드 입장");
		System.out.println(view);
		switch (view) {
		case "search":
			System.out.println("걸림");
			handleProductDetails(request);
			break;
		default:

		}
	}

	
	private ProductDetailWithReviews getProductDetailWithReviews(String productSequence) {
		// 상품 정보와 관련 리뷰를 가져오는 로직. ProductService에서 가져옴.
		// 여기에 필요한 메서드를 호출하고, 필요한 파라미터를 전달하시면 됩니다. 이 예시에서는 null을 반환합니다.
		// 상품상세페이지에 띄워 정보와 댓글 첫페이지(10개)를 가진 데이터를 로드합니다.
		return null;
	}

	private void handleProductDetails(HttpServletRequest request) {
		// 검색어로 들어온걸 받아옴.
		String word = request.getParameter("word");
		
		// 검색결과 없다는거 보내주면 jsp에서도 분기처리해서 렌더링 가능하다.
		if (word != null) {
			System.out.println(word);
			String wordWithoutSpace = word.replaceAll("\\s+", "");
			System.out.println(wordWithoutSpace);
			
			// 검색결과 데이터를 가져온다.
			SearchResult searchResult = getSearchResult(wordWithoutSpace);
			
			// 검색결과 데이터를 request 객체에 속성으로 추가
			request.setAttribute("searchResult", searchResult);
			request.setAttribute("datarr", "datarr");
			
			request.setAttribute("center", "search"); // 여기서 어떤 jsp를 렌더링하는지 결정.
			
			
//			String viewTest = request.getParameter("view");
//			search_log.debug(stringProductSequence);
			search_log.debug("일단 여기로 들어오긴했어.");
//			System.out.println(stringProductSequence);
//			System.out.println(viewTest);
			System.out.println("여기인가?");
//			int productSequence = Integer.parseInt(stringProductSequence);

			// 상품 정보와 관련 리뷰를 가져옴
//			ProductDetailWithReviews productDetailWithReviews = getProductDetailWithReviews(productSequence);
			search_log.debug("여기에요");
//			search_log.debug(productDetailWithReviews.toString());

			// 상품 상세 정보를 request 객체에 속성으로 추가
//			request.setAttribute("productDetailWithReviews", productDetailWithReviews);
			request.setAttribute("datarr", "datarr");

			
		}
		
		
	}

	private SearchResult getSearchResult(String word ) {
		SearchResult searchResult = null;
		// 상품 정보와 관련 리뷰를 가져오는 로직. ProductService에서 가져옴..
//		Product selectedProduct = Product.builder().sequence(productId).build();
//		try {
//			productDetailWithReviews = productServiceImpl.getProductDetailWithReviews(selectedProduct);
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}

		return searchResult;
	}

}