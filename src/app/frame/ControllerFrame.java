package app.frame;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface ControllerFrame {
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
