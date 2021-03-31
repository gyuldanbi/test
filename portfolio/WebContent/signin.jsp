<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8");%>

<html>	<!--  -->
<head>	<!-- 문서의 정보 -->
	<meta charset="utf-8">	<!-- 한글 인코딩 -->
	<title> 회원가입 </title>
	<link rel="stylesheet" type="text/css" href="css/signin.css">
	
</head>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="js/signin.js"></script>


<body>
<form action="signinDBconnect.jsp" method="post" onsubmit="return sign()" id="signInFrm">
	<div>
		<jsp:include page="header.jsp"></jsp:include>
	</div>
	<br>
	<section id="signin">
		<img src="img/next.png" width="20px" height="20px">
		<h2>회원가입</h2>
		<br>
		<ul>
			<li><h3>필수항목</h3></li>
		</ul>

		<div class="line">
			<table>
				<tr>
					<th width="180">아이디</th>
					<td>
						<input type="text" id="id" name="id" size="22" maxlength="20" class="ness" onkeydown="onlyAlphabet(this)">
						<input type="button" id="duple" name="duple" value="중복확인" class="little" onclick="openChk();">
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td>
						<input type="password" id="pass" name="password" size="22" maxlength="20" class="ness" onkeydown="onlyAlphabet(this)"><br>
						<font>영문자(대소문자구분), 숫자 및 특수문자 6~16자</font>
					</td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td>
						<input type="password" id="passChk" name="password" size="22" maxlength="20" onkeydown="onlyAlphabet(this)"><br>
						<p id="chkNotice"></p>
					</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name" size="22" maxlength="8"  class="ness"></td>
				</tr>
				<tr>
					<th>성별</th>
					<td>
						<input type="radio" name="sex" value="m">남자
						<input type="radio" name="sex" value="f">여자
						<input type="radio" name="sex" value="unknown" checked="checked">선택 안함
					</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<input type="date" name="birth" class="ness">
					</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>
						<select name="numhead" size="1" class="ness">
								<option value="010">010</option>
								<option value="011">011</option>
								<option value="02">02</option>
								<option value="031">031</option>
						</select>
						&nbsp;&nbsp;―&nbsp;&nbsp;
						<input type="text" name="nummiddle" size="1" maxlength="4" class="ness">
						&nbsp;&nbsp;―&nbsp;&nbsp;
						<input type="text" name="numlast" size="1" maxlength="4" class="ness">
					</td>
				</tr>
			</table>
		</div>

		<ul>
			<li><h3>선택항목</h3></li>
		</ul>
		<div id="op" class="line">
			<table>
				<tr>
					<th width="180">이메일</th>
					<td>
						<input type="text" name="email" size="8" maxlength="20" class="opt">
						@
						<input type="text" name="domain" size="8" maxlength="20" class="opt">
						<select name="domain" size="1" onchange="selc()">
							<option value="0">직접입력</option>
							<option value="naver.com">naver.com</option>
							<option value="daum.net">daum.net</option>
							<option value="kakao.com">kakao.com</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" name = "postcode" id="postcode" placeholder="우편번호">
						<input type="button" value="우편번호 찾기" onclick="daumPostcode()">
						<input type="text" name="address" id="address" placeholder="주소" class="opt" size="46"><br>
						<input type="text" name="detailAddress" id="detailAddress" placeholder="상세주소">
						<input type="text" id="extraAddress" placeholder="참고항목">
					</td>
				</tr>
				<tr>
					<th>광고 수신여부</th>
					<td>
						<input type="checkbox" name="send_mail" value="y" checked="checked">이메일
						<input type="checkbox" name="send_text" value="y" checked="checked">문자
					</td>
				</tr>
			</table>
		</div>

		<div align="center">
			<input type="submit" value="가입">
			<input type="reset" value="초기화">
		</div>
	</section>

	<div>
		<jsp:include page="footer.jsp"></jsp:include>
	</div>

</form>
</body>
</html>