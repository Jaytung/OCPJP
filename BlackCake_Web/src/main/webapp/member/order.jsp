<%@page import="uuu.blackcake.service.OrderService"%>
<%@page import="uuu.blackcake.entity.Order"%>
<%@page import="uuu.blackcake.entity.OrderStatusLog"%>
<%@page import="uuu.blackcake.entity.OrderItem"%>
<%@page import="uuu.blackcake.entity.CartItem"%>
<%@page import="uuu.blackcake.entity.ShoppingCart"%>
<%@page import="uuu.blackcake.entity.Outlet"%>
<%@page import="uuu.blackcake.entity.Size"%>
<%@page import="uuu.blackcake.entity.Spicy"%>
<%@page import="uuu.blackcake.entity.Product"%>
<%@page import="uuu.blackcake.entity.PaymentType"%>
<%@page import="uuu.blackcake.entity.CartItem"%>
<%@page import="uuu.blackcake.entity.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@ page import="uuu.blackcake.entity.Customer"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page pageEncoding="UTF-8"%>
<%!private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<!-- Custom CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/order.css">
<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
<style>
/*  .receipt-content {  */
/*  	margin-top: 2vh; */
/* }  */
.statusDiv{
	font-size:20px;
}
.imgs {
	width: 150px;
	height: auto;
}
/* td>img { */
/* 	width: 100px; */
</style>
<title>????????????</title>
</head>

<body>
	<jsp:include page="/subviews/navbar.jsp">
		<jsp:param value="??????????????????" name="subheader" />
	</jsp:include>
	<%
	Customer member = (Customer) session.getAttribute("member");
	String orderId = request.getParameter("orderId");
	Order order = null;
	OrderService oService = new OrderService();
	List<OrderStatusLog> logList = null;
	if (member != null && orderId != null) {
		order = oService.getOrderById(member, orderId);
	}
	%>
	<div class="receipt-content">
		<div class="container">
			<%
			if (order == null) {
			%>
			<h2>
				???????????????(<%=orderId%>)
			</h2>
			<%
			} else {
			%>
			<div class="row">
				<div class="col-md-12">
					<div class="invoice-wrapper">
						<div class="intro">
							?????? <strong><%=member != null ? member.getName() : ""%></strong>,
							<br> ??????????????? <strong><%=Math.round(order.getTotalAmountWithFee())%></strong>
							(???) ??????????????????
						</div>

						<div class="payment-info">
							<div class="row">
								<div class="col-sm-6">
									<span>????????????:</span> <strong>NO.<%=order.getId()%></strong> <span></span>
									<strong
										title='<%=order.getCreateDate()%> <%=order.getCreatTime()%>'>??????:<%=order.getStatusString()%></strong>
								</div>
							</div>
						</div>
						<div class="payment-info">
							<span>??????</span>
							<div class="row">
								<div class="row col-sm-6 ml-1">
									<div class='statusDiv'
										title='<%=order.getCreateDate()%> <%=order.getCreatTime()%>'>
										<strong class="badge badge-success">?????????</strong>
									</div>
									<%
									logList = oService.getOrderStatusLog(orderId);
									if (logList != null && logList.size() > 0) {
										for (OrderStatusLog log : logList) {
									%>
									<strong>&rarr;</strong>
									<div class='statusDiv' title='<%=log.getLogTime()%>'>
										<span></span><strong class="badge badge-success"><%=order.getStatusString(log.getStatus())%></strong>
									</div>
									<%
									}
									}
									%>
								</div>
								<div class="col-sm-6 text-right">
									<span>????????????</span> <strong><%=order.getCreateDate()%> <%=order.getCreatTime().format(formatter)%></strong>
								</div>
							</div>
							<div class="payment-details">
								<div class="row">
									<div class="col-sm-6">
										<span>?????????</span> <strong> <%=member != null ? member.getName() : ""%>
										</strong>
										<p>
<%-- 											??????:<%=member != null ? member.getAddress() : ""%> --%>
											<br> ??????:<%=member != null ? member.getPhone() : ""%>
											<br> Email:<%=member != null ? member.getEmail() : ""%>
											<br>
										</p>
									</div>
									<div class="col-sm-6 text-right">
										<span>?????????</span> <strong> <%=order.getReceiptName()%>
										</strong>
										<p>
											????????????:<%=order.getShippingAddres()%>
											<br> ??????:<%=order.getReceiptPhone()%>
											<br> Email:<%=order.getReceiptEmail()%>
											<br>
										</p>
									</div>
								</div>
							</div>

							<div class="line-items">
								<div class="headers clearfix">
									<div class="row">
										<div class="col-md-2"></div>
										<div class="col-md-4 text-right">??????/</div>
										<div class="col-md-3 text-right">??????/</div>
										<div class="col-md-3 text-right">??????/</div>
									</div>
								</div>
								<div class="items">
									<%
									for (OrderItem orderItem : order.getOrderItemSet()) {
										Product p = orderItem.getProduct();
										Size size = orderItem.getSize();
									%>
									<div class="row item">
										<div class="col-md-2 ">
											<img class="imgs"
												src='<%=request.getContextPath()%>/<%=size != null && size.getPhotoURL() != null ? size.getPhotoURL() : p.getPhotoUrl()%>'>
										</div>
										<div class="col-md-4 text-right desc">
											<%=p.getName()%><%=orderItem.getSpicy()%><%=size != null ? size.getName() : ""%>
										</div>
										<div class="col-md-3 qty text-right">
											???<%=orderItem.getQuantity()%>???
										</div>
										<div class="col-md-3 amount text-right">
											<%="$"+Math.round(orderItem.getPrice()) * orderItem.getQuantity()%>
										</div>
									</div>
									<%
									}
									%>
								</div>
								<div class="total text-right">
									<p class="extra-notes">
										<strong>??????</strong>
										<%=order.getShippingNote() != null ? order.getShippingNote() : ""%>
									</p>
									<div class="field">
										?????? <span>$<%=order.getShippingFee() > 0 ? Math.round(order.getShippingFee()) : "0"%></span>
									</div>
									<div class="field">
										????????? <span>$<%=order.getPaymentFee() > 0 ? Math.round(order.getPaymentFee()) : "0"%></span>
									</div>
									<div class="field grand-total">
										????????? <span>$<%=Math.round(order.getTotalAmountWithFee())%></span>
									</div>
								</div>

								<div class="print">
									<%if(order.getPaymentType() == PaymentType.ATM && order.getStatus()==0){%>
									<a href='atm_transfered.jsp?orderId=<%= order.getId() %>'>???????????????</a>
									<%}%>
								</div>
							</div>
						</div>

						<div class="footer">
							<%@ include file='/subviews/footer.jsp'%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%
	}
	%>
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