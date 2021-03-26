<%@page import="post.PostDTO"%>
<%@page import="java.util.List"%>
<%@page import="post.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<!--  -->
<head>
<!-- 문서의 정보 -->
<meta charset="utf-8">
<!-- 한글 인코딩 -->
<title>index</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document).ready(function() {	
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book?target=title",
		data : {
			query : "바다",
			size : 10,
			target: "title"
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		for(var i=0; i<10; i++) {
			var isbn = msg.documents[i].isbn;
			var title = msg.documents[i].title;
			if(title.length>12) {
				title = title.substring(0, 11) + "…";
			}
			
			if(msg.documents[i].thumbnail == "") {
				$("#recommendBook").append("<div class='bookRec'><a href='BookInfo.book?command=info&isbn="
					+ isbn + "'><img src='img/book_bin.png'/></a><h3>"
					+ msg.documents[i].title + "</h3><h4>"
					+ msg.documents[i].authors[0] + "</h4></div>");
			} else {
				$("#recommendBook").append("<div class='bookRec'><a href='BookInfo.book?command=info&isbn="
					+ isbn + "'><img src='" + msg.documents[i].thumbnail + "'/></a><h3>"
					+ title + "</h3><h4>"
					+ msg.documents[i].authors[0] + "</h4></div>");
			}
		}
	});
});
</script>

<body>
	<form>
		<div>
			<jsp:include page="header.jsp"></jsp:include>
		</div>

		<div id="home" class="box">
			<section>
				<article id="recommendPost">
					<div class="book_title">
						<h2>오늘의 포스트</h2>
						<h5 onclick="location.href='store.jsp'">더보기</h5>
					</div>
					<%
						PostDAO act = new PostDAO();

						List<PostDTO> list = act.selAll(0);

						for (int i = 0; i < 5; i++) {
							PostDTO post = list.get(i);

							String content = post.getContent();
							if (content.length() > 40) {
								content = content.substring(0, 39) + "…";
							}
					%>
					<div class="postRec"
						onclick="location.href='post.do?command=post&postNum=<%=post.getPostNum()%>'">
						<h3>
							<%=post.getTitle()%>
						</h3>
						<h4><%=content%></h4>
					</div>
					<%
						}
					%>
				</article>
				<article id="recommendBook">
					<div class="book_title">
						<h2>오늘의 책</h2>
						<h5 onclick="location.href='post.do?command=story'">더보기</h5>
					</div>
				</article>
			</section>
			<section></section>
		</div>

		<div>
			<jsp:include page="footer.jsp"></jsp:include>
		</div>

	</form>
</body>
</html>