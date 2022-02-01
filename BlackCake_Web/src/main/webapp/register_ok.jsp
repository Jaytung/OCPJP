<%@ page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<%
String uri = (String) request.getAttribute("previous_uri");
String queryString = (String) request.getAttribute("previous_query_string");
String title = "首頁";
if (uri == null || uri.length() == 0) {
	uri = "./";
} else {
	if (queryString != null && queryString.length() > 0) {
		uri += "?" + queryString;
	}
	title = "指定網頁";
}
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="refresh" content="9999;url=<%=uri%>">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.css">
<style>
.container {
	margin-top: 10vh;
}

.footer {
	position: fixed;
	bottom: 0px;
}
</style>
<script>
	var i = 5;
	var countDown = window.setInterval(countDownHandler,1000);		
	function countDownHandler (){
		counter.innerHTML = (--i>0?i:1);				
	}
		function callHomePage() {
			//同步請求
			location.href= '<%= uri%>';
	}
</script>
<title>登入成功</title>
</head>

<body>
	<%
	Customer c = (Customer) request.getAttribute("member");
	%>
	<div class="container">
		<h2 class="text-center">
		</p>
			<%= c!=null?c.getName():"<b>未</b>" %>註冊成功! <span id='counter'>5</span>秒後回
			<a href="javascript:callHomePage()"><%=title%></a>
		</h2>
	</div>
	<%@ include file='subviews/footer.jsp'%>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
		integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
		crossorigin="anonymous"></script>
	<script>
		</body>

		</html>
	