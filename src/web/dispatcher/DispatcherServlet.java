package web.dispatcher;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import app.frame.ControllerFrame;
import web.controller.CategoryServlet;
import web.controller.MainServlet;
import web.controller.MemberServlet;
import web.controller.ProductDetailServlet;
import web.controller.RestController;
import web.controller.ReviewServlet;
import web.controller.SearchServlet;

@WebServlet({ "/DispatcherServlet", "/dispatcher", "*.bit"})
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Logger work_log = 
	Logger.getLogger("work"); 
	private Map<String, ControllerFrame> controllerMapper = new HashMap<>();
	
	public DispatcherServlet() {
        super();
        controllerMapper.put("/main",new MainServlet());
        controllerMapper.put("/member",new MemberServlet());
        controllerMapper.put("/rest",new RestController());
        controllerMapper.put("/product-detail",new ProductDetailServlet());
        controllerMapper.put("/category",new CategoryServlet());
        controllerMapper.put("/search", new SearchServlet());
        controllerMapper.put("/review", new ReviewServlet());
        
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
		request.setCharacterEncoding("UTF-8");
		String path = uri.substring(uri.lastIndexOf("/"));
		work_log.debug(path);
		path = path.substring(0, path.lastIndexOf("."));
		work_log.debug(path);
		
		System.out.println(path);
		try {
			if (controllerMapper.containsKey(path)) {
				ControllerFrame controller = controllerMapper.get(path);
				controller.execute(request, response);
			}
		}catch(Exception e){ 
			throw new RuntimeException(e.getMessage());
		}
		
	}
	
	
	

}





