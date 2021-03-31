<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/header.css">
</head>

<script type="text/javascript" src="js/function.js"></script>
<script>
$(function() {
	$('#search_btn').click(
			function() {
				var keyword = $('#search').val();
				
				if (keyword.length > 0) {
					location.href = "search.book?command=top&keyword="
							+ encodeURI(encodeURIComponent(keyword))
							+ "&page=1";
				} else {
					alert("검색어를 입력해주세요");
				}
			})
});
</script>

<body>
	<div class="box">
		<header>
			<a href="index.jsp"><img src="img/logo.png"></a>

			<div id="search_box">
				<input type="text" id="search" placeholder="도서/저자/출판사 명으로 검색">
				<img src="img/search.png" id="search_btn">
			</div>

			<div class="header_btn">
			<%
				if(session.getAttribute("id")==null) {
			%>
				<button id="log_btn" onclick="btn(1); return false;">로그인</button>
				<button id="sign_btn" onclick="btn(2); return false;">회원가입</button>
			<%
				} else {
			%>
				<font><a href="myPage.jsp"><%= session.getAttribute("id")%></a></font>
				<font>님</font>
				<button id="logout" onclick="btn(3); return false;">로그아웃</button>
			<%
				}
			%>
			</div>
		</header>
	</div>
	
	<nav>
		<div id="nav_title" class="box">
			<ul>
				<li><a href="index.jsp"><img src="img/home.png">홈</a></li>
				<li><a href="store.jsp"><img src="img/store.png">책방</a></li>
				<li><a href="post.do?command=story"><img src="img/story.png">이야기</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>