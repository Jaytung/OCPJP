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
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/receipt.css">
<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
<style>
 .container { 
 	margin-top: 2vh;
} 

/* td>img { */
/* 	width: 100px; */
</style>
<title>結帳明細</title>
</head>

<body>
	<jsp:include page="/subviews/navbar.jsp">
		<jsp:param value="結帳" name="subheader" />
	</jsp:include>

		<div class="receipt-content">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="invoice-wrapper">
						<div class="intro">
							您好 <strong>Jimmy</strong>,
							<br>
							本次訂單共 <strong>$312</strong> (元) 感謝您的購買
						</div>

						<div class="payment-info">
							<div class="row">
								<div class="col-sm-6">
									<span>訂單編號 No.</span>
									<strong>434334343</strong>
								</div>
								<div class="col-sm-6 text-right">
									<span>付款日期</span>
									<strong>Jul 09, 2014 - 12:20 pm</strong>
								</div>
							</div>
						</div>

						<div class="payment-details">
							<div class="row">
								<div class="col-sm-6">
									<span>購買人</span>
									<strong>
										Jimmy
									</strong>
									<p>
										台北市信義區基隆路一段1號
										<br>
									</p>
								</div>
								<div class="col-sm-6 text-right">
									<span>收件人</span>
									<strong>
										Jimmy
									</strong>
									<p>
										台北市基隆路一段1號
										<br>
									</p>
								</div>
							</div>
						</div>

						<div class="line-items">
							<div class="headers clearfix">
								<div class="row">
									<div class="col-xs-4">詳細/</div>
									<div class="col-xs-3">數量/</div>
									<div class="col-xs-5 text-right">總價</div>
								</div>
							</div>
							<div class="items">
								<div class="row item">
									<div class="col-xs-4 desc">
										黑糖糕
									</div>
									<div class="col-xs-3 qty">
										3個
									</div>
									<div class="col-xs-5 amount text-right">
										$60.00
									</div>
								</div>
								<div class="row item">
									<div class="col-xs-4 desc">
										干貝醬
									</div>
									<div class="col-xs-3 qty">
										1個
									</div>
									<div class="col-xs-5 amount text-right">
										$20.00
									</div>
								</div>
								<div class="row item">
									<div class="col-xs-4 desc">
										小管片
									</div>
									<div class="col-xs-3 qty">
										2個
									</div>
									<div class="col-xs-5 amount text-right">
										$18.00
									</div>
								</div>
							</div>
							<div class="total text-right">
								<p class="extra-notes">
									<strong>備註</strong>
									同時間於明日下午送達
								</p>
								<div class="field">
									小記 <span>$379.00</span>
								</div>
								<div class="field">
									運費 <span>$0.00</span>
								</div>
								<div class="field">
									折扣 <span>4.5%</span>
								</div>
								<div class="field grand-total">
									總金額 <span>$312.00</span>
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
						Copyright © 2022. 鮮記
					</div>
				</div>
			</div>
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