package web.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import app.dto.entity.Member;
import app.dto.entity.Point;
import app.enums.PointStateEnum;
import app.frame.ControllerFrame;
import app.impl.cart.CartServiceImpl;
import app.impl.member.MemberServiceImpl;
import app.impl.point.PointServiceImpl;
import app.impl.product.ProductServiceImpl;
import web.dispatcher.Navi;

/**
* Servlet implementation class CustServlet
*/
@WebServlet({"/member"})

public class MemberServlet implements ControllerFrame {
	private static final long serialVersionUID = 1L;
	BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private MemberServiceImpl memServiceImpl;
	private CartServiceImpl cartServiceImpl;
	private PointServiceImpl pointServiceImpl;
	ProductServiceImpl productService;
	private Logger user_log = Logger.getLogger("user");
	
    public MemberServlet() {
        super();
        memServiceImpl = new MemberServiceImpl();
        cartServiceImpl = new CartServiceImpl();
        productService = new ProductServiceImpl();
        pointServiceImpl = new PointServiceImpl();
        bCryptPasswordEncoder = new BCryptPasswordEncoder();
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

    
    private void build(HttpServletRequest request, String view){
      if(view.equals("register")){
         request.setAttribute("center", "register");
         request.setAttribute("navi", Navi.register);
      }else if(view.equals("login")){
         request.setAttribute("center", "signin");
         request.setAttribute("navi", Navi.login);
      }else if(view.equals("loginimpl")) {
         System.out.println("Login Start");
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         
         Member loginInfo = Member.builder()
               .email(email)
               .hashedPwd(password)
               .build();

         try {
            Member loginUser = memServiceImpl.get(loginInfo);
            user_log.debug("로그인된 이메일 정보: "+loginUser.getEmail());
            if(bCryptPasswordEncoder.matches(password, loginUser.getHashedPwd())) {
               
               HttpSession session = request.getSession();
               session.setAttribute("logincust", loginUser);
               memServiceImpl.modify(loginUser); 
               
               int cartCount = cartServiceImpl.getCartCount(loginUser.getSequence());
               session.setAttribute("cartCount", cartCount);
               
               request.setAttribute("BestSeller", productService.getBestseller());
               request.setAttribute("Latest", productService.getLatest());
               request.setAttribute("BigPoint", productService.getPoint());
               request.setAttribute("BigDiscount", productService.getDiscount());
               
            } else {
               request.setAttribute("center", "signin");
               request.setAttribute("msg", "email 또는 password가 일치하지 않습니다.");
            }
         } catch (Exception e) {
            e.printStackTrace();
         }
      }else if(view.equals("logout")){
         HttpSession session = request.getSession();
         if(session.getAttribute("logincust") != null) {
            session.removeAttribute("logincust");
            session.invalidate();
            
         }
         try {
			request.setAttribute("BestSeller", productService.getBestseller());
			request.setAttribute("Latest", productService.getLatest());
	        request.setAttribute("BigPoint", productService.getPoint());
	        request.setAttribute("BigDiscount", productService.getDiscount());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         
      }else if(view.equals("signup")) {
         String email = request.getParameter("email");
         String password = request.getParameter("password");
         String name = request.getParameter("name");
         String phone = request.getParameter("phone");
         String zipcode = request.getParameter("zipcode");
         String streetAddress1 = request.getParameter("street_address_1");
         String streetAddress2 = request.getParameter("street_address_2");
         String addressDetail = request.getParameter("address_detail");
         
         password = bCryptPasswordEncoder.encode(password);
         Member signUpInfo = Member.builder()
               .email(email)
               .hashedPwd(password)
               .name(name)
               .memberPhone(phone)
               .zipcode(zipcode)
               .streetAddress(streetAddress1+" "+streetAddress2)
               .addressDetail(addressDetail)
               .build();

         try {
            memServiceImpl.register(signUpInfo);
            request.setAttribute("center", "signin");
            request.setAttribute("msg", "회원가입을 축하합니다! 로그인을 진행해주세요 :)");
            
            Point point = null;
            int memberSeq = pointServiceImpl.getMemberSeq();
            
            point = Point.builder().point(1000).state(PointStateEnum.REGISTERED).memberSequence(memberSeq).build();
            pointServiceImpl.register(point);
            pointServiceImpl.modify(point);
            
         } catch (Exception e) {
            e.printStackTrace();
         }
      }
   }
}