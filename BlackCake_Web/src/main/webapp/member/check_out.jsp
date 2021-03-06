<%@page import="uuu.blackcake.entity.ShippingType"%>
<%@page import="uuu.blackcake.service.ProductService"%>
<%@page import="uuu.blackcake.entity.PaymentType"%>
<%@page import="uuu.blackcake.entity.CartItem"%>
<%@page import="uuu.blackcake.entity.ShoppingCart"%>
<%@page import="uuu.blackcake.entity.Outlet"%>
<%@page import="uuu.blackcake.entity.Size"%>
<%@page import="uuu.blackcake.entity.Spicy"%>
<%@page import="uuu.blackcake.entity.Product"%>
<%@page import="uuu.blackcake.entity.CartItem"%>
<%@page import="uuu.blackcake.entity.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@page import="uuu.blackcake.entity.Customer"%>
<%@page pageEncoding="UTF-8"%>
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
	href="<%=request.getContextPath()%>/css/checkout.css">

<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
<style>
</style>
<script>

    function goBackShop() {
		location.href="<%=request.getContextPath()%>/shoplist.jsp";
	}
	$(init);
	function init(){
		<%if ("POST".equals(request.getMethod())) {%>
		repopulateFormDate();
		<%}%>
	}
	function repopulateFormDate(){
		$("select[name='paymentType']").val('<%=request.getParameter("paymentType")%>');
		changePaymentType();
		$("select[name='shippingType']").val('<%=request.getParameter("shippingType")%>');
		var store = ($("select[name='shippingType'] option:selected").attr("value"));
		var theShippingType = document.getElementById("shippingType"); 
		changeShippingType(theShippingType);
		
		$("input[name='name']").val('<%=request.getParameter("name")%>');
		$("input[name='email']").val('<%=request.getParameter("email")%>');
		$("input[name='phone']").val('<%=request.getParameter("phone")%>');
		$("input[name='shippingAddress']").val('<%=request.getParameter("shippingAddress")%>');
		if(store=="STORE"){
			document.getElementById('chooseStoreBtn').style.display="";	
		}
	}
	function copyMember(){
		if(${ empty sessionScope.member}){
			alert("????????????");
		}else{
			$("input[name='name']").val('${sessionScope.member.getName()}');
			$("input[name='phone']").val('${sessionScope.member.phone}');
			$("input[name='email']").val('${sessionScope.member.email}');
			var shipping = $("select[name='shippingType']").val();
			if(shipping=='HOME'){
				$("input[name='shippingAddress']").val('${sessionScope.member.address}');
			}
		}	
	}
	function calculateFee(){
		console.log($("select[name='shippingType'] option:selected").val(), 
				$("select[name='shippingType'] option:selected").val());
		
		var totalAmnt = Number($("#totalAmount").text());
		var totalFee=0;
		if($("select[name='paymentType'] option:selected").val()!=""){
			totalFee += Number($("select[name='paymentType'] option:selected").attr('data-fee'));
			
		}
		if($("select[name='shippingType'] option:selected").val()!=""){
			totalFee += Number($("select[name='shippingType'] option:selected").attr('data-fee'));
		}
		
		console.log(totalAmnt+totalFee);
		$("#amountTitle").text("?????????(+?????????): ");
		$("#totalAmountWithFee").text(totalAmnt+totalFee+" ???");
	}
	function changePaymentType(thePaymentType){
		disableShippingTypeOptions();
		calculateFee();
	}
	function disableShippingTypeOptions(){
		var dataShipping = $("select[name='paymentType'] option:selected").attr("data-shipping");
		var selectedShipping = $("select[name='shippingType']").val();
		
		console.log( "??????: ", $("select[name='paymentType'] option:selected").val(),dataShipping);
		console.log( "??????: ", selectedShipping);
		if(dataShipping) dataShipping=dataShipping.split(",");
		$("select[name='shippingType'] option").prop('disabled', false);
		if(dataShipping.length>0){				 
			$("select[name='shippingType'] option").prop('disabled', true);
			for(i=0;i<dataShipping.length;i++){
				console.log($("select[name='shippingType'] option[value='"+dataShipping[i]+"']").val(),
						$("select[name='shippingType'] option[value='"+dataShipping[i]+"']").prop('disabled'));
				$("select[name='shippingType'] option[value='"+dataShipping[i]+"']").prop('disabled', false);
			}
		}
		$("select[name='shippingType']").val('');
		if(selectedShipping){
			if($("select[name='shippingType'] option[value='"+selectedShipping+"']").prop('disabled')!=true){
				$("select[name='shippingType']").val(selectedShipping);
			}
		}
	}
	function changeShippingType(theShippingType){
		changeAddressInput(theShippingType);
		calculateFee();	
	}
	function changeAddressInput(theShippingType){
		var shipping = $(theShippingType).val();
		//alert(shipping);
		$('input[name="shippingAddress"]').attr('autocomplete','off');
		$("#chooseStoreBtn").css('display','none');
		if(shipping=='STORE'){
			$('input[name="shippingAddress"]').val('')
			$('input[name="shippingAddress"]').attr('list', "storelist");
			$("#chooseStoreBtn").css('display','inline');
		}else if(shipping=='SHOP'){
			$('input[name="shippingAddress"]').val('')
			$('input[name="shippingAddress"]').attr('list', "shoplist");
		}else{
			$('input[name="shippingAddress"]').removeAttr('list');
			$('input[name="shippingAddress"]').attr('autocomplete','on');
		}
		resizeAddress();
	}
	function resizeAddress(){
		var phoneWidth = Number($("input[name='phone']").css('width').replace('px', ''));
		console.log(phoneWidth);
		if($("select[name='shippingType']").val()=="STORE"){
// 			$("input[name='shippingAddress']").css('width',Number(phoneWidth)-73.5);
		}else{
			$("input[name='shippingAddress']").css('width',phoneWidth);
		}
	}
	$(window).on("resize", resizeAddress);
    	

