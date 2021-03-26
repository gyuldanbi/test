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
<link rel="stylesheet" type="text/css" href="css/reset.css">
</head>

<style>
#post {
	height: 638px;
}

#post h4 {
	width: 100%;
	padding: 4px 8px;
	border-bottom: 1px solid #b0b0b0;
	font-size: 14pt;
	font-weight: 400;
	box-sizing: border-box;
}

#post p {
	width: 100%;
	margin-top: 10px;
	padding: 4px 8px;
	box-sizing: border-box;
	font-size: 12pt;
	font-weight: 300;
}

#comment table {
	height: 40px;
	font-size: 11pt;
	box-sizing: border-box;
}

#comment th {
	height: 100%;
	font-weight: 400;
}

#comment textarea {
	height: 100%;
	padding: 4px 5px;
	font-weight: 300;
	resize: none;
	box-sizing: border-box;
}

#comment input[type="button"] {
	height: 100%;
}

#post_btn {
	margin-top: 0;
	padding-top: 10px;
	border-top: 1px solid #b0b0b0;
	height: 60px;
	box-sizing: border-box; 
}

#post_btn button {
	width: 60px;
	height: 40px;
}

#list {
	float: left;
}

.user {
	float: right;
	margin-left: 4px;
}
</style>

<script>
function post(num, post) {
	if(num==1) {
		location.href="post.do?command=story";
	} else if(num==2) {
		location.href="post.do?command=modify&postNum=" + post;
	} else if(num==3) {
		location.href="post.do?command=delete&postNum=" + post;
	}
	
}

</script>

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
			<button id="list" onclick="post(1, 0); return false;">목록</button>
			<%
				if (post.getUserId().equals(session.getAttribute("id"))) {
			%>
			<button class="user" onclick="post(2, <%= post.getPostNum() %>); return false;">수정</button>
			<button class="user" onclick="post(3, <%= post.getPostNum() %>); return false;">삭제</button>
			<%
				}
			%>
		</section>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>