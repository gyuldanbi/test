$(function() {
	$('#search_btn').click(
			function() {
				var keyword = $('#search').val();
				if (keyword.length > 0) {
					location.href = "search.book?command=top&keyword="
							+ encodeURI(encodeURIComponent(keyword))
							+ "&page=1";
				} else {
					alert("검색어를 입력해주세요");
				}
			})
});

function btn(num) {
	if (num == 1) {
		location.href = "login.jsp";
	} else if (num == 2) {
		location.href = "signin.jsp";
	} else if (num == 3) {
		location.href = "logout.jsp";
	}
}