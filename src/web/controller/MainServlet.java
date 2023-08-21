package web.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.cust.CustServiceImpl;
import app.dto.entity.Cart;
import app.dto.entity.Product;
import app.dto.response.CartProduct;
import app.impl.cart.CartServiceImpl;
import app.impl.product.ProductServiceImpl;

/**
 * Servlet implementation class CustServlet
 */
@WebServlet({"/main"})
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CustServiceImpl custService;
	
    public MainServlet() {
        super();
        custService = new CustServiceImpl();
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String next = "index.jsp";
		String view = request.getParameter("view");

		if(view != null){
			build(request, view);
		}

		RequestDispatcher rd = 
		request.getRequestDispatcher(next);
		rd.forward(request, response);
	}


	private void build(HttpServletRequest request,
			String view){
		if(view.equals("signup")){
			request.setAttribute("center", "signup");
		}else if(view.equals("signin")){
			request.setAttribute("center", "signin");
		}else if(view.equals("loginimpl")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			// 로그인
		}else if(view.contains("mypage")){
			request.setAttribute("center", "mypage");
			String memberSeq = request.getParameter("memberSeq");
			List<Cart> cartList = new ArrayList<>();
			List<CartProduct> productList = new ArrayList<>();
			CartServiceImpl cartService = new CartServiceImpl();
			request.setAttribute("myCartList", null);
			request.setAttribute("myCartProductList", null);
			
			Cart cart = Cart.builder().
					memberSequence(Integer.parseInt(memberSeq)).build();
			
			try {
				cartList = cartService.getAll(cart);
				System.out.println(cartList);
				request.setAttribute("myCartList", cartList);

				productList = cartService.getProductInfo(cart);
				request.setAttribute("myCartProductList", productList);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(view.contains("changeCount")){
			request.setAttribute("center", "mypage");
			int count = Integer.parseInt(request.getParameter("count"));
			int productSequence = Integer.parseInt(request.getParameter("productSequence"));
			int sequence = Integer.parseInt(request.getParameter("sequence"));
			int memberSeq = Integer.parseInt(request.getParameter("memberSeq"));
			List<Cart> cartList = new ArrayList<>();
			List<CartProduct> productList = new ArrayList<>();
			CartServiceImpl cartService = new CartServiceImpl();
			
			// 개수가 1 이하로 내려갈 경우 1로 고정
			if (count < 1) {
				count = 1;
			}
			
			Cart cart = Cart.builder().count(count).productSequence(productSequence).sequence(sequence).memberSequence(memberSeq).build();
			
			try {
				cartService.modify(cart);
				
				cartList = cartService.getAll(cart);
				request.setAttribute("myCartList", cartList);

				productList = cartService.getProductInfo(cart);
				request.setAttribute("myCartProductList", productList);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(view.contains("deleteCart")){
			request.setAttribute("center", "mypage");
			int sequence = Integer.parseInt(request.getParameter("sequence"));
			int memberSeq = Integer.parseInt(request.getParameter("memberSeq"));
			CartServiceImpl cartService = new CartServiceImpl();
			List<Cart> cartList = new ArrayList<>();
			List<CartProduct> productList = new ArrayList<>();
			
			Cart cart = Cart.builder().sequence(sequence).memberSequence(memberSeq).build();
			
			try {
				cartService.remove(cart);
				
				cartList = cartService.getAll(cart);
				request.setAttribute("myCartList", cartList);

				productList = cartService.getProductInfo(cart);
				request.setAttribute("myCartProductList", productList);

			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(view.equals("checkout")){
			request.setAttribute("center", "checkout");
		}else if(view.contains("checkoutbuynow")){
			
			request.setAttribute("center", "checkoutbuynow");
			String productId = request.getParameter("productId");
			String count = request.getParameter("count");
		
			Product product = Product.builder().sequence(Integer.parseInt(productId)).build();
			ProductServiceImpl service = new ProductServiceImpl();
			try {
				Product res = service.get(product);
				request.setAttribute("res", res);
				request.setAttribute("count", count);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else if(view.equals("contact")){
			request.setAttribute("center", "contact");
		}else if(view.equals("shop-details")){
			request.setAttribute("center", "shop-details");
		}else if(view.equals("shop-grid")){
			request.setAttribute("center", "shop-grid");
		}else if(view.equals("shoping-cart")){
			request.setAttribute("center", "shoping-cart");
		}
		
	}
}