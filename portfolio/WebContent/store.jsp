<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책방</title>
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
			query : "봄",
			sort : "latest",
			size : 6,
			target: "title"
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		for(var i=0; i<6; i++) {
			var isbn = msg.documents[i].isbn;
			
			if(msg.documents[i].thumbnail == "") {
				$("#subject1").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" 
						+ isbn + "'><img src='img/book_bin.png'/></a></article>");
			} else {
				$("#subject1").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" 
						+ isbn + "'><img src='" + msg.documents[i].thumbnail + "'/></a></article>");
			}
		}
	});
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book?target=title",
		data : {
			query : "주식",
			sort : "latest",
			size : 6,
			target: "title"
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		for(var i=0; i<6; i++) {
			var isbn = msg.documents[i].isbn;
			
			if(msg.documents[i].thumbnail == "") {
				$("#subject2").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" + isbn + "'><img src='img/book_bin.png'/></a></article>");
			} else {
				$("#subject2").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" + isbn + "'><img src='" + msg.documents[i].thumbnail + "'/></a></article>");
			}
		}
	});
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book?target=title",
		data : {
			query : "인테리어",
			sort : "latest",
			size : 6,
			target: "title"
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		for(var i=0; i<6; i++) {
			var isbn = msg.documents[i].isbn;
			if(msg.documents[i].thumbnail == "") {
				$("#subject3").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" + isbn + "'><img src='img/book_bin.png'/></a></article>");
			} else {
				$("#subject3").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" + isbn + "'><img src='" + msg.documents[i].thumbnail + "'/></a></article>");
			}
		}
	});
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book?target=title",
		data : {
			query : "빅데이터",
			sort : "latest",
			size : 6,
			target: "title"
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		for(var i=0; i<6; i++) {
			var isbn = msg.documents[i].isbn;
			if(msg.documents[i].thumbnail == "") {
				$("#subject4").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" + isbn + "'><img src='img/book_bin.png'/></a></article>");
			} else {
				$("#subject4").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" + isbn + "'><img src='" + msg.documents[i].thumbnail + "'/></a></article>");
			}
		}
	});
});
</script>

<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<div class="box">
		<section>
			<div class="book_title">
				<h2>NEW</h2>
				<h5>더보기</h5>
			</div>
			<div id="subject1" class="book_contents">
			</div>
		</section>
		<section>
			<div class="book_title">
				<h2>베스트셀러</h2>
				<h5>더보기</h5>
			</div>
			<div id="subject2" class="book_contents">
			</div>
		</section>
		<section>
			<div class="book_title">
				<h2>스테디셀러</h2>
				<h5>더보기</h5>
			</div>
			<div id="subject3" class="book_contents">
			</div>
		</section>
		<section>
			<div class="book_title">
				<h2>실시간 인기도서</h2>
				<h5>더보기</h5>
			</div>
			<div id="subject4" class="book_contents">
			</div>
		</section>
	</div>

	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>