<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String keyword = (String)request.getAttribute("keyword");
	int nowPage = (Integer)request.getAttribute("nowPage");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 검색결과</title>
<link rel="stylesheet" type="text/css" href="css/index.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<style>
#books {
	width: 960px;

}
.book {
	width: 920px;
	height: 180px;
	border: 1px solid #F0B889;
	border-radius: 15px;
	padding: 8px;
	margin: 10px 20px;
	box-sizing: border-box;
}

.book img {
	width: 90px;
	float: left;
	margin: 15px;
}

.book h3 {
	font-size: 14pt;
	font-weight: 400;
	margin-top: 10px;
	float: left;
}

.book h4 {
	font-size: 12pt;
	font-weight: 300;
	margin-top: 13px;
}
.book h5 {
	font-size: 11pt;
	font-weight: 300;
	color: #404040;
}
.book font {
	font-size: 14pt;
	font-weight: 400;
}
#count p {
	font-size: 10pt;
	font-weight: 300;
	margin-top: 4px;
}
</style>

<script>
$(document).ready(function() {
	var keyword = '${keyword}';
	var nowPage = '${nowPage}';
	
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book?target=title",
		data : {
			query : keyword,
			page: nowPage
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		$("#count").append("총 " + msg.meta.total_count + " 건의 검색 결과가 있습니다.");	
		for(var i=0; i<10; i++) {
			if(msg.documents[i].thumbnail == "") {
				$("#book").append("<div class='book'><a href='BookInfo.book?command=info&isbn=" 
						+ msg.documents[i].isbn +"'><img src='img/book_bin.png'/></a><h3>" 
						+ msg.documents[i].title + "</h3><h4>&nbsp | &nbsp" 
						+ msg.documents[i].authors[0] + "</h4><h5>" 
						+ msg.documents[i].publisher + "</h5><br><br><font>"
						+ msg.documents[i].price + "원</font></div>");
			} else {
				$("#book").append("<div class='book'><a href='BookInfo.book?command=info&isbn=" 
						+ msg.documents[i].isbn +"'><img src='" 
						+ msg.documents[i].thumbnail + "'/></a><h3>" 
						+ msg.documents[i].title + "</h3><h4>&nbsp | &nbsp" 
						+ msg.documents[i].authors[0] + "</h4><h5>" 
						+ msg.documents[i].publisher + "</h5><br><br><font>"
						+ msg.documents[i].price + "원</font></div>");
			}
		}
	});
});
</script>

<body>
	<div>
		<jsp:include page="header.jsp" />
	</div>

	<div id="books" class="box">
		<section id="">
			<div class="book_title">
				<h2>검색 결과&nbsp;:&nbsp;<%= keyword %></h2>
			</div>
			<p id="count"></p>
			<div id="book"></div>
		</section>
	</div>


	<div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>