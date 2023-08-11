package web.dispatcher;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

@WebFilter(urlPatterns = "/*")
public class BadRequestFilter implements Filter{
	private Logger work_log = 
	Logger.getLogger("work"); 
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		//���� �ʱ�ȭ �۾�
	}


	@Override
	public void destroy() {
		// �ַ� ���Ͱ� ����� �ڿ� �ݳ�
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// 1. request �Ķ���͸� �̿��� ��û ���� �۾� ����
		request.setCharacterEncoding("UTF-8");
		String uri = ((HttpServletRequest)request).getRequestURI();
		work_log.debug("doFilter----"+uri);

		String path = uri.substring(uri.lastIndexOf("/"));
		work_log.debug("doFilter----"+path);
		if(path.equals("/")) {
			((HttpServletResponse)response).sendRedirect("main.bit");
			return;
		}
		
//		else {
//			path = path.substring(path.lastIndexOf("."), path.length());
//			work_log.debug("doFilter3----"+path);
//			if(!path.equals(".bit")) {
//				((HttpServletResponse)response).sendRedirect("main.bit");
//				return;
//			}
//		}
		
		
	

		// 2. ü���� ���� ���� ó��
		chain.doFilter(request, response);
		
		// 3. response �� �̿��� ��û ���͸� �۾� ����

		
	}
}