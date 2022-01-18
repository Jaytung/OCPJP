<%@page import="uuu.blackcake.service.OrderService"%>
<%@page import="uuu.blackcake.entity.Order"%>
<%@page import="uuu.blackcake.entity.OrderItem"%>
<%@page import="uuu.blackcake.entity.CartItem"%>
<%@page import="uuu.blackcake.entity.ShoppingCart"%>
<%@page import="uuu.blackcake.entity.Outlet"%>
<%@page import="uuu.blackcake.entity.Size"%>
<%@page import="uuu.blackcake.entity.Product"%>
<%@page import="uuu.blackcake.entity.CartItem"%>
<%@page import="uuu.blackcake.entity.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@ page import="uuu.blackcake.entity.Customer"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter" %>
<%@ page pageEncoding="UTF-8"%>
<%! private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss"); %>
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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/receipt.css">
<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
<style>
 .container { 
 	margin-top: 2vh;
} 
.imgs{
	width: 150px;
	height: auto;
}
/* td>img { */
/* 	width: 100px; */
</style>
<title>結帳明細</title>
</head>

<body>
	<jsp:include page="/subviews/navbar.jsp">
		<jsp:param value="建立訂單成功" name="subheader" />
	</jsp:include>
	<%
	Customer member = (Customer) session.getAttribute("member");
	String orderId = request.getParameter("orderId");
	Order order =null;
	if(member!=null && orderId!=null){
		OrderService oService = new OrderService();
		order = oService.getOrderById(member, orderId);
	}
	%>
		<div class="receipt-content">
		<div class="container">
			<%if(order==null){ %>
			<h2>查無此訂單(<%=orderId%>)</h2>
			<%}else{%>
			<div class="row">
				<div class="col-md-12">
					<div class="invoice-wrapper">
						<div class="intro">
							您好 <strong><%=member!=null?member.getName():"" %></strong>,
							<br>
							本次訂單共 <strong><%=order.getTotalAmountWithFee() %></strong> (元) 感謝您的購買
						</div>

						<div class="payment-info">
							<div class="row">
								<div class="col-sm-6">
									<span></span>
									<strong>NO.<%=order.getId() %></strong>
								</div>
								<div class="col-sm-6 text-right">
									<span>建立時間</span>
									<strong><%=order.getCreateDate()%>  <%=order.getCreatTime().format(formatter) %></strong>
								</div>
							</div>
						</div>

						<div class="payment-details">
							<div class="row">
								<div class="col-sm-6">
									<span>購買人</span>
									<strong>
										<%=member!=null?member.getName():"" %>
									</strong>
									<p>
										地址:<%=member!=null?member.getAddress():"" %>
										<br>
										電話:<%=member!=null?member.getPhone():"" %>
										<br>
										Email:<%=member!=null?member.getEmail():"" %>
										<br>
									</p>
								</div>
								<div class="col-sm-6 text-right">
									<span>收件人</span>
									<strong>
										<%=order.getReceiptName() %>
									</strong>
									<p>
										地址:<%=order.getShippingAddres() %>
										<br>
										電話:<%=order.getReceiptPhone() %>
										<br>
										Email:<%=order.getReceiptEmail() %>
										<br>
									</p>
								</div>
							</div>
						</div>

						<div class="line-items">
							<div class="headers clearfix">
								<div class="row">
									<div class="col-md-2"></div>
									<div class="col-md-4">詳細/</div>
									<div class="col-md-3 text-right">數量/</div>
									<div class="col-md-3 text-right">小記</div>
								</div>
							</div>
							<div class="items">
							<%for(OrderItem orderItem:order.getOrderItemSet()){
								Product p = orderItem.getProduct();
								Size size = orderItem.getSize();
							%>
								<div class="row item border-bottom">
									<div class="col-md-2 ">
										<img class="imgs" src='<%=request.getContextPath()%>/<%=size!=null&&size.getPhotoURL()!=null?size.getPhotoURL():p.getPhotoUrl() %>'>
									</div>
									<div class="col-md-4 text-center desc">
										 <br>
										 <br>
										 <br>
										<%=p.getName() %>
									</div>
									<div class="col-md-3 qty text-right">
										共<%=orderItem.getQuantity() %>件
									</div>
									<div class="col-md-3 amount text-right">
										<%=orderItem.getPrice()*orderItem.getQuantity() %>
									</div>
								</div>
							<%} %>
							</div>
							<div class="total text-right">
								<p class="extra-notes">
									<strong>備註</strong>
									<%=order.getShippingNote()!=null?order.getShippingNote():"" %>
								</p>
<!-- 								<div class="field"> -->
<%-- 									小記 <span>$<%=orderItem.getPrice()*orderItem.getQuantity() %></span> --%>
<!-- 								</div> -->
								<div class="field">
									運費 <span>$<%=order.getShippingFee()>0?order.getShippingFee():"" %></span>
								</div>
								<div class="field">
									手續費 <span>$<%=order.getPaymentFee()>0?order.getPaymentFee():"" %></span>
								</div>
								<div class="field grand-total">
									總金額 <span>$<%=order.getTotalAmountWithFee() %></span>
								</div>
							</div>
						
							<div class="print">
								<a href="#">
									<i class="fa fa-print"></i>
									Print this receipt
								</a>
							</div>
						</div>
					</div>

					<div class="footer">
						<%@ include file='/subviews/footer.jsp' %>
					</div>
				</div>
			</div>
		</div>
	</div>
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