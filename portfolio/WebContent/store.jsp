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
<script type="text/javascript" src="js/store.js"></script>

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