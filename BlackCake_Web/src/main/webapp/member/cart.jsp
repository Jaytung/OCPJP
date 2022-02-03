<%@page import="uuu.blackcake.service.ProductService"%>
<%@page import="uuu.blackcake.entity.Outlet"%>
<%@page import="uuu.blackcake.entity.Size"%>
<%@page import="uuu.blackcake.entity.Spicy"%>
<%@page import="uuu.blackcake.entity.Product"%>
<%@page import="uuu.blackcake.entity.CartItem"%>
<%@page import="uuu.blackcake.entity.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@ page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<!-- Font-Awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.css">


<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>
</script>

<style>
.container {
	margin-top: 5vh;
}

td>img {
	width: 100px;
}

#remove {
	background: url("<%=request.getContextPath()%>/imgs/trash.png")
		no-repeat;
	height: 30px;
	width: 30px;
	border: none;
}
</style>

<script>
    function goBackShop() {
		location.href="<%=request.getContextPath()%>
	/shoplist.jsp";
	}
	function checkStock() {

	}
</script>
<title>購物車</title>
</head>

<body>
	<!-- style="background-color: #EED6C4; -->
	<%-- 	<jsp:include page="<%=request.getContextPath() %>subviews/header.jsp" /> --%>
	<%-- <%--     <%  --%>
	<!-- //     List<String> errors = (List<String>)request.getAttribute("errors");  -->
	<%-- <%--     %> --%>

	<jsp:include page="/subviews/navbar.jsp" />
	<%
	Customer member = (Customer) session.getAttribute("member");
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
		<%
		List<String> errors = (List<String>) request.getAttribute("errors");
		%>
		<div class="container">
			<%
			if (errors != null && errors.size() > 0) {
				for (int i = 0; i < errors.size(); i++) {
					String msg = (String) errors.get(i);
			%>
			<div class="alert alert-danger text-center" role="alert">
				<h4><%=msg%>!
				</h4>
			</div>
			<%
			}
			}
			%>
			<h1 class="text-center">購物車</h1>
			<form action="<%=request.getContextPath()%>/member/update_cart.do"
				method="POST">
				<!-- 			<button type="button" class="btn btn-lg btn-dark mb-1" -->
				<!-- 				onclick="goBackShop()">繼續購物</button> -->
				<table class="table table-hover">
					<thead class="thead-dark">
						<tr>
							<th scope="col">名稱</th>
							<th scope="col">大小</th>
							<th scope="col">口味</th>
							<!-- 						<th scope="col">定價</th> -->
							<!-- 						<th scope="col">折扣</th> -->
							<th scope="col">售價</th>
							<th scope="col">數量</th>
							<th scope="col">小記</th>
							<th scope="col">刪除</th>
						</tr>
					</thead>
					<tbody>
						<%
						ProductService pService = new ProductService();

						for (CartItem item : cart.getCartItemSet()) {
							Product p = item.getProduct();
							Size size = item.getSize();
							String spicy = item.getSpicy();
							int qty = cart.getQuantity(item);
							int stock = pService.getProductStock(p, size, spicy);
						%>
						<tr>
							<td><%=p.getName()%><br> <img
								src="/blackcake/<%=item.getPhotoUrl()%>"><br> <span>庫存剩餘:<%=stock%></span></td>
							<td><%=size != null ? size.getName() : ""%></td>
							<td><%=spicy%></td>
							<%-- 						<td><%=item.getListPrice()%></td> --%>
							<%-- 						<td><%=item.getDiscountString()%></td> --%>
							<td><%=Math.round(item.getUnitPrice())%></td>
							<td><input type="number" class="form-control"
								name="quantity<%=item.hashCode()%>" value="<%=qty%>" required
								min="<%=stock > 0 ? 1 : 0%>" max="<%=stock%>"><input
								type="submit" class="btn btn-dark form-control" value="修改"></td>
							<td><%=Math.round(item.getUnitPrice()) * qty%></td>
							<td><input type="submit" id="remove"
								name="delete<%=item.hashCode()%>" value=''></td>
						</tr>
						<%
						}
						%>
					</tbody>
					<tfoot>
						<tr>
							<th colspan="5"></th>
							<th>數量</th>
							<th>總金額</th>
						</tr>
						<tr>
							<td colspan="5">
							<td><%=cart.size() + "項" + "共" + cart.getTotalQuantity() + "件"%></td>
							<td><%=Math.round(cart.getTotalAmount())%>元<br>
							<button type='submit' value='結帳'
									class="btn btn-dark btn-lg d-flex justify-content-end"
									name="checkout" onclick='location.href="check_out.jsp"'>結帳</button></td>
						</tr>
					</tfoot>
				</table>
				<!-- 				<div class="col d-flex justify-content-end"> -->
				<!-- 					<button type='submit' value='結帳' -->
				<!-- 						class="btn btn-dark btn-lg d-flex justify-content-end" -->
				<!-- 						name="checkout" onclick='location.href="check_out.jsp"'>結帳</button> -->
				<!-- 				</div> -->
			</form>
			<%
			}
			%>
		</div>
	</div>



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