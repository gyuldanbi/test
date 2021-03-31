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
<link rel="stylesheet" type="text/css" href="css/Books.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/Books.js"></script>

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