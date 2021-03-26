<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	String keyword = request.getParameter("keyword");
// 	int nowPage = Integer.parseInt(request.getParameter("nowPage"));
// 	int startPage = Integer.parseInt(request.getParameter("startPage"));
// 	int endPage = Integer.parseInt(request.getParameter("endPage"));
// 	int maxPage = Integer.parseInt(request.getParameter("maxPage"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>책 검색결과</title>
</head>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>

<script>
$(document).ready(function() {
	var keyword = '${keyword}';
	var nowPage = '${nowPage}';
	
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book?target=title",
		data : {
			query : keyword,
			page: nowPage
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		for(var i=0; i<10; i++) {	
			$("#book").append("<p><h3>" + msg.documents[i].title + "</h3>");
			$("#book").append("<a href='BookInfo.book?command=info&isbn=" + msg.documents[i].isbn +"'><img src='" + msg.documents[i].thumbnail + "'/></a></p>");			
		}
		request.setAttribute("maxPage", msg.pageable_count);
	});
});
</script>

<body>
	<div>
		<jsp:include page="header.jsp" />
	</div>
	
	<section class="box">
		<div id="book">
		
		</div>
	</section>
	

<!-- 	<section id="pageList"> -->
<%-- 		<%if(nowPage<=1){ %> --%>
<!-- 		[이전]&nbsp; -->
<%-- 		<%}else{ %> --%>
<%-- 		<a href="search.book?command=top&keyword=<%= keyword %>&page=<%= nowPage-1 %>">[이전]</a>&nbsp; --%>
<%-- 		<%} %> --%>

<%-- 		<%for(int a=startPage;a<=endPage;a++){ --%>
<%-- 			if(a==nowPage){%>  --%>
<%-- 		[<%=a %>] --%>
<%-- 		<%}else{ %> --%>
<%-- 		<a href="boardList.bo?page=<%=a %>">[<%=a %>] --%>
<!-- 		</a>&nbsp; -->
<%-- 		<%} %> --%>
<%-- 		<%} %> --%>

<%-- 		<%if(nowPage>=maxPage){ %> --%>
<!-- 		[다음] -->
<%-- 		<%}else{ %> --%>
<%-- 		<a href="boardList.bo?page=<%=nowPage+1 %>">[다음]</a> --%>
<%-- 		<%} %> --%>
<!-- 	</section> -->

	<div>
		<jsp:include page="footer.jsp" />
	</div>
</body>
</html>