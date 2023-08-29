package web.controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import app.dto.response.SearchResult;
import app.frame.ControllerFrame;
import app.impl.search.SearchServiceImpl;

@WebServlet("/search")
public class SearchServlet implements ControllerFrame {
	private static final long serialVersionUID = 1L;
	private SearchServiceImpl searchServiceImpl; //
	private Logger search_log = Logger.getLogger("search"); //

	public SearchServlet() {
		super();
		searchServiceImpl = new SearchServiceImpl();
	}

	
	private void build(HttpServletRequest request, String view) {
		switch (view) {
		case "search":
			handleProductDetails(request);
			break;
		default:

		}
	}


	private void handleProductDetails(HttpServletRequest request) {
		// 검색어로 들어온걸 받아옴.
		String keyword = request.getParameter("keyword");
		String orderBy = request.getParameter("orderby");
		String category = request.getParameter("category");
		
		// 검색결과 없다는거 보내주면 jsp에서도 분기처리해서 렌더링 가능하다.
		if (keyword != null) {
			String decodedKeyword;
			try {
				decodedKeyword = java.net.URLDecoder.decode(keyword, "UTF-8");
				String wordWithoutSpace = decodedKeyword.replaceAll("\\s+", "");
				
				
				// 검색결과 데이터를 가져온다.
				SearchResult searchResult = getSearchResult(wordWithoutSpace, orderBy, category);
				
				// 검색결과 데이터를 request 객체에 속성으로 추가
				request.setAttribute("searchResult", searchResult);
				request.setAttribute("center", "search"); // 여기서 어떤 jsp를 렌더링하는지 결정.
				
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}

	private SearchResult getSearchResult(String keyword, String orderBy, String category) {
		SearchResult searchResult = null;
		
		
		// 상품 정보와 관련 리뷰를 가져오는 로직. ProductService에서 가져옴..
		try {
			searchResult = searchServiceImpl.getProductsByKeyword(keyword, orderBy, category);

		} catch (Exception e) {
			e.printStackTrace();
		}

		return searchResult;
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

}