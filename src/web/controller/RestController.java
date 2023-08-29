package web.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;

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
			request.setAttribute("memberSeq", memberSeq);
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
		} else if (view.contains("kakaopay")) {
			String name = request.getParameter("name");
			String count = request.getParameter("count");
			String price = request.getParameter("price").split(" ")[0];
			String pointAccumulationRate = request.getParameter("pointAccumulationRate");
			String productId = request.getParameter("productId");
			
			String receiver_name = request.getParameter("input__receiverName");
			String order_phone = request.getParameter("input__phone");
			String zipcode = request.getParameter("input__zipcode");
			String street_address = request.getParameter("input__street_address");
			String address_detail = request.getParameter("input__address_detail");
			String vendor_message = request.getParameter("input__vendor_message");
			String email = request.getParameter("input__email");
			
			String[] tmpPrice = price.split(",");
			String totalPrice = tmpPrice[0] + tmpPrice[1];
			
			System.out.println(name);
			try {
				// 보내는 부분
				URL address = new URL("https://kapi.kakao.com/v1/payment/ready");
				HttpURLConnection connection = (HttpURLConnection) address.openConnection(); // 서버연결
				connection.setRequestMethod("POST");
				connection.setRequestProperty("Authorization", "KakaoAK 4c7873742735709ce73aa1303c5fe972"); // 어드민 키
				connection.setRequestProperty("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				connection.setDoOutput(true); // 서버한테 전달할게 있는지 없는지

				String parameter = "cid=TC0ONETIME" // 가맹점 코드
						+ "&partner_order_id=LOTBOOK"
						+ productId // 가맹점 주문번호
						+ "&partner_user_id=LOTBOOKCUST"  // 가맹점 회원 id
						+ "&item_name=" + URLEncoder.encode(name, "utf-8") // 상품명
						+ "&quantity=" + count // 상품 수량
						+ "&total_amount=" + totalPrice // 총 금액
						+ "&vat_amount=0" // 부가세
						+ "&tax_free_amount=0" // 상품 비과세 금액
						+ "&approval_url=http://127.0.0.1:8080/lotbook/main.bit?view=checkout-result&input__receiverName=" + receiver_name + "&input__phone=" + order_phone + "&input__zipcode=" + zipcode + "&input__street_address=" + street_address + "&input__address_detail=" + address_detail + "&input__vendor_message=" + vendor_message + "&input__email=" + email + "&count=" + count + "&productId=" + productId + "&point=" + pointAccumulationRate + "&price=" + totalPrice + "/"
						+ "&fail_url=http://127.0.0.1:8080/lotbook/main.bit/" // 결제 실패 시
						+ "&cancel_url=http://127.0.0.1:8080/lotbook/main.bit/"; // 결제 취소 시
				OutputStream send = connection.getOutputStream(); // 이제 뭔가를 를 줄 수 있다.
				DataOutputStream dataSend = new DataOutputStream(send); // 이제 데이터를 줄 수 있다.
				dataSend.writeBytes(parameter); // OutputStream은 데이터를 바이트 형식으로 주고 받기로 약속되어 있다. (형변환)
				dataSend.close(); // flush가 자동으로 호출이 되고 닫는다. (보내고 비우고 닫다)
				
				int rst = connection.getResponseCode(); // 전송 잘 됐나 안됐나 번호를 받는다.
				InputStream receive; // 받다
				System.out.println(rst);
				if(rst == 200) {
					receive = connection.getInputStream();
				}else {
					receive = connection.getErrorStream(); 
				}
				// 읽는 부분
				InputStreamReader read = new InputStreamReader(receive); // 받은걸 읽는다.
				BufferedReader change = new BufferedReader(read); // 바이트를 읽기 위해 형변환 버퍼리더는 실제로 형변환을 위해 존제하는 클레스는 아니다.
				// 받는 부분
				return change.readLine(); // 문자열로 형변환을 알아서 해주고 찍어낸다 그리고 본인은 비워진다.
				
			} catch (MalformedURLException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		return result; 
	}



}
