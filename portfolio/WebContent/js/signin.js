$(function() {
	$('#pass').keyup(function() {
		$('#chkNotice').html('');
	});
	$('#passChk').keyup(function() {
		if ($('#pass').val() != $('#passChk').val()) {
			$('#chkNotice').html('비밀번호가 일치하지 않습니다.');
		} else {
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
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
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
	ele.value = ele.value.replace(/[^\\!-z]/gi, "");
}