<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String isbn = request.getParameter("isbn");
	int quantity = Integer.parseInt(request.getParameter("quantity"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
$(function() {	
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
		var price = "";
		if(msg.documents[0].sale_price>0){
			price = msg.documents[0].sale_price;
		} else {
			price = msg.documents[0].price;
		}
		$("#order").append("<td><img src='" + msg.documents[0].thumbnail + "'></td>");
		$("#order").append("<td><a href='BookInfo.book?command=inf&isbn=<%=isbn%>'>" + msg.documents[0].title + "</a></td>");
		$("#order").append("<td>" + price + "</td>");
		$("#order").append("<td>" + <%= quantity %> + "</td>");
		$("#order").append("<td>" + <%= quantity %> * price + "</td>");
		$("#hidden").append("<input type='hidden' value='<%=isbn%>' name='isbn'>");
		$("#hidden").append("<input type='hidden' value='<%=quantity%>' name='cnt'>");
		$("#hidden").append("<input type='hidden' value='" + price + "' name='price'>");
	});
});
</script>

<style>
#basket {
	width: 960px;
}

#basket h3 {
	font-size: 16pt;
	font-weight: 400;
	margin-left: 20px;
	margin-bottom: 10px;
}

#basket table {
	width: 800px;
	margin: 0 auto;
}

#basket th {
	background-color: #F0B889;
	padding: 4px;
	box-sizing: border-box;
	font-size: 12pt;
	font-weight: 400;
}

#basket td {
	padding: 2px;
	box-sizing: border-box;
	font-size: 11pt;
	font-weight: 300;
	text-align: center;
}

#basket img {
	width: 60px;
}

#basket a {
	color: black;
	text-decoration: none;
}

#order_btn input[type="button"], #basket input[type="submit"] {
	width: 160px;
	height: 35px;
	border: none;
}

#order_btn {
	text-align: center;
	margin-top: 10px;
}
</style>

<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<div class="container">
		<form action="order.jsp" method="post">
			<h3>장바구니</h3>
			<section id="basket">
				<table>
					<tr>
						<th colspan="2" width="400px;">도서명</th>
						<th width="60px;">가격</th>
						<th width="60px;">수량</th>
						<th width="60px;">금액</th>
					</tr>
					<tr id="order">
					</tr>
				</table>
				<div id="order_btn">
					<input type="button" value="취소">
					<input type="submit" value="구매">
				</div>
			</section>
			<p id="hidden"></p>
		</form>
	</div>

	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>