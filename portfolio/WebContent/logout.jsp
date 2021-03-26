<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>

<%
	session.invalidate();

	RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
	dispatcher.forward(request, response);
%>