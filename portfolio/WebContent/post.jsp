<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<link rel="stylesheet" type="text/css" href="css/post.css">
<script type="text/javascript" src="js/function.js"></script>
</head>

<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<jsp:useBean id="post" scope="request" class="post.PostDTO"
		type="post.PostDTO" />
	<div class="box">
		<section id="post">
			<h4><%= post.getTitle() %></h4>
			<p><%= post.getContent() %></p>
		</section>
		<section id="post_btn">
			<button id="list" onclick="postBtn(1, 0); return false;">목록</button>
			<%
				if (post.getUserId().equals(session.getAttribute("id"))) {
			%>
			<button class="user" onclick="postBtn(2, <%= post.getPostNum() %>); return false;">수정</button>
			<button class="user" onclick="postBtn(3, <%= post.getPostNum() %>); return false;">삭제</button>
			<%
				}
			%>
		</section>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>