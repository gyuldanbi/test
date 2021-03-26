package postAction;

import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.PostDAO;
import post.PostDTO;

public class PostIns implements PostInter {
	static PostIns post = new PostIns();
	public static PostIns instance() {
		return post;
	}

	@Override
	public String showData(HttpServletRequest req, HttpServletResponse res)
	throws Exception {
		PostDTO post = new PostDTO();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		String today = format.format(System.currentTimeMillis());
				
		post.setUserId(req.getParameter("id"));
		post.setBoard(req.getParameter("board"));
		post.setDate(Date.valueOf(today));
		post.setTitle(req.getParameter("title"));
		post.setContent(req.getParameter("content"));
		PostDAO dao = PostDAO.instance();
		dao.insert(post);		
		
		return "post.do?command=story";
	}
}
