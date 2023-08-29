package web.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.cust.CustServiceImpl;
import app.dto.entity.Cart;
import app.dto.entity.Member;
import app.dto.entity.Order;
import app.dto.entity.OrderDetail;
import app.dto.entity.Point;
import app.dto.entity.Product;
import app.dto.entity.Review;
import app.dto.response.CartProduct;
import app.dto.response.OrderDetailResponse;
import app.dto.response.ReviewDetails;
import app.enums.PointStateEnum;
import app.frame.ControllerFrame;
import app.impl.cart.CartServiceImpl;
import app.impl.order.OrderServiceImpl;
import app.impl.orderdetail.OrderDetailServiceImpl;
import app.impl.point.PointServiceImpl;
import app.impl.product.ProductServiceImpl;
import app.impl.review.ReviewServiceImpl;

/**
 * Servlet implementation class CustServlet
 */
@WebServlet({ "/main" })
public class MainServlet implements ControllerFrame {
	private static final long serialVersionUID = 1L;
	CustServiceImpl custService;
	ProductServiceImpl productService;
	CartServiceImpl cartService;
	PointServiceImpl pointService;
	OrderDetailServiceImpl orderDetailService;
	
	String memberSeq = null;

	public MainServlet() {
		super();
		custService = new CustServiceImpl();
		productService = new ProductServiceImpl();
		cartService = new CartServiceImpl();
		pointService = new PointServiceImpl();
		orderDetailService = new OrderDetailServiceImpl();
	}

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String next = "index.jsp";
		String view = request.getParameter("view");

		build(request, view);

