package postAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.PostDAO;
import post.PostDTO;

public class PostSelc implements PostInter {
	static PostSelc post = new PostSelc();
	public static PostSelc instance() {
		return post;
	}

	@Override
	public String showData(HttpServletRequest req, HttpServletResponse res)
	throws Exception {
		int postNum = Integer.parseInt(req.getParameter("postNum"));
		PostDAO dao = PostDAO.instance();
		PostDTO post = dao.select(postNum);
		req.setAttribute("post", post);
		return "post.jsp";
	}

}
