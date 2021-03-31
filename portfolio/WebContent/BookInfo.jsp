<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	
	String isbn = (String)request.getAttribute("isbn");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 상세보기</title>
<link rel="stylesheet" type="text/css" href="css/BookInfo.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript" src="js/function.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book",
		data : {
			query : <%= isbn%>,
			target: "isbn"
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		if(msg.documents[0].thumbnail == "") {
			$("#book_img").append("<img src='img/book_bin.png'/>");
		} else {
			$("#book_img").append("<img src='" + msg.documents[0].thumbnail + "'/>");
		}
		$("#book_title").append(msg.documents[0].title);
		$("#book_author").append(msg.documents[0].authors[0]);
		$("#book_publisher").append(msg.documents[0].publisher);
		$("#book_isbn").append(<%= isbn%>);
		$("#book_price").append(msg.documents[0].price);
		if(msg.documents[0].sale_price>0){
			$("#book_sale").append(msg.documents[0].sale_price);
		} else {
			$("#book_sale").append(msg.documents[0].price);
		}
		$("#book_info").append(msg.documents[0].contents + " … (생략)");
	});
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book",
		data : {
			query :  <%= isbn%>,
			target: "isbn"
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		if(msg.documents[0].thumbnail == "") {
			$("#author_info").append("<a><img src='img/book_bin.png'/></a>");
		} else {
			$("#author_info").append("<a><img src='" + msg.documents[0].thumbnail + "'/></a>");
		}
	});
});
</script>

<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<form action="orderPage.jsp" method="get" onsubmit="return chk();">
		<div class="container">
			<section id="book">
				<input type="hidden" name="isbn" value="<%=isbn%>">
				<div id="book_img"></div>
				<table>
					<tr>
						<th>제목</th>
						<td id="book_title"></td>
					</tr>
					<tr>
						<th>저자</th>
						<td id="book_author"></td>
					</tr>
					<tr>
						<th>출판사</th>
						<td id="book_publisher"></td>
					</tr>
					<tr>
						<th>ISBN</th>
						<td id="book_isbn"></td>
					</tr>
					<tr>
						<th>정가</th>
						<td id="book_price"></td>
					</tr>
					<tr>
						<th>판매가</th>
						<td id="book_sale"></td>
					</tr>
					<tr>
						<th>수량</th>
						<td><input type="number" name="quantity" min="1" value="1"></td>
					</tr>
					<tr>
						<th></th>
						<td><input type="button" value="장바구니"
							onclick="retrun shop(this.form);"> <input type="submit"
							value="구매하기"></td>
					<tr>
				</table>
			</section>
			<section id="info">
				<h3>상세정보</h3>
				<p id="book_info"></p>
				<br>
				<h3>작가의 다른 책</h3>
				<p id="author_info"></p>
			</section>
		</div>
	</form>

	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>