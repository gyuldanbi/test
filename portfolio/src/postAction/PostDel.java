package postAction;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.PostDAO;

public class PostDel implements PostInter {
	static PostDel post = new PostDel();
	public static PostDel instance() {
		return post;
	}
	
	@Override
	public String showData(HttpServletRequest req, HttpServletResponse res)
	throws Exception {
		int postNum = Integer.parseInt(req.getParameter("postNum"));
		PostDAO dao = PostDAO.instance();
		dao.delete(postNum);

		return "post.do?command=story";
	}
}
