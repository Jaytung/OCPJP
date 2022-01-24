<%@page import="uuu.blackcake.entity.Size"%>
<%@page import="uuu.blackcake.entity.Outlet"%>
<%@page import="uuu.blackcake.entity.Product"%>
<%@page import="uuu.blackcake.service.ProductService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
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
<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.css">

<style>
section {
	margin-top: 13vh;
}
</style>

<title>產品詳細</title>
</head>
<jsp:include page="/subviews/navbar.jsp">
	<jsp:param value="產品明細" name="subheader" />
	<jsp:param value="true" name="noNav" />
</jsp:include>
<body>
	<jsp:include page="/Product_ajax.jsp"></jsp:include>

	<!-- 	<script -->
	<!-- 		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" -->
	<!-- 		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" -->
	<!-- 		crossorigin="anonymous"></script> -->
	<script src="https://code.jquery.com/jquery-3.0.0.js"
		integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
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
		$(function() {
			$(document).scroll(
					function() {
						var $nav = $("#mainNavbar");
						$nav.toggleClass("scrolled", $(this).scrollTop() > $nav
								.height());
					})
		})
	</script>

</body>

</html>