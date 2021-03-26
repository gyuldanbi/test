<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8");  %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/reset.css">
</head>

<style>
header {
	width: 1080px;
	height: 60px;
	margin-top: 30px;
	display: inline-block;
}

header img {
	float: left;
}

#search_box {
	width: 640px;
	height: 48px;
	border: 4px solid #b0b0b0;
	margin-left: 24px;
	box-sizing: border-box;
	float: left;
}

#search {
	width: 580px;
	height: 36px;
	border: none;
	float: left;
}

#search_box img {
	float: right;
	margin-top: 4px;
	margin-right: 4px;
}

#btn {
	float: right;
}

#btn a {
	font-size: 12pt;
	font-weight: 400;
	color: #b0b0b0;
}

#btn a:link {
	text-decoration: none;
}

li {
	display: inline-block;
}

nav {
	width: 100%;
	height: auto;
	margin-top: 10px;
	clear: left;
	font-size: 16pt;
	border-bottom: 3px solid #F0B889;
}

nav img {
	float: left;
	margin-right: 5px;
}

nav li {
	display: inline-block;
	margin-right: 15px;
}

nav a:link {
	text-decoration: none;
	color: black;
}

nav a:visited {
	color: black;
}

#nav_title {
	padding: 10px;
	font-size: 16pt;
	font-weight: bold;
	box-sizing: border-box;
}

.box {
	width: 1080px;
	height: auto;
	margin: 0 auto;
	box-sizing: border-box;
}

.header_btn button {
	width: 72px;
	height: 32px;
	margin-left: 10px;
	margin-top: 10px;
}

.header_btn {
	float: right;
}
</style>

<script>
	$(function() {		
		$('#search_btn').click(function () {
			var keyword = $('#search').val();
			if(keyword.length>0) {
				location.href="search.book?command=top&keyword=" + encodeURI(encodeURIComponent(keyword)) + "&page=1";
			} else {
				alert("검색어를 입력해주세요");
			}
		})
	});
	
	function btn(num) {
		if (num==1) {
			location.href="login.jsp";
		} else if (num==2) {
			location.href="signin.jsp";
		} else if(num==3) {
			location.href="logout.jsp";
		}
	}
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
				<li><a href="store.jsp"><img src="img/shop.png">책방</a></li>
				<li><a href="post.do?command=story"><img src="img/post.png">이야기</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>