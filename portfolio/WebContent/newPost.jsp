<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 포스트</title>
<link rel="stylesheet" type="text/css" href="css/newPost.css" />
</head>

<script type="text/javascript" src="js/function.js"></script>

<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<div class="box">
		<form method="post" action="post.do?command=posting"
			onsubmit="return post()">
			<section id="postBox">
				<input type="hidden" name="id"
					value="<%=session.getAttribute("id")%>"> <select
					name="board" size="1">
					<option value="1">게시판1</option>
					<option value="2">게시판2</option>
				</select> <input type="text" placeholder="제목" name="title" class="contents"><br>
				<textarea placeholder="내용" name="content" class="contents"></textarea>
				<input type="submit" value="발행"> <input type="button"
					value="취소" onclick="history.back();">
			</section>
		</form>
	</div>

	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>