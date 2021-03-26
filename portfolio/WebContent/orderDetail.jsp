<%@page import="order.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<jsp:useBean id="act" class="order.OrderDAO" scope="page" />
<%
	int orderNum = Integer.parseInt(request.getParameter("orderNum"));
	
	OrderDTO dto = act.selectOne(orderNum);
	String isbn = dto.getIsbn();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문하기</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

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
		$("#book_img").append("<img width='80px' src='" + msg.documents[0].thumbnail + "'/>");
		$("#book_title").append(msg.documents[0].title);
	});
});
</script>

<style>
#orderDetail th {
	background-color: #F0B889;
	padding: 4px;
	box-sizing: border-box;
	font-size: 12pt;
	font-weight: 400;
}
#orderDetail td {
	padding: 2px;
	box-sizing: border-box;
	font-size: 11pt;
	font-weight: 300;
	text-align: center;
}
#orderDetail table {
	width: 800px;
	margin: 0 auto;
}
#orderDetail h3 {
	font-size: 16pt;
	font-weight: 400;
	margin-left: 20px;
	margin-bottom: 10px;
}
</style>

<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<div id="orderDetail" class="box">
		<h3>상세내역</h3>
		<table>
			<tr>
				<th width="120px;">주문일자</th>
				<th width="120px;">주문번호</th>
				<th colspan="2">제목</th>
				<th width="80px;">수량</th>
				<th width="80px;">금액</th>
			</tr>
			<tr>
				<td><%= dto.getDate() %></td>
				<td><%= orderNum %></td>
				<td id="book_img"></td>
				<td id="book_title"></td>
				<td><%= dto.getCnt() %></td>
				<td><%= dto.getPrice() %></td>
			</tr>
		</table>
	</div>

	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>