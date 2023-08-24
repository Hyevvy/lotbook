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
import app.dto.entity.Member;
import app.dto.entity.Order;
import app.dto.entity.OrderDetail;
import app.dto.entity.Product;
import app.dto.response.CartProduct;
import app.dto.response.ReviewDetails;
import app.impl.cart.CartServiceImpl;
import app.impl.order.OrderServiceImpl;
import app.impl.orderdetail.OrderDetailServiceImpl;
import app.impl.product.ProductServiceImpl;
import app.impl.review.ReviewServiceImpl;

/**
 * Servlet implementation class CustServlet
 */
@WebServlet({ "/main" })
public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	CustServiceImpl custService;
	ProductServiceImpl productService;
	String memberSeq = null;
	public MainServlet() {
		super();
		custService = new CustServiceImpl();
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String next = "index.jsp";
		String view = request.getParameter("view");

		if (view != null) {
			build(request, view);
		}

		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}

	private void build(HttpServletRequest request, String view) {
		if (view.equals("signup")) {

			request.setAttribute("center", "signup");
		} else if (view.equals("signin")) {
			request.setAttribute("center", "signin");
		} else if (view.contains("checkout-result")) {
			OrderServiceImpl orderService = new OrderServiceImpl();
			OrderDetailServiceImpl orderDetailService = new OrderDetailServiceImpl();
			ProductServiceImpl productService = new ProductServiceImpl();

			request.setAttribute("center", "checkout-result");
			int count = Integer.parseInt(request.getParameter("count"));
			int productId = Integer.parseInt(request.getParameter("productId"));
			double pointAccumulationRate = Double.valueOf(request.getParameter("point"));
			Integer price = Integer.parseInt(request.getParameter("price"));
			String receiver_name = request.getParameter("input__receiverName");
			String order_phone = request.getParameter("input__phone");
			String zipcode = request.getParameter("input__zipcode");
			String street_address = request.getParameter("input__street_address");
			String address_detail = request.getParameter("input__address_detail");
			String vendor_message = request.getParameter("input__vendor_message");
			Order order = Order.builder().receiverName(receiver_name).orderPhone(order_phone)
					.vendorMessage(vendor_message).addressDetail(address_detail).streetAddress(street_address)
					.zipcode(zipcode).memberSequence(Long.parseLong(memberSeq)).build();

			try {
				orderService.register(order);

				// memberId에 해당하는 가장 최근 order sequence
				List<Order> orderList = orderService
						.getAll(Order.builder().memberSequence(Long.parseLong(memberSeq)).build());
				OrderDetail orderDetail = OrderDetail.builder().orderSequence(orderList.get(0).getSequence())
						.count(count).productPoint(pointAccumulationRate * 0.01 * count * price).productPrice(price)
						.productSequence(productId).build();

				orderDetailService.register(orderDetail);
			} catch (Exception e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}

			try {
				long totalPrice = 0;
				long totalPoint = 0;
				List<Order> orderList = orderService
						.getAll(Order.builder().memberSequence(Long.parseLong(memberSeq)).build());
				request.setAttribute("orderResult", orderList.get(0)); // 방금 생성된 Order

				List<OrderDetail> orderDetail = new ArrayList<>();
				orderDetail = orderDetailService.get(orderList.get(0).getSequence());

				for (int j = 0; j < orderDetail.size(); j++) {
					Product product = Product.builder().sequence(orderDetail.get(j).getProductSequence()).build();
					orderDetail.get(j).setOrderDetailProduct(productService.get(product));
					totalPrice += orderDetail.get(j).getProductPrice();
					totalPoint += orderDetail.get(j).getProductPoint();
				}

				// 방금 생성된 orderDetail List
				request.setAttribute("orderDetailResult", orderDetail);
				request.setAttribute("totalPrice", totalPrice);
				request.setAttribute("totalPoint", totalPoint);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (view.equals("loginimpl")) {
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			// 로그인
		} else if (view.contains("mypage")) {
			request.setAttribute("center", "mypage");
			memberSeq = request.getParameter("memberSeq");
			List<Cart> cartList = new ArrayList<>();
			List<CartProduct> productList = new ArrayList<>();
			CartServiceImpl cartService = new CartServiceImpl();
			request.setAttribute("myCartList", null);
			request.setAttribute("myCartProductList", null);

			Cart cart = Cart.builder().memberSequence(Integer.parseInt(memberSeq)).build();

			try {
				cartList = cartService.getAll(cart);
				request.setAttribute("myCartList", cartList);
				productList = cartService.getProductInfo(cart);
				request.setAttribute("myCartProductList", productList);
			} catch (Exception e) {
				e.printStackTrace();
			}

			List<Order> orderList = new ArrayList<>();
			List<ReviewDetails> reviewDetailList = null;
			OrderServiceImpl orderService = new OrderServiceImpl();
			ProductServiceImpl productService = new ProductServiceImpl();

			OrderDetailServiceImpl orderDetailService = new OrderDetailServiceImpl();
			ReviewServiceImpl reviewServiceImpl = new ReviewServiceImpl();

			Order order = Order.builder().memberSequence(Integer.parseInt(memberSeq)).build();
			Member memberInfo = Member.builder().sequence(Integer.parseInt(memberSeq)).build();

			try {
				orderList = orderService.getAll(order); // 1. user sequence에 해당하는 order 내역 전체 조회
				reviewDetailList = reviewServiceImpl.get(memberInfo);
//				reviewDetailList = new ArrayList<>(reviewList.size());

				// 2. order sequence에 해당하는 orderDetail 채워주기
				for (int i = 0; i < orderList.size(); i++) {
					List<OrderDetail> orderDetail = new ArrayList<>();
					
					orderDetail = orderDetailService.get(orderList.get(i).getSequence());
						
					// 3. orderDetail 각각에 해당하는 Product 채워주기
					for (int j = 0; j < orderDetail.size(); j++) {
						Product product = Product.builder().sequence(orderDetail.get(j).getProductSequence()).build();
						orderDetail.get(j).setOrderDetailProduct(productService.get(product));
					}

					orderList.get(i).setOrderDetailList(orderDetail);
					
				}
				
				// 2-2. review의 product_sequence에 해당하는 Product 정보 채워주기
				for(int i=0; i< reviewDetailList.size(); i++) {
					Product product = Product.builder().sequence(reviewDetailList.get(i).getProductSequence()).build();
					reviewDetailList.get(i).setReviewDetailProduct(productService.get(product));
				}

				// 3. myPage로 보내기
				request.setAttribute("myOrderList", orderList);
				request.setAttribute("myReviewList", reviewDetailList);

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (view.contains("changeCount")) {
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

			Cart cart = Cart.builder().count(count).productSequence(productSequence).sequence(sequence)
					.memberSequence(memberSeq).build();

			try {
				cartService.modify(cart);

				cartList = cartService.getAll(cart);
				request.setAttribute("myCartList", cartList);

				productList = cartService.getProductInfo(cart);
				request.setAttribute("myCartProductList", productList);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (view.contains("deleteCart")) {
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
		} else if (view.equals("checkout")) {
			request.setAttribute("center", "checkout");
	         String parameter = request.getParameter("sequences");
	         String[] cartSequences = parameter.split(",");
	         CartServiceImpl cartService = new CartServiceImpl();
	         List<CartProduct> productList = new ArrayList<>();
	         int totalPrice = 0;
	         int totalPoint = 0;
	         
	         for (int i = 0; i < cartSequences.length; i++) {
	            Cart cart = Cart.builder().sequence(Long.parseLong(cartSequences[i])).build();
	            try {
	               productList.add(cartService.cartGet(cart));
	               
	               if (i == 0) {
	                  totalPrice = (int) ((productList.get(i).getPrice() * ((100 - productList.get(i).getDiscountRate()) * 0.01)) * productList.get(i).getCount() - ((productList.get(i).getPrice() * ((100 - productList.get(i).getDiscountRate()) * 0.01)) * productList.get(i).getCount())%10);
	                  totalPoint = (int) (Math.floor(productList.get(i).getPrice() * productList.get(i).getCount() * productList.get(i).getPointAccumulationRate() * 0.01));
	               } else {
	                  totalPrice = (int) (productList.get(i-1).getTotalPrice() + (productList.get(i).getPrice() * ((100 - productList.get(i).getDiscountRate()) * 0.01)) * productList.get(i).getCount() - ((productList.get(i).getPrice() * ((100 - productList.get(i).getDiscountRate()) * 0.01)) * productList.get(i).getCount())%10);
	                  totalPoint = (int) (productList.get(i-1).getTotalPoint() + Math.floor(productList.get(i).getPrice() * productList.get(i).getCount() * productList.get(i).getPointAccumulationRate() * 0.01));
	               }
	               
	               productList.get(i).setTotalPrice(totalPrice);
	               productList.get(i).setTotalPoint(totalPoint);
	            } catch (Exception e) {
	               e.printStackTrace();
	            }
	         }
	         
	         request.setAttribute("orderProductList", productList);
		} else if (view.contains("checkoutbuynow")) {

			request.setAttribute("center", "checkoutbuynow");
			
			List<CartProduct> productList = new ArrayList<>();
			
			String productId = request.getParameter("productId");
			String count = request.getParameter("count");
			String memberSeq = request.getParameter("memberSeq");

			Product product = Product.builder().sequence(Integer.parseInt(productId)).build();
			ProductServiceImpl service = new ProductServiceImpl();
			try {
				Product res = service.get(product);
				productList.add(new CartProduct());
				productList.get(0).setName(res.getName());
				productList.get(0).setPrice(res.getPrice());
				productList.get(0).setDiscountRate(res.getDiscountRate());
				productList.get(0).setTotalPoint((int) (Math.floor(res.getPrice() * Integer.parseInt(count) * res.getPointAccumulationRate() * 0.01)));
				productList.get(0).setCount(Integer.parseInt(count));
				int priceMuldiscountRate = (int) ((int) res.getPrice() * ((100 - res.getDiscountRate()) * 0.01)) * Integer.parseInt(count);
				
				productList.get(0).setTotalPrice(priceMuldiscountRate - priceMuldiscountRate%10);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("orderProductList", productList);
			
		} else if (view.equals("contact")) {
			request.setAttribute("center", "contact");
		} else if (view.equals("shop-details")) {
			request.setAttribute("center", "shop-details");
		} else if (view.equals("shop-grid")) {
			request.setAttribute("center", "shop-grid");
		} else if (view.equals("shopping-cart")) {
			request.setAttribute("center", "shoping-cart");
	         memberSeq = request.getParameter("memberSeq");
	         
	         List<Cart> cartList = new ArrayList<>();
	         List<CartProduct> productList = new ArrayList<>();
	         CartServiceImpl cartService = new CartServiceImpl();
	         request.setAttribute("myCartList", null);
	         request.setAttribute("myCartProductList", null);

	         Cart cart = Cart.builder().
	               memberSequence(Integer.parseInt(memberSeq)).build();
	         
	         try {
	            cartList = cartService.getAll(cart);
	            request.setAttribute("myCartList", cartList);
	            productList = cartService.getProductInfo(cart);
	            request.setAttribute("myCartProductList", productList);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }

		}

	}
}