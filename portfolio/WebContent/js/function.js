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
function postBtn(num, post) {
	if (num == 1) {
		location.href = "post.do?command=story";
	} else if (num == 2) {
		location.href = "post.do?command=modify&postNum=" + post;
	} else if (num == 3) {
		location.href = "post.do?command=delete&postNum=" + post;
	}
}

function post() {
	var contents = document.getElementsByClassName("contents");

	for (var i = 0; i < contents.length; i++) {
		if (contents[i].value === '') {
			contents[i].focus();
			alert('빈칸을 채워주세요');
			return false;
		}
	}
	return true;
}

function chk() {
	var qnty = document.getElementsByName("quantity");
	
	if(qnty[0].value == '') {
		alert("수량을 선택하세요");
		return false;
	}
	return true;
}

function btn(num) {
	if (num == 1) {
		location.href = "login.jsp";
	} else if (num == 2) {
		location.href = "signin.jsp";
	} else if (num == 3) {
		location.href = "logout.jsp";
	}
}