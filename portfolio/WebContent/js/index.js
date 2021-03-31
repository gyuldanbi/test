$(document).ready(function() {	
	$.ajax({
		method : "GET",
		url : "https://dapi.kakao.com/v3/search/book?target=title",
		data : {
			query : "바다",
			size : 10,
			target: "title"
		},
		headers : {
			Authorization : "KakaoAK a21a3da52f61e18339fb171fd2619476"
		}
	}).done(function(msg) {
		for(var i=0; i<10; i++) {
			var isbn = msg.documents[i].isbn;
			var title = msg.documents[i].title;
			if(title.length>12) {
				title = title.substring(0, 11) + "…";
			}
			
			if(msg.documents[i].thumbnail == "") {
				$("#recommendBook").append("<div class='bookRec'><a href='BookInfo.book?command=info&isbn="
					+ isbn + "'><img src='img/book_bin.png'/></a><h3>"
					+ msg.documents[i].title + "</h3><h4>"
					+ msg.documents[i].authors[0] + "</h4></div>");
			} else {
				$("#recommendBook").append("<div class='bookRec'><a href='BookInfo.book?command=info&isbn="
					+ isbn + "'><img src='" + msg.documents[i].thumbnail + "'/></a><h3>"
					+ title + "</h3><h4>"
					+ msg.documents[i].authors[0] + "</h4></div>");
			}
		}
	});
});