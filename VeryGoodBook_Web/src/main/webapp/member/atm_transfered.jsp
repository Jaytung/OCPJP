<%@page import="java.time.LocalDate"%>
<%@page import="uuu.blackcake.entity.Order"%>
<%@page import="uuu.blackcake.service.OrderService"%>
<%@page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ATM轉帳</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
	rel="stylesheet">
<!-- Custom CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.css">
<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
	<script>
	$(init);
	function init(){
		<% if("POST".equals(request.getMethod())){ %>
			repopulateForm();
		<%}%>
	}
	
	function repopulateForm(){
		$('input[name="orderId"]').val(${param.orderId});
		$('input[name="bank"]').val('${param.bank}');
		$('input[name="last5Code"]').val('${param.last5Code}');
		$('input[name="amount"]').val('${param.amount}');
		$('input[name="date"]').val('${param.date}');
		$('select[name="time"]').val('${param.time}');
	}	
	</script>
</head>
<%
String orderId = request.getParameter("orderID");
Customer member = (Customer)session.getAttribute("member");
OrderService oService = new OrderService();
Order order = null;
if(member!=null&&orderId!=null){
	order=oService.getOrderById(member,orderId);
}
%>
<body>
	<%if(order!=null){ %>
	${requestScope.errors}
	<div class="container mt-5">
		<form class="needs-validation atmForm" action="atm_transfered.do"
			method="POST" novalidate>
			<h1 class="text-center">ATM轉帳</h1>
			<h3 class="text-center mt-5"><%=order.getId() %></h3>
			<div class="form-row mt-5">
				<div class="col-md-6 mb-3">
					<label for="transBank" >轉帳銀行</label>
					 <input type="text" class="form-control" id="transBank" 
					 name="bank" value="${param.bank} " placeholder="請輸入轉帳銀行" required>
					<div class="invalid-feedback">請填寫轉帳銀行</div>
					<div class="valid-feedback">正確!</div>
				</div>
				<div class="col-md-6 mb-3">
					<label for="last5Code">帳號後五碼</label>
						 <input type="text" class="form-control" id="last5Code"
						 name="last5Code" value="${param.last5Code} " placeholder="請輸入轉帳後五碼" required>
					<div class="invalid-feedback">請輸入轉帳後五碼</div>
					<div class="valid-feedback">正確!</div>
				</div>
			</div>
			<div class="form-row">
				<div class="col-md-6 mb-3">
					<label for="transAmount">轉帳金額</label> 
					<input type="number" class="form-control" id="transAmount" min="1"
						  name="amount" value="<%=request.getParameter("amount")==null?order.getTotalAmountWithFee():request.getParameter("amount") %>" required>
					<div class="valid-feedback">正確!</div>
					<div class="invalid-feedback">必須輸入轉帳金額</div>
				</div>
				<div class="col-md-6 mb-3">
					<label for="transDate">轉帳日期</label> 
					<input type="date" class="form-control" id="transDate" min="<%=order.getCreateDate() %>" max="<%=LocalDate.now() %>"
						 value="${param.date }" required> </select>
					<div class="valid-feedback">正確!</div>
					<div class="invalid-feedback">請選擇轉帳日期</div>
				</div>
				<div class="col-md-6 mb-3">
					<label for="time">轉帳時間</label>
					<select class="form-control">
						<option value="">請選擇...</option>
						<%for(int i=0;i<24;i++){ %>
						<option value="<%=i%>:00"><%=i%>:00</option>
						<option value="<%=i%>:30"><%=i%>:30</option>
						<%} %>
					</select>
					~
				</div>
			</div>
			<div class="d-flex justify-content-end">
				<button class="btn btn-dark btn-lg mr-1" type="reset">還原</button>
				<button class="btn btn-dark btn-lg" type="submit">確定</button>
			</div>
		</form>
		<%}else{ %>
			<h3 class="text-center mt-5">查無此訂單</h3>
		<%} %>
		<script>
			$(
					function() {
						$(document).scroll(
								function() {
									var $nav = $("#mainNavbar");
									$nav.toggleClass("scrolled", $(this)
											.scrollTop() > $nav.height());
								})
					})
		</script>
		<script>
			// Example starter JavaScript for disabling form submissions if there are invalid fields
					(
							function() {
								'use strict';
								window
										.addEventListener(
												'load',
												function() {
													// Fetch all the forms we want to apply custom Bootstrap validation styles to
													var forms = document
															.getElementsByClassName('needs-validation');
													// Loop over them and prevent submission
													var validation = Array.prototype.filter
															.call(
																	forms,
																	function(
																			form) {
																		form
																				.addEventListener(
																						'submit',
																						function(
																								event) {
																							if (form
																									.checkValidity() === false) {
																								event
																										.preventDefault();
																								event
																										.stopPropagation();
																							}
																							form.classList
																									.add('was-validated');
																						},
																						false);
																	});
												}, false);
							})();
		</script>
	</div>

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
</body>

</html>