		RequestDispatcher rd = request.getRequestDispatcher(next);
		rd.forward(request, response);
	}

	private void build(HttpServletRequest request, String view) {

		if (view == null) {			
	         // 책 리스트 불러오기
			 try {
			    request.setAttribute("BestSeller", productService.getBestseller());
			    request.setAttribute("Latest", productService.getLatest());
			    request.setAttribute("BigPoint", productService.getPoint());
			    request.setAttribute("BigDiscount", productService.getDiscount());
			    
			    if (memberSeq != null) {
			    	int cartCount = cartService.getCartCount(Long.parseLong(memberSeq));
		            request.setAttribute("cartCount", cartCount);
		            
			    }
			    
		     } catch (Exception e2) {
		        e2.printStackTrace();
		     }
		} else if (view.equals("signup")) {
			request.setAttribute("center", "signup");
		} else if (view.equals("signin")) {
			request.setAttribute("center", "signin");

	} else if (view.contains("checkout-result")) {
			OrderServiceImpl orderService = new OrderServiceImpl();
			OrderDetailServiceImpl orderDetailService = new OrderDetailServiceImpl();
			ProductServiceImpl productService = new ProductServiceImpl();
			request.setAttribute("center", "checkout-result");

			String receiver_name = request.getParameter("input__receiverName");
			String order_phone = request.getParameter("input__phone");
			String zipcode = request.getParameter("input__zipcode");
			String street_address = request.getParameter("input__street_address");
			String address_detail = request.getParameter("input__address_detail");
			String vendor_message = request.getParameter("input__vendor_message");
			String email = request.getParameter("input__email");
			Order order = Order.builder().receiverName(receiver_name).orderPhone(order_phone)
					.vendorMessage(vendor_message).addressDetail(address_detail).streetAddress(street_address)
					.receiverEmail(email).zipcode(zipcode).memberSequence(Long.parseLong(memberSeq)).build();
			String cmd = request.getParameter("cmd");
			int usePoint = Integer.parseInt(request.getParameter("usePoint")) * -1;

			int totalPoint = 0;
			int totalPrice = 0;
			if (cmd.equals("1")) {
				// cart에서 구매한 경우
				String parameter = request.getParameter("sequences");

				String[] cartSequences = parameter.split(","); // 구매한 카트 물품들
				
				try {
					orderService.register(order);

					// memberId에 해당하는 가장 최근 order sequence
					List<Order> orderList = orderService
							.getAll(Order.builder().memberSequence(Long.parseLong(memberSeq)).build());
					List<OrderDetail> orderDetailList = new ArrayList<>();

					// TODO : Order sequence에 해당하는 OrderDetail 채우기
					for (int i = 0; i < cartSequences.length; i++) {
						Cart tempCart = Cart.builder().sequence(Long.parseLong(cartSequences[i])).build();
						Cart cart = cartService.get(tempCart);
						Product tempProduct = Product.builder().sequence(cart.getProductSequence()).build();
						Product product = productService.get(tempProduct);

						try {

							OrderDetail orderDetail = OrderDetail.builder()
									.orderSequence(orderList.get(0).getSequence()).orderDetailProduct(product)
									.count(cart.getCount())
									.productPoint(product.getPointAccumulationRate() * 0.01 * product.getPrice())
									.productPrice(product.getPrice()).productSequence(product.getSequence()).build();
							totalPoint += product.getPointAccumulationRate() * 0.01 * cart.getCount()
									* product.getPrice();
							totalPrice += product.getPrice() * cart.getCount();
							orderDetailService.register(orderDetail);
							orderDetailList.add(orderDetail);
							
							cartService.remove(tempCart);
							int cartCount = cartService.getCartCount(Long.parseLong(memberSeq));
				            request.setAttribute("cartCount", cartCount);
						} catch (Exception e) {
							e.printStackTrace();
						}
					}
					request.setAttribute("orderResult", order);
					request.setAttribute("orderDetailResult", orderDetailList);
					request.setAttribute("totalPoint", totalPoint);
					request.setAttribute("totalPrice", totalPrice);
					request.setAttribute("usedPoint", usePoint);
					
					// 포인트 사용
					Point point = Point.builder().point(usePoint).state(PointStateEnum.USED).memberSequence(Long.parseLong(memberSeq)).build();
		            pointService.register(point);
		            pointService.modify(point);
		            
		           
				} catch (Exception e1) {
					e1.printStackTrace();
				}
			} else if (cmd.equals("2")) {
				// 바로 구매한 경우
				try {
					orderService.register(order);
					
					int count = Integer.parseInt(request.getParameter("count"));
					int productId = Integer.parseInt(request.getParameter("productId"));
					double pointAccumulationRate = Double.valueOf(request.getParameter("point"));
					Integer price = Integer.parseInt(request.getParameter("price"));
					
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
					List<Order> orderList = orderService
							.getAll(Order.builder().memberSequence(Long.parseLong(memberSeq)).build());
					request.setAttribute("orderResult", orderList.get(0)); // 방금 생성된 Order

					List<OrderDetailResponse> orderDetail = new ArrayList<>();
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
					request.setAttribute("usedPoint", usePoint);
					
					// 포인트 사용
					Point point = Point.builder().point(usePoint).state(PointStateEnum.USED).memberSequence(Long.parseLong(memberSeq)).build();
		            pointService.register(point);
		            pointService.modify(point);
				} catch (Exception e) {
					e.printStackTrace();
				}
				
			}
		} else if (view.equals("loginimpl"))

		{
			String id = request.getParameter("id");
			String pwd = request.getParameter("pwd");
			// 로그인
		} else if (view.contains("mypage")) {
			request.setAttribute("center", "mypage");
			memberSeq = request.getParameter("memberSeq");
			List<Cart> cartList = new ArrayList<>();
			List<CartProduct> productList = new ArrayList<>();
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

				// 2. order sequence에 해당하는 orderDetail 채워주기
				for (int i = 0; i < orderList.size(); i++) {
					List<OrderDetailResponse> orderDetail = new ArrayList<>();
					
					orderDetail = orderDetailService.get(orderList.get(i).getSequence());
						
					// 3. orderDetail 각각에 해당하는 Product, Review 작성여부 채워주기
					for (int j = 0; j < orderDetail.size(); j++) {
						Product product = Product.builder().sequence(orderDetail.get(j).getProductSequence()).build();
						orderDetail.get(j).setOrderDetailProduct(productService.get(product));
						// 리뷰 기 작성여부 채워주기
						Review reviewInfo = Review.builder().orderdetailSequence(orderDetail.get(j).getSequence()).build();
						Review result = reviewServiceImpl.get(reviewInfo);
						if(result == null) {
							orderDetail.get(j).setReviewState("NONEXIST");
						}else {
							orderDetail.get(j).setReviewState("EXIST");
						}
					}

					orderList.get(i).setOrderDetailList(orderDetail);
					
				}
				
				// 2-2. review의 product_sequence에 해당하는 Product 정보 채워주기
				for(int i=0; i< reviewDetailList.size(); i++) {
					Product product = Product.builder().sequence(reviewDetailList.get(i).getProductSequence()).build();
					reviewDetailList.get(i).setReviewDetailProduct(productService.get(product));
					System.out.println("삭제됨?:"+reviewDetailList.get(i).isDeleted());
				}

				// 3. myPage로 보내기
				request.setAttribute("myOrderList", orderList);
				request.setAttribute("myReviewList", reviewDetailList);

				
				int cartCount = cartService.getCartCount(Long.parseLong(memberSeq));
	            request.setAttribute("cartCount", cartCount);
	               
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (view.contains("deleteCart")) {
			request.setAttribute("center", "mypage");
			int sequence = Integer.parseInt(request.getParameter("sequence"));
			int memberSeq = Integer.parseInt(request.getParameter("memberSeq"));
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

			request.setAttribute("sequences", parameter);
			String[] cartSequences = parameter.split(",");
			List<CartProduct> productList = new ArrayList<>();
			int totalPrice = 0;
			int totalPoint = 0;

			for (int i = 0; i < cartSequences.length; i++) {
				Cart cart = Cart.builder().sequence(Long.parseLong(cartSequences[i])).build();
				try {
					productList.add(cartService.cartGet(cart));

					if (i == 0) {
						totalPrice = (int) ((productList.get(i).getPrice()
								* ((100 - productList.get(i).getDiscountRate()) * 0.01)) * productList.get(i).getCount()
								- ((productList.get(i).getPrice()
										* ((100 - productList.get(i).getDiscountRate()) * 0.01))
										* productList.get(i).getCount()) % 10);
						totalPoint = (int) (Math.floor(productList.get(i).getPrice() * productList.get(i).getCount()
								* productList.get(i).getPointAccumulationRate() * 0.01));
					} else {
						totalPrice = (int) (productList.get(i - 1).getTotalPrice()
								+ (productList.get(i).getPrice()
										* ((100 - productList.get(i).getDiscountRate()) * 0.01))
										* productList.get(i).getCount()
								- ((productList.get(i).getPrice()
										* ((100 - productList.get(i).getDiscountRate()) * 0.01))
										* productList.get(i).getCount()) % 10);
						totalPoint = (int) (productList.get(i - 1).getTotalPoint()
								+ Math.floor(productList.get(i).getPrice() * productList.get(i).getCount()
										* productList.get(i).getPointAccumulationRate() * 0.01));
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
				productList.get(0).setTotalPoint((int) (Math
						.floor(res.getPrice() * Integer.parseInt(count) * res.getPointAccumulationRate() * 0.01)));
				productList.get(0).setCount(Integer.parseInt(count));
				int priceMuldiscountRate = (int) ((int) res.getPrice() * ((100 - res.getDiscountRate()) * 0.01))
						* Integer.parseInt(count);

				productList.get(0).setTotalPrice(priceMuldiscountRate - priceMuldiscountRate % 10);
				request.setAttribute("res", res);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("orderProductList", productList);
			request.setAttribute("count", count);
			request.setAttribute("productId", productId);

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
			request.setAttribute("myCartList", null);
			request.setAttribute("myCartProductList", null);

			Cart cart = Cart.builder().memberSequence(Integer.parseInt(memberSeq)).build();

			try {
				cartList = cartService.getAll(cart);
				request.setAttribute("myCartList", cartList);
				productList = cartService.getProductInfo(cart);
				request.setAttribute("myCartProductList", productList);
				
				int cartCount = cartService.getCartCount(Long.parseLong(memberSeq));
	            request.setAttribute("cartCount", cartCount);
			} catch (Exception e) {
				e.printStackTrace();
			}

		} else if (view.contains("changeOrderState")) {
			request.setAttribute("center", "mypage");
			long orderSeq = Long.parseLong(request.getParameter("sequence"));
			String state = request.getParameter("state");
			long productSeq = Long.parseLong(request.getParameter("productSeq"));
			int count = Integer.parseInt(request.getParameter("count"));
			
			OrderDetail orderDetail1 = OrderDetail.builder().sequence(orderSeq).state(state).productSequence(productSeq).count(count).build();

			try {
				orderDetailService.modify(orderDetail1);
				productService.updateByProductKeyWithOrderDetail(orderDetail1);
				
				if (state.equals("CONFIRMED")) {
					Product p = Product.builder().sequence(productSeq).build();

					Product productInfo = productService.get(p);
					
					int totalPoint = (int) Math.floor(productInfo.getPrice() * count * productInfo.getPointAccumulationRate() * 0.01);
					System.out.println(totalPoint);
					
					Point accumulatedPoint = Point.builder().point(totalPoint).state(PointStateEnum.ACCUMULATED).memberSequence(Long.parseLong(memberSeq)).build();
					pointService.register(accumulatedPoint);
					
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			List<Cart> cartList = new ArrayList<>();
			List<CartProduct> productList = new ArrayList<>();
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

				// 2. order sequence에 해당하는 orderDetail 채워주기
				for (int i = 0; i < orderList.size(); i++) {
					List<OrderDetailResponse> orderDetail = new ArrayList<>();
					
					orderDetail = orderDetailService.get(orderList.get(i).getSequence());
						
					// 3. orderDetail 각각에 해당하는 Product, Review 작성여부 채워주기
					for (int j = 0; j < orderDetail.size(); j++) {
						Product product = Product.builder().sequence(orderDetail.get(j).getProductSequence()).build();
						orderDetail.get(j).setOrderDetailProduct(productService.get(product));
						// 리뷰 기 작성여부 채워주기
						Review reviewInfo = Review.builder().orderdetailSequence(orderDetail.get(j).getSequence()).build();
						Review result = reviewServiceImpl.get(reviewInfo);
						if(result == null) {
							orderDetail.get(j).setReviewState("NONEXIST");
						}else {
							orderDetail.get(j).setReviewState("EXIST");
						}
					}

					orderList.get(i).setOrderDetailList(orderDetail);
					
				}
				
				// 2-2. review의 product_sequence에 해당하는 Product 정보 채워주기
				for(int i=0; i< reviewDetailList.size(); i++) {
					Product product = Product.builder().sequence(reviewDetailList.get(i).getProductSequence()).build();
					reviewDetailList.get(i).setReviewDetailProduct(productService.get(product));
					System.out.println("삭제됨?:"+reviewDetailList.get(i).isDeleted());
				}

				// 3. myPage로 보내기
				request.setAttribute("myOrderList", orderList);
				request.setAttribute("myReviewList", reviewDetailList);

				
				int cartCount = cartService.getCartCount(Long.parseLong(memberSeq));
	            request.setAttribute("cartCount", cartCount);
	               
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}
}