package controller;

import java.io.IOException;
import java.net.URLDecoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;

@WebServlet("*.book")
public class BookCtrl extends HttpServlet {

	@Override
	public void service(ServletRequest req, ServletResponse res) throws ServletException, IOException {
		String cmd = req.getParameter("command");
		if (cmd.equals("top")) {
			try {
				
				String keyword = URLDecoder.decode(req.getParameter("keyword"), "UTF-8");
				int nowPage = Integer.parseInt(req.getParameter("page"));
				int startPage = (((int) ((double) nowPage / 10 + 0.9)) - 1) * 10 + 1;
				int endPage = startPage + 10 - 1;
				int maxPage = 10;
				
				if(req.getParameter("maxPage") != null) {
					maxPage = Integer.parseInt(req.getParameter("maxPage"));
				}
				
				req.setAttribute("keyword", keyword);
				req.setAttribute("nowPage", nowPage);
				req.setAttribute("startPage", startPage);
				req.setAttribute("endPage", endPage);
				req.setAttribute("maxPage", maxPage);

				String link = "Books.jsp";

				RequestDispatcher dispatcher = req.getRequestDispatcher(link);
				dispatcher.forward(req, res);
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if(cmd.equals("info")) {
			try {
				String str = req.getParameter("isbn");
				String isbn = "0";
				
				if(str.length()>14) {
					isbn = str.substring(11);
				} else if(str.length()<=14 && str.length()>10) {
					isbn = str.substring(1);
				} else {
					isbn = str;
				}
				
				req.setAttribute("isbn", isbn);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("BookInfo.jsp");
				dispatcher.forward(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}
		} else if(cmd.equals("inf")) {
			try {
				String isbn = req.getParameter("isbn");
				
				req.setAttribute("isbn", isbn);
				
				RequestDispatcher dispatcher = req.getRequestDispatcher("BookInfo.jsp");
				dispatcher.forward(req, res);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
}
