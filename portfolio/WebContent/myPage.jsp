<%@page import="order.OrderDTO"%>
<%@page import="order.OrderDAO"%>
<%@page import="post.PostDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="post.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String id = (String) session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이 페이지</title>
<link rel="stylesheet" type="text/css" href="css/myPage.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<div id="myPage" class="box">
		<%
			OrderDAO order = new OrderDAO();
			ArrayList<OrderDTO> orderlist = order.select10(id);

			PostDAO post = new PostDAO();
			ArrayList<PostDTO> postlist = (ArrayList<PostDTO>) post.select10(id);
		%>
		<section>
			<h2>마이페이지</h2>
			<article>
				<div id="profile" class="myInfo">
					<div class="title">
						<h3>내 정보</h3>
					</div>
					<table border="1">
						<tr>
							<th>
								<img src="img/user.png"><br>
								<%=session.getAttribute("id")%>님
							</th>
						</tr>
						<tr>
							<td>회원정보 수정</td>
						</tr>
						<tr>
							<td>탈퇴하기</td>
						</tr>
					</table>
				</div>
				<div class="myInfo">
					<div class="title">
						<div class="title">
							<h3>주문 내역</h3>
							<%
								if (orderlist.size() == 10) {
							%>
							<h4>
								<a href="myOrder.jsp">더보기</a>
							</h4>
							<%
								}
							%>
						</div>
					</div>
					<table border="1">
						<tr>
							<th width="120px">주문 일자</th>
							<th>No</th>
							<th width="120px">결제 금액</th>
						</tr>

						<%
							if (orderlist.size() < 1) {
						%>
						<tr>
							<td colspan="3" align="center" height="80px">주문 내역이 없습니다</td>
						</tr>
						<%
							} else {
								for (OrderDTO dto : orderlist) {
						%>
						<tr>
							<td><%=dto.getDate()%></td>
							<td><a
								href="orderDetail.jsp?orderNum=<%=dto.getOrderNum()%>"><%=dto.getOrderNum()%></a></td>
							<td align="right"><%=dto.getPrice()%>원</td>
						</tr>
						<%
							}
							}
						%>
					</table>
				</div>
			</article>
			<div id="myOrder">
				<div class="title">
					<h3>내가 쓴 글</h3>
					<%
						if (orderlist.size() == 10) {
					%>
					<h4>
						<a href="">더보기</a>
					</h4>
					<%
						}
					%>
				</div>
				<table border="1">
					<tr>
						<th width="40px">No</th>
						<th>제목</th>
						<th width="120px">작성일</th>
					</tr>
					<%
						if (postlist.size() < 1) {
					%>
					<tr>
						<td colspan="3" align="center" height="80px">작성한 포스트가 없습니다</td>
					</tr>

					<%
						} else {
							for (PostDTO dto : postlist) {
					%>
					<tr>
						<td align="center"><%=dto.getPostNum()%></td>
						<td><a
							href="post.do?command=post&postNum=<%=dto.getPostNum()%>"><%=dto.getTitle()%></a></td>
						<td align="right"><%=dto.getDate()%></td>
					</tr>
					<%
						}
						}
					%>
				</table>
			</div>
		</section>
	</div>

	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>