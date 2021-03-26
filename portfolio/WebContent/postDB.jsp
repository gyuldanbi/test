<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>\

<jsp:useBean id="post" class="post.PostDTO" scope="" />
<%	
	request.setCharacterEncoding("UTF-8");
	
	String id = (String)session.getAttribute("id");
	String board = request.getParameter("board");
	String title = request.getParameter("title");
	String content = request.getParameter("content");

	post.setUserId(id);
	post.setBoard(board);
	post.setTitle(title);
	post.setContent(content);
	post.setTag1("null");
	post.setTag2("null");
	post.setTag3("null");
	post.setTag4("null");
	post.setTag5("null");
	post.setIsbn("null");
	
	RequestDispatcher dispatcher = request.getRequestDispatcher("post.do?command=posting");
	dispatcher.forward(request, response);
%>