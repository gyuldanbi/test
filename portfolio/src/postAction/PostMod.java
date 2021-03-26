package postAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.PostDAO;
import post.PostDTO;

public class PostMod implements PostInter {
	static PostMod post = new PostMod();
	public static PostMod instance() {
		return post;
	}
	
	@Override
	public String showData(HttpServletRequest req, HttpServletResponse res)
	throws Exception {
		int postNum = Integer.parseInt(req.getParameter("postNum"));
		PostDAO dao = PostDAO.instance();
		PostDTO post = dao.select(postNum);
		req.setAttribute("post", post);
		return "postModify.jsp";
	}
}
