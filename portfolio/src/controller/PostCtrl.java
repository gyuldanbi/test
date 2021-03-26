package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import postAction.PostAll;
import postAction.PostDel;
import postAction.PostIns;
import postAction.PostMod;
import postAction.PostModifier;
import postAction.PostSelc;

public class PostCtrl extends HttpServlet {

	@Override
	public void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String cmd = req.getParameter("command");
		String name;

		if (cmd.equals("story")) {
			PostAll post = PostAll.instance();

			try {
				name = post.showData(req, res);

				RequestDispatcher dispatcher = req.getRequestDispatcher(name);
				dispatcher.forward(req, res);
			} catch (Exception e) {
				System.out.println(e);
			}

		} else if (cmd.equals("post")) {
			PostSelc post = PostSelc.instance();

			try {
				name = post.showData(req, res);

				RequestDispatcher dispatcher = req.getRequestDispatcher(name);
				dispatcher.forward(req, res);
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (cmd.equals("delete")) {
			PostDel post = PostDel.instance();

			try {
				name = post.showData(req, res);

				res.sendRedirect(name);
			} catch (Exception e) {
				System.out.println(e);
			}

		} else if (cmd.equals("modify")) {
			PostMod post = PostMod.instance();

			try {
				name = post.showData(req, res);

				RequestDispatcher dispatcher = req.getRequestDispatcher(name);
				dispatcher.forward(req, res);
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (cmd.equals("modifier")) {
			PostModifier post = PostModifier.instance();
			try {
				name = post.showData(req, res);

				RequestDispatcher dispatcher = req.getRequestDispatcher(name);
				dispatcher.forward(req, res);
			} catch (Exception e) {
				System.out.println(e);
			}
		} else if (cmd.equals("posting")) {
			PostIns post = PostIns.instance();

			try {
				name = post.showData(req, res);

				RequestDispatcher dispatcher = req.getRequestDispatcher(name);
				dispatcher.forward(req, res);
			} catch (Exception e) {
				System.out.println(e);
			}
		}

	}
}
