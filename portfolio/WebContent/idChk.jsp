<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>중복확인</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
</head>
<style>
div {
	margin-top: 40px;
	text-align: center;
	vertical-align: middle;
}
input[type="button"] {
	width: 80px;
	height: 30px;
	margin-top: 10px;
}
font {
	font-size: 14pt;
	font-weight: 400;
}
</style>
<body>
	<div>
		<%
			String id = request.getParameter("id");

			UserDAO act = new UserDAO();
			if (act.checkId(id)) {
		%>
		<font>이미 사용 중인 아이디입니다</font>
		<%
			} else {
		%>
		<font>사용 가능한 아이디입니다</font>
		<%
			}
		%>
		<br>
		<input type="button" value="확인" onclick="window.close();">
	</div>
</body>
</html>