<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="css/reset.css">
</head>

<style>
#login {
	width: 960px;
	padding-top: 30px;
	padding-left: 50px;
	padding-right: 50px;
	padding-bottom: 50px;
	margin: 0 auto;
	border: 1px solid #BEBEBE;
	box-sizing: border-box;
}

#login h2 {
	background-color: #F0B889;
	padding: 5px 0;
	font-size: 16pt;
	font-weight: 500;
}

#login table {
	width: 350px;
	height: auto;
	margin: 0 auto;
	box-sizing: border-box;
}

#login th {
	width: 80px;
	height: 30px;
	font-size: 12pt;
	font-weight: 400;
	text-align: center;
}

#login td {
	padding: 3px;
	box-sizing: border-box;
}

#login input[type="submit"] {
	width: 80px;
	height: 60px;
}

#login>img {
	float: left;
	margin-top: 12px;
}

#login a {
	font-size: 11pt;
	font-weight: 300;
	color: gray;
}

#login a:link {
	text-decoration: none;
}

#login_box {
	height: 200px; margin : 80px 0px;
	box-sizing: border-box;
	margin: 80px 0px;
}

#idSearch_btn {
	width: fit-content;
	margin: 0 auto;
}

#idSearch_btn div {
	background-color: #e6e6e6;
	border-radius: 10px;
	height: 80px;
	margin: 5px;
	float: left;
	width: 260px;
}

#idSearch_btn img {
	margin-left: 10px;
	float: left;
}

#idSearch_btn h3 {
	font-size: 14pt;
	font-weight: 400;
	text-align: center;
}

#idSearch_btn h4 {
	font-size: 11pt;
	font-weight: 300;
	text-align: center;
    margin-top: 15px;
}
</style>

<script>
	function login() {
		var input = document.querySelectorAll('form input');

		if (input[0].value == '') {
			alert("아이디를 입력해 주세요");
			input[0].focus();
			return false;
		}
		if (input[2].value == '') {
			alert("비밀번호를 입력해 주세요");
			input[2].focus();
			return false;
		}
		return true;
	}
</script>

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