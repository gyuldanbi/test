<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
</head>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	
<script>
function go(num) {
	if(num==1) {
		location.href = "myOrder.jsp";
	} else if(num==2) {
		location.href = "index.jsp";
	}
}
</script>

<style>
#orderChk {
	margin-top: 20px;
	width: 960px;
	padding: 40px;
	background-color: #F0B889;
	box-sizing: border-box;
	border-radius: 15px;
	text-align: center;
}
#orderChk button {
	width: 120px;
	height: 40px;
	font-size: 12pt;
	font-weight: 400;
	border: none;
	background-color: #ffa36c;
}
#orderChk font {
	font-size: 14pt;
	font-weight: 300;
}
</style>

<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>

	<div class="container" id="orderChk">
		<p>
			<img src="img/order.png"><br><br>
			<font>주문이 완료되었습니다</font><br><br>
			<button onclick="go(1);">주문확인</button>
			<button onclick="go(2);">메인페이지로</button>
		</p>
	</div>

	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>
</body>
</html>