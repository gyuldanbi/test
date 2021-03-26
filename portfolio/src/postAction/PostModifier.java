package postAction;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.PostDAO;
import post.PostDTO;

public class PostModifier implements PostInter {
	static PostModifier post = new PostModifier();
	public static PostModifier instance() {
		return post;
	}
	
	@Override
	public String showData(HttpServletRequest req, HttpServletResponse res) throws Exception {
		PostDAO dao = PostDAO.instance();
		PostDTO post = new PostDTO();
		post.setPostNum(req.getParameter("postNum"));
		post.setBoard(req.getParameter("board"));
		post.setTitle(req.getParameter("title"));
		post.setContent(req.getParameter("content"));
		dao.update(post);
		return "post.do?command=post&postNum=" + post.getPostNum();
	}

}
