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
		$("#count").append("총 " + msg.meta.total_count + " 건의 검색 결과가 있습니다.");	
		for(var i=0; i<10; i++) {
			if(msg.documents[i].thumbnail == "") {
				$("#book").append("<div class='book'><a href='BookInfo.book?command=info&isbn=" 
						+ msg.documents[i].isbn +"'><img src='img/book_bin.png'/></a><h3>" 
						+ msg.documents[i].title + "</h3><h4>&nbsp | &nbsp" 
						+ msg.documents[i].authors[0] + "</h4><h5>" 
						+ msg.documents[i].publisher + "</h5><br><br><font>"
						+ msg.documents[i].price + "원</font></div>");
			} else {
				$("#book").append("<div class='book'><a href='BookInfo.book?command=info&isbn=" 
						+ msg.documents[i].isbn +"'><img src='" 
						+ msg.documents[i].thumbnail + "'/></a><h3>" 
						+ msg.documents[i].title + "</h3><h4>&nbsp | &nbsp" 
						+ msg.documents[i].authors[0] + "</h4><h5>" 
						+ msg.documents[i].publisher + "</h5><br><br><font>"
						+ msg.documents[i].price + "원</font></div>");
			}
		}
	});
});