$(document).ready(function() {	
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book?target=title",
		data : {
			query : "봄",
			sort : "latest",
			size : 6,
			target: "title"
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		for(var i=0; i<6; i++) {
			var isbn = msg.documents[i].isbn;
			
			if(msg.documents[i].thumbnail == "") {
				$("#subject1").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" 
						+ isbn + "'><img src='img/book_bin.png'/></a></article>");
			} else {
				$("#subject1").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" 
						+ isbn + "'><img src='" + msg.documents[i].thumbnail + "'/></a></article>");
			}
		}
	});
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book?target=title",
		data : {
			query : "주식",
			sort : "latest",
			size : 6,
			target: "title"
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		for(var i=0; i<6; i++) {
			var isbn = msg.documents[i].isbn;
			
			if(msg.documents[i].thumbnail == "") {
				$("#subject2").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" + isbn + "'><img src='img/book_bin.png'/></a></article>");
			} else {
				$("#subject2").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" + isbn + "'><img src='" + msg.documents[i].thumbnail + "'/></a></article>");
			}
		}
	});
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book?target=title",
		data : {
			query : "언택트",
			sort : "latest",
			size : 6,
			target: "title"
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		for(var i=0; i<6; i++) {
			var isbn = msg.documents[i].isbn;
			if(msg.documents[i].thumbnail == "") {
				$("#subject3").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" + isbn + "'><img src='img/book_bin.png'/></a></article>");
			} else {
				$("#subject3").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" + isbn + "'><img src='" + msg.documents[i].thumbnail + "'/></a></article>");
			}
		}
	});
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book?target=title",
		data : {
			query : "인테리어",
			size : 6,
			target: "title"
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		for(var i=0; i<6; i++) {
			var isbn = msg.documents[i].isbn;
			if(msg.documents[i].thumbnail == "") {
				$("#subject4").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" + isbn + "'><img src='img/book_bin.png'/></a></article>");
			} else {
				$("#subject4").append("<artlcle class='book_frame'><a href='BookInfo.book?command=info&isbn=" + isbn + "'><img src='" + msg.documents[i].thumbnail + "'/></a></article>");
			}
		}
	});
});