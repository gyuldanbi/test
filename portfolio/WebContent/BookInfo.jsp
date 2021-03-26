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
<link rel="stylesheet" type="text/css" href="css/reset.css">
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(document).ready(function() {
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book",
		data : {
			query : <%= isbn %>,
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
			query : <%= isbn %>,
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

function chk() {
	var qnty = document.getElementsByName("quantity");
	
	if(qnty[0].value == '') {
		alert("수량을 선택하세요");
		return false;
	}
	return true;
}

function shop(form) {
	form.action='shoppingList.jsp'
	form.submit();
	
	return true;
}
</script>

<style>
#book {
	width: 560px;
	height: 320px;
	margin: 0 auto;
	padding-top: 20px;
	box-sizing: border-box;
}

#book_img {
	float: left;
	margin-top: 30px;
	margin-right: 20px;
}

#book table {
	float: left;
	margin-left: 20px;
	text-align: left;
}

#book th {
	width: 80px;
	height: 35px;
	font-weight: 400;
}

#book td {
	width: 320px;
	font-weight: 300;
}

#book input[type="number"] {
	width: 80px;
}

#book input[type="submit"], #book input[type="button"] {
	width: 80px;
	height: 35px;
	border: none;
}

#info {
	width: 960px;
	margin: 0 auto;
}

#info h3 {
	border-bottom: 2px solid #603D20;
	font-size: 14pt;
	font-weight: 400;
}

#info p {
	padding: 10px;
	box-sizing: border-box;
	font-size: 11pt;
	font-weight: 300;
}

section {
	clear: left;
}
</style>

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