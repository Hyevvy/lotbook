package web.controller;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import app.dto.entity.Cart;
import app.frame.ControllerFrame;
import app.impl.cart.CartServiceImpl;

/**
 * Servlet implementation class CustServlet
 */
@WebServlet({"/rest"})
public class RestController implements ControllerFrame {
	
	CartServiceImpl cartService = null;

    public RestController() {
        super();
        // TODO Auto-generated constructor stub
        cartService = new CartServiceImpl();
    }

    @Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String view = request.getParameter("view");

		Object result = "";
		if(view != null){
			result = build(request, view);
		}
		
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/json;charset=UTF-8");
		response.getWriter().print(result);		
	}

	private Object build(HttpServletRequest request,
			String view){
		Object result = null;
		if(view.equals("changeCount")){
			int count = Integer.parseInt(request.getParameter("count"));
			int productSequence = Integer.parseInt(request.getParameter("productSequence"));
			int sequence = Integer.parseInt(request.getParameter("sequence"));
			int memberSeq = Integer.parseInt(request.getParameter("memberSeq"));

			// 개수가 1 이하로 내려갈 경우 1로 고정
			if (count < 1) {
				count = 1;
			}

			Cart cart = Cart.builder().count(count).productSequence(productSequence).sequence(sequence)
					.memberSequence(memberSeq).build();

			try {
				int changeResult = cartService.modify(cart);
				
				if (changeResult == 1) {
					result = count;
				}
			} catch (Exception e) {
				e.printStackTrace();
				result = 0;
			} 
		} else if(view.equals("addToCart")) {
			int count = Integer.parseInt(request.getParameter("count"));
			int productSequence = Integer.parseInt(request.getParameter("productSequence"));
			int memberSeq = Integer.parseInt(request.getParameter("memberSeq"));
			Cart cart = Cart.builder()
						.count(count)
						.productSequence(productSequence)
						.memberSequence(memberSeq)
						.build();
			
			try {
				int changeResult = cartService.register(cart);
				result = changeResult;
			} catch (Exception e) {
				e.printStackTrace();
				result = 0;
			} 
			
		}
		return result; 
	}



}
