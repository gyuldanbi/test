<%@page import="user.UserDTO"%>
<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.sql.*"%>

<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("id");
	String pass = request.getParameter("password");
	String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String birth = request.getParameter("birth");
	String number = request.getParameter("numhead") + "-" 
			+ request.getParameter("nummiddle") + "-"
			+ request.getParameter("numlast");

	String email = null;
	if (request.getParameter("email") != "")
		email = request.getParameter("email") + "@" + request.getParameter("domain");

	String postcode = null;
	if (request.getParameter("postcode") != "")
		postcode = request.getParameter("postcode");

	String address = null;
	if (request.getParameter("address") != "")
		address = request.getParameter("address") + " " + request.getParameter("detailAddress");

	String send_mail = request.getParameter("send_mail");
	if (send_mail == null)
		send_mail = "n";

	String send_text = request.getParameter("send_text");
	if (send_text == null)
		send_text = "n";

	UserDTO newbie = new UserDTO();

	newbie.setId(id);
	newbie.setPassword(pass);
	newbie.setName(name);
	newbie.setSex(sex);
	newbie.setBirth(birth);
	newbie.setNumber(number);
	newbie.setEmail(email);
	newbie.setPostcode(postcode);
	newbie.setAddress(address);
	newbie.setSend_mail(send_mail);
	newbie.setSend_text(send_text);

	UserDAO dao = new UserDAO();

	dao.input(newbie);

	RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
	dispatcher.forward(request, response);
%>