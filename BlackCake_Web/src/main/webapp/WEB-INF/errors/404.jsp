<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<!-- Custom CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/app.css">
<style>
article{
	margin-top: 5vh;
}
</style>
<title>404</title>
</head>
<body>
<jsp:include page="/subviews/navbar.jsp">
<jsp:param value="找不到網頁" name="subheader"/>
</jsp:include>
<div class="container">
<article>
	<h2>找不到這個網頁<%=request.getAttribute("javax.servlet.error.request_uri") %></h2>
	<img  src="<%=request.getContextPath()%>/imgs/404.png">
</article>
</div>
<%@ include file='/subviews/footer.jsp' %>
</body>
</html>