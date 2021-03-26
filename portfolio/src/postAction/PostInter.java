package postAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface PostInter {
	String showData(HttpServletRequest req, HttpServletResponse res) throws Exception;
}
