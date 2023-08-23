package web.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import app.dto.response.ProductDetailWithReviews;
import app.dto.response.SearchResult;
import app.frame.ControllerFrame;
import app.impl.search.SearchServiceImpl;

@WebServlet("/search")
public class SearchServlet implements ControllerFrame {
	private static final long serialVersionUID = 1L;
	private SearchServiceImpl searchServiceImpl; //
	private Logger search_log = Logger.getLogger("SearchController"); //

	public SearchServlet() {
		super();
		searchServiceImpl = new SearchServiceImpl();
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


	private void handleProductDetails(HttpServletRequest request) {
		// 검색어로 들어온걸 받아옴.
		String keyword = request.getParameter("keyword");
		String orderBy = request.getParameter("orderby");
		
		// 검색결과 없다는거 보내주면 jsp에서도 분기처리해서 렌더링 가능하다.
		if (keyword != null) {
			System.out.println(keyword);
			String wordWithoutSpace = keyword.replaceAll("\\s+", "");
			System.out.println(wordWithoutSpace);
			
			// 검색결과 데이터를 가져온다.
			SearchResult searchResult = getSearchResult(wordWithoutSpace, orderBy);
			System.out.println(searchResult);
			
			// 검색결과 데이터를 request 객체에 속성으로 추가
			request.setAttribute("searchResult", searchResult);
			request.setAttribute("center", "search"); // 여기서 어떤 jsp를 렌더링하는지 결정.
		}
	}

	private SearchResult getSearchResult(String keyword, String orderBy ) {
		SearchResult searchResult = null;
		// 상품 정보와 관련 리뷰를 가져오는 로직. ProductService에서 가져옴..
		try {
			searchResult = searchServiceImpl.getProductsByKeyword(keyword, orderBy);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return searchResult;
	}


	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("검색컨트롤러 서비스 메소드 입장");
		String next = "index.jsp";
		System.out.println(next);
		System.out.println("qb");
		String view = request.getParameter("view");
		System.out.println(view);
		search_log.debug("상품 디테일 컨트롤러로 들어옴");
		if (view != null) {
			build(request, view);
		}

		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
		
	}

}