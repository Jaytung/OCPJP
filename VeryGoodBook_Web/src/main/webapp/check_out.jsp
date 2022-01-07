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
<link rel="stylesheet" href="app.css">
<style>
section{
	margin-top: 6vh;

</style>
    <script>
    function goBackShop() {
		location.href="<%=request.getContextPath()%>/shoplist.jsp";
	}
    </script>
<title>澎湖名產</title>
</head>

<body>
        <jsp:include page="subviews/header.jsp">
		<jsp:param value="結帳" name="subheader"/>
		</jsp:include>
	
	<section class="container-fulid px-0">
	<div class="row align-items-center">
		<%
		ShoppingCart cart = (ShoppingCart)session.getAttribute("cart");
		if(cart==null||cart.isEmpty()){
			%>
		<h2>購物車是空的</h2>
		<%}else{ %>
			<%for(CartItem item:cart.getCartItemSet()){ 
			  		Product p = item.getProduct();
			  		Size size = item.getSize();
			  		String spicy = item.getSpicy();
			  		int qty = cart.getQuantity(item);
			  		int stock = size!=null?size.getStock():p.getStock();
			  		%>
			  		<div class="container">
     	<h1 class="text-center">購物明細</h1>
     	<form action="" method="POST">
		 <table class="table table-hover">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">名稱</th>
			      <th scope="col">大小</th>
			      <th scope="col">口味</th>
			      <th scope="col">定價</th>
			      <th scope="col">折扣</th>
			      <th scope="col">售價</th>
			      <th scope="col">數量</th>
			      <th scope="col">小記</th>
				  <th scope="col">刪除</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row"></th>
			      <td><img src="/blackcake/<%=p.getPhotoUrl()%>"><%=p.getName() %> <span>庫存剩餘:<%=stock%></span></td>
			      <td><%=size!=null?size.getName():"" %></td>
			      <td><%=spicy %></td>
			      <td><%=p instanceof Outlet?((Outlet)p).getListPrice():p.getUnitPrice() %></td>
			      <td><%=p instanceof Outlet?((Outlet)p).getDiscountString():""%></td>
			      <td><%=p.getUnitPrice() %></td>
			      <td><%=qty%></td>
			      <td><%=p.getUnitPrice()*qty %></td>
			      <td><input type="checkbox" name="delete<%=item.hashCode()%>" class=""></td>
			    </tr>
			  </tbody>
			   <tfoot>
				  <tr>
				  <td></td>	
				  <td><button type="button" class="btn btn-primary btn-lg" onclick="goBackShop()">繼續購物</button></td>	
				  <td><input type="submit" class="btn btn-primary btn-lg" value="修改購物車"></td>
				  <td><button type="button" class="btn btn-primary btn-lg">查詢庫存</button></td>
				  <td></td>
				  <td></td>
				  <td></td>
				  <td></td>
				  <td><%=cart.size()+"項"+"共"+cart.getTotalQuantity()+"件" %></td>
				  <td>總金額: <%=cart.getTotalAmount() %>元</td>
				  <td><button type="submit" class="btn btn-primary btn-lg">送出訂單</button></td>
				  </tr>
				  </tfoot>	
			  </table>
			<%} %>	
		<%} %>	
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