</script>
<title>??????</title>
</head>

<body>
	<jsp:include page="/subviews/navbar.jsp">
		<jsp:param value="??????" name="subheader" />
	</jsp:include>

	<section class="container-fluid px-0 mt-0 mb-0">
		<div class="row align-items-center">
			<%
			ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
			if (cart == null || cart.isEmpty()) {
			%>
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
				<div class="container text-center container-fulid px-0">
					<h2 class="text-center">???????????????!</h2>
					<a href="<%=request.getContextPath()%>/index.jsp">????????????</a>
				</div>
				<%
				} else {
				%>
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
					<h1 class="text-center">????????????</h1>
					<form action="check_out.do" method="POST" id="cartForm">
						<table class="table table-hover table-striped table-rwd">
							<thead class="thead-dark  text-center">
								<tr>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
									<th scope="col">??????</th>
								</tr>
							</thead>
							<tbody class="text-center">
								<%
								ProductService pService = new ProductService();
								for (CartItem item : cart.getCartItemSet()) {
									Product p = item.getProduct();
									Size size = item.getSize();
									String spicy = item.getSpicy();
									Spicy spicyObj = item.getSpicyObj();
									int qty = cart.getQuantity(item);
									int stock = pService.getProductStock(p, size, spicy);
								%>
								<tr>
									<td data-th="??????"><%=p.getName()%><br> <img
								src="/blackcake/<%=item.getPhotoUrl()%>"><br> <span>????????????:<%=stock%></span></td>
									<td data-th="??????"><%=size != null ? size.getName() : ""%></td>
									<td data-th="??????"><%=spicy%></td>
									<td data-th="??????"><%=item.getListPrice() == 0 ? Math.round(item.getUnitPrice()) : Math.round(item.getListPrice())%></td>
									<td data-th="??????"><%=item.getDiscountString()%></td>
									<td data-th="??????"><%=Math.round(item.getUnitPrice())%></td>
									<td data-th="??????"><%=qty%></td>
									<td data-th="??????"><%=Math.round(item.getUnitPrice()) * qty%></td>
								</tr>
								<%
								}
								%>
							</tbody>
							<tfoot>
								<tr class="text-center">
									<td colspan="6"></td>
									<td><%=cart.size() + "???" + "???" + cart.getTotalQuantity() + "???"%></td>
									<td>?????????:<span id='totalAmount'><%=Math.round(cart.getTotalAmount())%></span>???
									</td>
								</tr>
							</tfoot>
						</table>
						<hr>
						<div class="col col-md-12 text-right ">
							<span id='amountTitle' class='border-bottom border-success '></span>
							<span id='totalAmountWithFee'
								class='border-bottom border-success '></span>
						</div>
						<table class="table table-borderless">
							<thead>
								<tr>
									<th><h2>????????????</h2></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><label>????????????:</label> <select name='paymentType'
										class="form-control" onchange='changePaymentType(this)'
										required>
											<option value='' data-fee="0">?????????...</option>
											<%
											for (PaymentType pType : PaymentType.values()) {
											%>
											<option value='<%=pType.name()%>'
												data-shipping='<%=pType.getShippingArrayString()%>'
												data-fee="<%=pType.getFee()%>"><%=pType.toString()%></option>
											<%
											}
											%>
									</select></td>
									<td><label>????????????:</label> <select name='shippingType'
										class="form-control" onchange='changeShippingType(this)'
										required>
											<option value='' data-ship="0">?????????...</option>
											<%
											for (ShippingType sType : ShippingType.values()) {
											%>
											<option value='<%=sType.name()%>'
												data-fee='<%=sType.getFee()%>'><%=sType.toString()%></option>
											<%
											}
											%>
									</select></td>
								</tr>
								<%
								Customer member = (Customer) session.getAttribute("member");
								%>
								<tr class="col-12">
									<td class="col-md-6">
										<h4>?????????:</h4>
										<div class="form-row col">
											<div class="col-6 mb-3">
												<label for="validationDefault01">??????</label> <input
													type="text" class="form-control" placeholder="??????"
													name='name' value="<%=member.getName()%>" readonly>
											</div>
											<div class="col-6 mb-3">
												<label for="validationDefault02">??????</label> <input
													type="text" class="form-control" placeholder="phone"
													name='phone' value="<%=member.getPhone()%>" readonly>
											</div>
											<div class="col-6 mb-3">
												<label for="validationDefault02">??????</label> <input
													type="text" class="form-control" placeholder="email"
													name='email' value="<%=member.getEmail()%>" readonly>
											</div>
											<div class="col-6 mb-3">
												<label for="validationDefault02">??????</label> <input
													type="text" class="form-control" placeholder="????????????"
													name='address' value="<%=member.getAddress()%>" readonly>
											</div>
										</div>
									</td>
									<td class="col-md-6">
										<h4>
											?????????<a href='javascript:copyMember()'>????????????</a>
										</h4>
										<div class="form-row col">
											<div class="col-6 mb-3">
												<label for="validationDefault01">??????</label> <input
													type="text" class="form-control" placeholder="??????"
													name='name' required>
											</div>
											<div class="col-6 mb-3">
												<label for="validationDefault02">??????</label> <input
													type="text" class="form-control" placeholder="phone"
													name='phone' required>
											</div>
											<div class="col-6 mb-3">
												<label for="validationDefault03">??????</label> <input
													type="text" class="form-control" placeholder="email"
													name='email' required>
											</div>
											<div class="col-6 mb-3">
												<label for="validationDefault04">????????????</label> <input
													type="search" class="form-control" placeholder="????????????"
													name='shippingAddress' required>
												<datalist id="shoplist">
													<option value="?????????????????????99???12F(???????????????)">????????????:?????????????????????99???12F</option>
													<option value="?????????????????????????????????309???2???(????????????)">????????????:?????????????????????????????????309???2???</option>
													<option value="??????????????????????????????2???25???(????????????)">????????????:??????????????????????????????2???25???</option>
												</datalist>
												<datalist id="storelist">
													<option value="???????????????">
													<option value="7-11?????????">
												</datalist>
												<div class="storeBtn">
													<input id='chooseStoreBtn' type='button'
														class="form-control btn btn-dark" value='????????????'
														style='display: none' onclick='goEzShip()'>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr class="">
									<td><input type='button' value='?????????????????????'
										class='btn btn-lg btn-dark' onclick='goBackShop()'></td>
									<td><input type='submit' value='????????????'
										class='btn btn-lg btn-dark'></td>
								</tr>
							</tbody>
						</table>
					</form>
					<script>                        	
			function goEzShip() {//??????EZShip????????????
				$("input[name='name']").val($("input[name='name']").val().trim());
				$("input[name='email']").val($("input[name='email']").val().trim());
				$("input[name='phone']").val($("input[name='phone']").val().trim());
				$("input[name='shippingAddress']").val($("input[name='shippingAddress']").val().trim());
				
				var protocol = "<%=request.getProtocol().toLowerCase().substring(0, request.getProtocol().indexOf("/"))%>";
				var ipAddress = "<%=java.net.InetAddress.getLocalHost().getHostAddress()%>";
				var url = "https://" + ipAddress + ":" + location.port + "<%=request.getContextPath()%>/member/ezship_callback.jsp";                   
				$("#rtURL").val(url);
				
				//$("#webPara").val($("form[action='check_out.do']").serialize()); 
				$("#webPara").val($("#cartForm").serialize());
				
				//alert(url); //???????????????????????????????????????comment
				//alert($("#webPara").val()) //???????????????????????????????????????comment
				
				$("#ezForm").submit();
			}
		</script>
					<form id="ezForm" method="post" name="simulation_from"
						action="https://map.ezship.com.tw/ezship_map_web.jsp">
						<input type="hidden" name="suID" value="test@vgb.com">
						<!-- ????????? ezShip ???????????????, ????????? -->
						<input type="hidden" name="processID" value="VGB202107050000005">
						<!-- ???????????????????????????????????????, ????????? -->
						<input type="hidden" name="stCate" value="">
						<!-- ???????????????????????? -->
						<input type="hidden" name="stCode" value="">
						<!-- ?????????????????? -->
						<input type="hidden" name="rtURL" id="rtURL" value="">
						<!-- ??????????????????????????? -->
						<input type="hidden" id="webPara" name="webPara" value="">
						<!-- ???????????????cartForm???????????????????????????ezShip?????????????????????????????????????????? -->
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