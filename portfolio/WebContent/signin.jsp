<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%	request.setCharacterEncoding("utf-8");%>

<html>	<!--  -->
<head>	<!-- 문서의 정보 -->
	<meta charset="utf-8">	<!-- 한글 인코딩 -->
	<title> 회원가입 </title>
	<link rel="stylesheet" type="text/css" href="css/reset.css">
	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>

<style>
#signin img {
	float: left;
	margin-top: 12px;
}

#signin h2 {
	background-color: #F0B889;
	padding: 5px 0;
	font-size: 16pt;
	font-weight: 500;
}

#signin h3 {
	padding-left: 22px;
	font-weight: 400;
	font-size: 12pt;
}

#signin table {
	font-size: 11pt;
	margin: 0 auto;
}

#signin th {
	width: 160px;
	font-size: 12pt;
	font-weight: 400;
}

#signin td {
	width: 400px;
	font-size: 11pt;
	font-weight: 300;
	padding: 5px;
}

#signin input[type="text"], #signin input[type="password"], #signin input[type="date"] {
	border-style: solid;
	border-top-width: 0px;
	border-left-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 1px;
	border-color: #8E8E8E;
	padding-top: 5px;
	padding-left: 5px;
	padding-right: 5px;
	margin: 5px 0px;
}

#signin input[type="submit"], #signin input[type="reset"] {
	font-weight: 500;
	font-size: 12pt;
	width: 90px;
	height: 40px;
	border-style: solid;
	border-radius: 5px;
	box-sizing: border-box;
}

#signin input[type="submit"] {
	border: 1px solid #F0B889;
	background-color: #F0B889;
	color: #613E20;
}

#signin input[type="reset"] {
	border: 1px solid #BEBEBE;
	background-color: #BEBEBE;
	color: white;
}

#signin input[type="button"] {
	width: 100px; border-style : none;
	padding-top: 5px;
	padding-bottom: 5px;
	padding-left: 10px;
	padding-right: 10px;
	border-style: none;
}

#signin select {
	border-style: solid;
	border-top-width: 0px;
	border-left-width: 0px;
	border-right-width: 0px;
	border-bottom-width: 1px;
	border-color: #8E8E8E;
	padding: 5px;
	box-sizing: border-box;
}

.line {
	padding: 15px 0;
	margin: 5px 0 15px 0;
	border-top: 2px solid #BEBEBE;
	border-bottom: 2px solid #BEBEBE;
	box-sizing: border-box;
}

#signin {
	width: 960px;
	padding-top: 30px;
	padding-left: 50px;
	padding-right: 50px;
	padding-bottom: 50px;
	margin: 0 auto;
	border: 1px solid #BEBEBE;
	box-sizing: border-box;
}

</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(function(){
		$('#pass').keyup(function(){
			$('#chkNotice').html('');
		});
		$('#passChk').keyup(function(){
			if($('#pass').val() != $('#passChk').val()){
				$('#chkNotice').html('비밀번호가 일치하지 않습니다.');
			} else{
				$('#chkNotice').html('비밀번호가 일치합니다.');
			}
		});
	});
	
	function sign() {
		var ness = document.getElementsByClassName('ness');
		var opt = document.getElementsByClassName('opt');
		var pass = document.querySelectorAll('input[type="password"]');
		var radio = document.getElementsByName('sex');
		var chbox = document.querySelectorAll('input[type="checkbox"]');

		for (var i = 0; i < ness.length; i++) {
			if (ness[i].value == '') {
				ness[i].focus();
				return false;
			}
		}

		if (!((pass[0].value == pass[1].value) && (pass[0].value.length >= 10) && (pass[0].value.length <= 20))) {
			pass[1].focus();
			return false;
		}
		return true;
	}
	
	function selc() {
		var dom = document.getElementsByName('domain');
		if (dom[1].value == '0') {
			dom[0].value = '';
			dom[0].focus();
		} else {
			dom[0].value = dom[1].value;
		}
	}
	
	function daumPostcode() {
		new daum.Postcode({
			oncomplete : function(data) {
				var addr = '';
				var extraAddr = '';

				if (data.userSelectedType === 'R') {
					addr = data.roadAddress;
				} else {
					addr = data.jibunAddress;
				}

				if (data.userSelectedType === 'R') {
					if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
						extraAddr += data.bname;
					}

					if (data.buildingName !== '' && data.apartment === 'Y') {
						extraAddr += (extraAddr !== '' ? ', '
								+ data.buildingName : data.buildingName);
					}

					if (extraAddr !== '') {
						extraAddr = ' (' + extraAddr + ')';
					}
					document.getElementById("extraAddress").value = extraAddr;

				} else {
					document.getElementById("extraAddress").value = '';
				}

				document.getElementById('postcode').value = data.zonecode;
				document.getElementById("address").value = addr;

				document.getElementById("detailAddress").focus();
			}
		}).open();
	}

	function openChk() {
		var id = document.getElementById("id");

		if (id.value.length > 4) {
			var url = "idChk.jsp?id=" + id.value;
			window.open(url, "chkFrom",
					"width=400, height=150, resizable=no, scrollbars=no");
		} else {
			alert("아이디는 6자 이상 사용 가능합니다.");
		}
	}
	
	function onlyAlphabet(ele) {
		ele.value = ele.value.replace(/[^\\!-z]/gi,"");
	}
</script>


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