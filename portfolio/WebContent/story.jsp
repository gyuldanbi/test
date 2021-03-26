<%@page import="post.PostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="post.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	ArrayList<PostDTO> list = (ArrayList<PostDTO>) request.getAttribute("list");
	PageInfo pageInfo = (PageInfo) request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>포스트 보기</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
</head>

<script>
	function post() {
<%if (session.getAttribute("id") != null) {%>
	location.href = "newPost.jsp";
<%} else {%>
	alert("로그인 후 이용 가능합니다.");
		location.href = "login.jsp";
<%}%>
	}
</script>

<style>
#story {
	height: 638px;
}

#emptyArea {
	height: 638px;
}

.book_title button {
	border: none;
	background-color: rgba(255, 255, 255, 0);
	font-size: 14pt;
	font-weight: 400;
	float: right;
}

.post {
	width: 500px;
	height: 200px;
	margin: 10px 10px 5px 22px;
	padding: 20px;
	border: 2px solid #ecb390;
	border-radius: 15px;
	float: left;
	box-sizing: border-box;
}

.post a:link, .post a:visited {
	color: black;
	text-decoration: none;
}

.post h4 {
	font-size: 14pt;
	font-weight: 400;
}

.post p {
	height: 80px;
	font-size: 11pt;
	font-weight: 300;
	color: #6e7c7c;
	padding: 5px;
	clear: right;
}

.post h5 {
	font-size: 11pt;
	font-weight: 300;
	color: #aaaaaa;
	float: right;
}

#pageList {
	text-align: center;
	padding-top: 20px;
}

#pageList img {
	width: 20px;
}

#pageList a {
	font-size: 14pt;
	font-weight: 300;
	text-decoration: none;
	color: #aaaaaa;
}

#pageList font {
	font-size: 14pt;
	font-weight: 400;
}
</style>

<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<div class="box">
		<section id="story">
			<div class="book_title">
				<h2>POST LIST</h2>
				<button onclick="return post();">글쓰기</button>
			</div>
			<%
				if (list != null && listCount > 0) {
					for (PostDTO post : list) {
			%>
			<div class="post">
				<h4>
					<a href="post.do?command=post&postNum=<%=post.getPostNum()%>"><%=post.getTitle()%></a>
				</h4>
				<h5><%=post.getDate()%></h5>
				<p><a href="post.do?command=post&postNum=<%=post.getPostNum()%>"><%=post.getContent()%></a></p>
				<h5><%=post.getUserId()%></h5>
			</div>
			<%
				}
			%>
		</section>

		<section id="pageList">
			<%
				if (nowPage > 1) {
			%>
			<a href="post.do?command=story&page=<%=nowPage - 1%>"><img
				src="img/before.png"></a>&nbsp;
			<%
				} else {
			%>
			<img src="img/before.png">&nbsp;
			<%		
				}
			%>

			<%
				for (int a = startPage; a <= endPage; a++) {
						if (a == nowPage) {
			%>
			<font><%=a%></font>&nbsp;&nbsp;
			<%
				} else {
			%>
			<a href="post.do?command=story&page=<%=a%>"><%=a%></a>&nbsp;&nbsp;
			<%
				}
					}
			%>

			<%
				if (nowPage < maxPage) {
			%>
			<a href="post.do?command=story&page=<%=nowPage + 1%>"><img
				src="img/next.png"></a>
			<%
				} else {
			%>
			<img src="img/next.png">&nbsp;
			<%		
				}
			%>
		</section>
		<%
			} else {
		%>
		<section id="emptyArea">등록된 글이 없습니다.</section>
		<%
			}
		%>
	</div>

	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>