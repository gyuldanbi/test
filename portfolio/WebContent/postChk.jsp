<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	if (session.getAttribute("id")==null) {
%>
		<script>alert("로그인 후 이용할 수 있습니다");
		location.href="login.jsp";</script>
<%
	} else {
%>
	<script>location.href="newPost.jsp";</script>
<%
	}
%>