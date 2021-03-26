<%@page import="order.OrderDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="order" class="order.OrderDTO" scope="page" />
<%	
	
	if(session.getAttribute("id")==null){
	%>
		<script>alert("로그인 후 이용할 수 있습니다");
		location.href="login.jsp";</script>
	<%
	} else {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");

		String date = format.format(System.currentTimeMillis());
		String userId = (String)session.getAttribute("id");
		String isbn = request.getParameter("isbn");
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		int price = Integer.parseInt(request.getParameter("price")) * cnt;
		
		order.setDate(date);
		order.setUserId(userId);
		order.setIsbn(isbn);
		order.setCnt(cnt);
		order.setPrice(price);
		
		OrderDAO act = new OrderDAO();
		act.input(order);
	%>
		<jsp:forward page="orderChk.jsp"></jsp:forward>
	<%
	}
%>
