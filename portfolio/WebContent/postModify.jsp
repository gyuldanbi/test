<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 포스트</title>
<link rel="stylesheet" type="text/css" href="css/reset.css" />
</head>

<style>
#box {
	width: 960px;
	margin: 0 auto;
}

header {
	width: 100%;
	height: 50px;
	background-color: white;
	border-bottom: 1px solid #b0b0b0;
	position: fixed;
	border-bottom: 1px solid #b0b0b0;
	z-index: 2;
}

header img {
	margin-top: 10px;
	float: left;
}

input[type="submit"], input[type="button"] {
	width: 50px;
	height: 30px;
	margin-top: 10px;
	margin-left: 10px;
	border-style: none;
	font-weight: 300;
	float: right;
}

input[type="submit"] {
	color: #613E20;
	background-color: #F0B889;
}

section {
	width: 960px;
	height: auto;
	margin: 0 auto;
	padding-top: 70px;
	box-sizing: border-box;
	position: relative;
	box-sizing: border-box;
	z-index: 1;
}

#adjuster {
	width: 50px;
	height: 300px;
	border: 1px solid #b0b0b0;
	position: fixed;
}

select {
	width: 15%;
	height: 40px;
	border-style: none;
	float: left;
}

input[type="text"] {
	border-style: none;
	margin-left: 5%;
	width: 80%;
	height: 40px;
	box-sizing: border-box;
	font-size: 16pt;
	font-weight: 400;
}

textarea {
	border-style: none;
	border-top: 1px solid #b0b0b0;
	padding: 8px;
	color: #979797;
	width: 100%;
	height: 800px;
	margin-top: 10px;
	box-sizing: border-box;
	resize: none;
	font-size: 12pt;
	font-weight: 300;
	font-size: 12pt;
}
</style>

<script type="text/javascript">
	function post() {
		var contents = document.getElementsByClassName("contents");

		for (var i = 0; i < contents.length; i++) {
			if (contents[i].value === '') {
				contents[i].focus();
				alert('빈칸을 채워주세요');
				return false;
			}
		}
		return true;
	}
</script>

<body>
	<jsp:useBean id="post" scope="request" class="post.PostDTO"
		type="post.PostDTO" />
	<form method="post" action="post.do?command=modifier&postNum=<%= post.getPostNum() %>"
		onsubmit="return post()">
		<input type="hidden" name="id"
			value="<%=session.getAttribute("id")%>">
		<header>
			<div id="box">
				<a href="index.jsp"><img src="http://placehold.it/30x30"></a>
				<input type="submit" value="수정"> <input type="button"
					value="취소" onclick="history.back()">
			</div>
		</header>

		<section>
			<select name="board" size="1">
				<option value="1">게시판1</option>
				<option value="2">게시판2</option>
			</select> <input type="text" placeholder="제목" name="title" class="contents"
				value="<%= post.getTitle() %>"><br>
			<textarea placeholder="내용" name="content" class="contents"><%= post.getContent() %></textarea>
		</section>
	</form>
</body>
</html>