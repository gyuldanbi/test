<%@page import="order.OrderDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="css/index.css">
<title>주문내역</title>
</head>

<style>
#myOrder th {
	background-color: #F0B889;
	padding: 4px;
	box-sizing: border-box;
	font-size: 12pt;
	font-weight: 400;
}

#myOrder td {
	padding: 2px;
	box-sizing: border-box;
	font-size: 11pt;
	font-weight: 300;
	text-align: center;
}

#myOrder table {
	width: 800px;
	margin: 0 auto;
}
</style>

<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<div class="container">
		<jsp:useBean id="act" class="order.OrderDAO" scope="page" />
		<section id="myOrder">
			<div class="book_title">
				<h3>주문내역</h3>
			</div>
			<article>
				<table>
					<tr>
						<th width="180px;">주문일자</th>
						<th>주문번호</th>
						<th width="180px;">금액</th>
					</tr>
					<%
						ArrayList<OrderDTO> list = act.select(id);

						if (list.size() < 1) {
					%>
					<tr>
						<td colspan="3">주문 내역이 없습니다.</td>
					</tr>
					<%
						} else {
							for (OrderDTO dto : list) {
					%>
					<tr>
						<td><%=dto.getDate()%></td>
						<td><a href="orderDetail.jsp?orderNum=<%=dto.getOrderNum()%>"><%=dto.getOrderNum()%></a></td>
						<td><%=dto.getPrice()%>원</td>
					</tr>
					<%
						}
						}
					%>
				</table>
			</article>
		</section>
	</div>

	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>