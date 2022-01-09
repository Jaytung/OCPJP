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
<link rel="stylesheet" href="<%=request.getContextPath()%>/app.css">
<style>
.container {
	margin-top: 8vh;
}

td>img {
	width: 100px;
}
</style>
<script>
    function goBackShop() {
		location.href="<%=request.getContextPath()%>
	/shoplist.jsp";
	}
</script>
<title>澎湖名產</title>
</head>

<body>
	<jsp:include page="/subviews/header.jsp">
		<jsp:param value="結帳" name="subheader" />
	</jsp:include>

	<section class="container-fulid px-0">
		<div class="row align-items-center">
			<%
			ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
			if (cart == null || cart.isEmpty()) {
			%>
			<div class="container text-center">
				<h2 class="text-center">購物車是空的!</h2>
				<a href="<%=request.getContextPath()%>/index.jsp">返回首頁</a>
			</div>
			<%
			} else {
			%>
			<div class="container">
				<h1 class="text-center">購物明細</h1>
				<form action="" method="POST">
					<table class="table table-hover">
						<thead class="thead-dark  text-center">
							<tr>
								<th scope="col">名稱</th>
								<th scope="col">大小</th>
								<th scope="col">口味</th>
								<th scope="col">定價</th>
								<th scope="col">折扣</th>
								<th scope="col">售價</th>
								<th scope="col">數量</th>
								<th scope="col">小記</th>
							</tr>
						</thead>
						<tbody class="text-center">
							<%
							for (CartItem item : cart.getCartItemSet()) {
								Product p = item.getProduct();
								Size size = item.getSize();
								String spicy = item.getSpicy();
								int qty = cart.getQuantity(item);
								int stock = size != null ? size.getStock() : p.getStock();
							%>
							<tr>
								<td><img src="/blackcake/<%=p.getPhotoUrl()%>"><%=p.getName()%>
									<span>庫存剩餘:<%=stock%></span></td>
								<td><%=size != null ? size.getName() : ""%></td>
								<td><%=spicy%></td>
								<td><%=size.getPrice() != 0 ? size.getPrice() : p instanceof Outlet ? ((Outlet) p).getListPrice() : p.getUnitPrice()%></td>
								<td><%=p instanceof Outlet ? ((Outlet) p).getDiscountString() : ""%></td>
								<td><%=size.getPrice() != 0 ? size.getPrice() : p.getUnitPrice()%></td>
								<td><%=qty%></td>
								<td><%=(size.getPrice() != 0 ? size.getPrice() : p.getUnitPrice()) * qty%></td>
							</tr>
							<%
							}
							%>
						</tbody>
						<tfoot>
							<tr class="text-center">
								<td colspan="6"></td>
								<td><%=cart.size() + "項" + "共" + cart.getTotalQuantity() + "件"%></td>
								<td>總金額: <%=cart.getTotalAmount()%>元
								</td>
							</tr>
						</tfoot>
					</table>
					<hr>
					<table class="table table-borderless">
						<thead>
							<tr>
								<th><h2>結帳方式</h2></th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><label>付款方式:</label> <select name='paymentType'
									class="form-control" required>
										<option value=''>請選擇...</option>
										<option value='SHOP'>門市付款</option>
								</select></td>
								<td><label>貨運方式:</label> <select name='shippingType'
									class="form-control" required>
										<option value=''>請選擇...</option>
										<option value='SHOP'>門市取貨</option>
										<option value='STORE'>超商取貨, 60元</option>
										<option value='HOME'>送貨到府, 100元</option>
								</select></td>
							</tr>
							<tr class="">
								<td colspan='8'>
									<fieldset>
										<legend>收件人</legend>
										<div class="form-row col-6">
											<div class="col-md-6 mb-3">
												<label for="validationDefault01">姓名</label> <input
													type="text" class="form-control" placeholder="姓名"
													name='name' required>
											</div>
											<div class="col-md-6 mb-3">
												<label for="validationDefault02">電話</label> <input
													type="text" class="form-control" placeholder="phone"
													name='phone' required>
											</div>
											<div class="col-md-6 mb-3">
												<label for="validationDefault02">信箱</label> <input
													type="text" class="form-control" placeholder="email"
													name='email' required>
											</div>
											<div class="col-md-6 mb-3">
												<label for="validationDefault02">地址</label> <input
													type="text" class="form-control" placeholder="收件地址"
													name='shippingAddress' required>
											</div>
										</div>
									</fieldset>
								</td>
							<tr class="">
								<td><input type='button' value='回商城繼續購物'
									class='btn btn-lg btn-dark' onclick='goBackMall()'></td>
								<td><input type='submit' value='送出訂單'
									class='btn btn-lg btn-dark'></td>
							</tr>
						</tbody>
					</table>
				</form>
				<%
				}
				%>
			</div>
			</div>
			</section>
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
								$nav.toggleClass("scrolled", $(this)
										.scrollTop() > $nav.height());
							})
				})
			</script>
</body>

</html>