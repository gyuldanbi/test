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
<link rel="stylesheet" type="text/css" href="css/reset.css" />
</head>

<style>
#box {
	width: 960px;
	margin: 0 auto;
}

#postBox input[type="submit"], #postBox input[type="button"] {
	width: 50px;
	height: 30px;
	margin-top: 10px;
	margin-left: 10px;
	border-style: none;
	font-weight: 300;
}

#postBox input[type="submit"] {
	color: #613E20;
	background-color: #F0B889;
}

#postBox select {
	width: 15%;
	height: 40px;
	border-style: none;
	float: left;
}

#postBox input[type="text"] {
	border-style: none;
	margin-left: 5%;
	width: 80%;
	height: 40px;
	box-sizing: border-box;
	font-size: 16pt;
	font-weight: 400;
}

#postBox textarea {
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

#postBox {
	border: 1px solid #b0b0b0;
	padding: 10px;
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