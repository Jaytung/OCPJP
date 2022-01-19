<%@page import="uuu.blackcake.service.OrderService"%>
<%@page import="uuu.blackcake.entity.Order"%>
<%@page import="uuu.blackcake.entity.ShippingType"%>
<%@page import="uuu.blackcake.entity.PaymentType"%>
<%@page import="uuu.blackcake.entity.CartItem"%>
<%@page import="uuu.blackcake.entity.ShoppingCart"%>
<%@page import="uuu.blackcake.entity.Outlet"%>
<%@page import="uuu.blackcake.entity.Size"%>
<%@page import="uuu.blackcake.entity.Product"%>
<%@page import="uuu.blackcake.entity.CartItem"%>
<%@page import="uuu.blackcake.entity.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@ page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.css">

<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
<style>
table {
	margin-top: 8vh;
}

td>img {
	width: 100px;
}
</style>
<script>
	
</script>
<title>結帳</title>
</head>

<body>
	<jsp:include page="/subviews/navbar.jsp">
		<jsp:param value="歷史定單" name="subheader" />
	</jsp:include>
	<%Customer member = (Customer)session.getAttribute("member");
	  OrderService oService = new OrderService();
	  List<Order> list =null;
	  if(member!=null){
		  list=oService.getOrderHistory(member);
	  }
	%>
	<%if(list==null||list.isEmpty()){%>
	<div class="container">
		<p>歷史清單是空的!</p>
	</div>
	<%}else{ %>
	<table class="table table-hover">
		<thead>
			<tr>
				<th scope="col">訂單編號</th>
				<th scope="col">訂單日期</th>
				<th scope="col">付款方式</th>
				<th scope="col">貨運方式</th>
				<th scope="col">處理狀況</th>
				<th scope="col">總金額</th>
				<th scope="col">查看明細</th>
			</tr>
		</thead>
		<tbody>
		<% for(Order order:list){%>
			<tr>
				<td><%=order.getId() %></td>
				<td><%=order.getCreateDate()%><%=order.getCreatTime()%></td>
				<td><%=order.getPaymentType() %></td>
				<td><%=order.getShippingType() %></td>
				<td><%=order.getStatus() %></td>
				<td><%=order.getTotalAmountWithFee() %></td>
				<td><a href='order.jsp?orderId=<%=order.getId()%>'>訂單明細</a></td>
			</tr>
			<%} %>
		</tbody>
	</table>
	<%} %>
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