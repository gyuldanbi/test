<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="css/login.css">
</head>

<script type="text/javascript" src="js/function.js"></script>

<body>
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<br>
	<section id="login">
		<img src="img/next.png" width="20px" height="20px">
		<h2>로그인</h2>

		<div id="login_box">
			<form method="post" action="loginDBconnect.jsp"
				onsubmit="return login()">
				<table>
					<tr>
						<th>ID</th>
						<td><input type="text" name="id"></td>
						<td rowspan="2"><input type="submit" value="로그인"></td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td><input type="password" name="password"></td>
					</tr>
				</table>
			</form>
			<br>
			<br>
			<br>
			<div id="idSearch_btn">
				<div onclick="">
					<img src="img/idfind.png" width="68px">
					<h4>아이디를 잊으셨나요?</h4>
					<h3>아이디 찾기</h3>
				</div>
				<div onclick="">
					<img src="img/lock.png" width="68px">
					<h4>비밀번호를 잊으셨나요?</h4>
					<h3>비밀번호 찾기</h3>
				</div>
				<div onclick="location.href='signin.jsp'">
					<img src="img/newUser.png" width="80px">
					<h4>아직 회원이 아니신가요?</h4>
					<h3>회원가입</h3>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>