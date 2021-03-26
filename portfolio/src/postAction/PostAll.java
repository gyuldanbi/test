package postAction;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import post.PageInfo;
import post.PostDAO;
import post.PostDTO;

public class PostAll implements PostInter {
	static PostAll post = new PostAll();
	public static PostAll instance() {
		return post;
	}

	@Override
	public String showData(HttpServletRequest req, HttpServletResponse res)
	throws Exception {
		PostDAO dao = PostDAO.instance();
		PageInfo pageInfo = new PageInfo();
		
		int page=1;
		int limit=10;
		int listCount = dao.getListCount();
		
		if(req.getParameter("page")!=null){
			page=Integer.parseInt(req.getParameter("page"));
		}
		int startrow=(page-1)*10;
		
		List<PostDTO> list = dao.selAll(startrow);
		
		for(PostDTO dto : list) {
			String text = dto.getContent();
			if(text.length() > 140) {
				dto.setContent(text.substring(0, 139) + "…");
			}
		}
		
		int maxPage=(int)((double)listCount/limit+0.95); 
   		int startPage = (((int) ((double)page / 10 + 0.9)) - 1) * 10 + 1;
   	        int endPage = startPage+10-1;

   		if (endPage> maxPage) endPage= maxPage;
   		
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);
   		
		req.setAttribute("list", list);
		req.setAttribute("pageInfo", pageInfo);
		
		return "story.jsp";
	}
}
