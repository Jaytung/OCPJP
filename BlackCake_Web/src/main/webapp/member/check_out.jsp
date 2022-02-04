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
			alert("請先登入");
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
		$("#amountTitle").text("總金額(+手續費): ");
		$("#totalAmountWithFee").text(totalAmnt+totalFee+" 元");
	}
	function changePaymentType(thePaymentType){
		disableShippingTypeOptions();
		calculateFee();
	}
	function disableShippingTypeOptions(){
		var dataShipping = $("select[name='paymentType'] option:selected").attr("data-shipping");
		var selectedShipping = $("select[name='shippingType']").val();
		
		console.log( "付款: ", $("select[name='paymentType'] option:selected").val(),dataShipping);
		console.log( "貨運: ", selectedShipping);
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
<title>結帳</title>
</head>

<body>
	<jsp:include page="/subviews/navbar.jsp">
		<jsp:param value="結帳" name="subheader" />
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
					<h2 class="text-center">訂單是空的!</h2>
					<a href="<%=request.getContextPath()%>/index.jsp">返回首頁</a>
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
					<h1 class="text-center">購物明細</h1>
					<form action="check_out.do" method="POST" id="cartForm">
						<table class="table table-hover table-striped table-rwd">
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
									<td data-th="名稱"><%=p.getName()%><br> <img
								src="/blackcake/<%=item.getPhotoUrl()%>"><br> <span>庫存剩餘:<%=stock%></span></td>
									<td data-th="大小"><%=size != null ? size.getName() : ""%></td>
									<td data-th="口味"><%=spicy%></td>
									<td data-th="定價"><%=item.getListPrice() == 0 ? Math.round(item.getUnitPrice()) : Math.round(item.getListPrice())%></td>
									<td data-th="折扣"><%=item.getDiscountString()%></td>
									<td data-th="售價"><%=Math.round(item.getUnitPrice())%></td>
									<td data-th="數量"><%=qty%></td>
									<td data-th="小記"><%=Math.round(item.getUnitPrice()) * qty%></td>
								</tr>
								<%
								}
								%>
							</tbody>
							<tfoot>
								<tr class="text-center">
									<td colspan="6"></td>
									<td><%=cart.size() + "項" + "共" + cart.getTotalQuantity() + "件"%></td>
									<td>總金額:<span id='totalAmount'><%=Math.round(cart.getTotalAmount())%></span>元
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
									<th><h2>結帳方式</h2></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><label>付款方式:</label> <select name='paymentType'
										class="form-control" onchange='changePaymentType(this)'
										required>
											<option value='' data-fee="0">請選擇...</option>
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
									<td><label>貨運方式:</label> <select name='shippingType'
										class="form-control" onchange='changeShippingType(this)'
										required>
											<option value='' data-ship="0">請選擇...</option>
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
										<h4>購買人:</h4>
										<div class="form-row col">
											<div class="col-6 mb-3">
												<label for="validationDefault01">姓名</label> <input
													type="text" class="form-control" placeholder="姓名"
													name='name' value="<%=member.getName()%>" readonly>
											</div>
											<div class="col-6 mb-3">
												<label for="validationDefault02">電話</label> <input
													type="text" class="form-control" placeholder="phone"
													name='phone' value="<%=member.getPhone()%>" readonly>
											</div>
											<div class="col-6 mb-3">
												<label for="validationDefault02">信箱</label> <input
													type="text" class="form-control" placeholder="email"
													name='email' value="<%=member.getEmail()%>" readonly>
											</div>
											<div class="col-6 mb-3">
												<label for="validationDefault02">地址</label> <input
													type="text" class="form-control" placeholder="收件地址"
													name='address' value="<%=member.getAddress()%>" readonly>
											</div>
										</div>
									</td>
									<td class="col-md-6">
										<h4>
											收件人<a href='javascript:copyMember()'>同購買人</a>
										</h4>
										<div class="form-row col">
											<div class="col-6 mb-3">
												<label for="validationDefault01">姓名</label> <input
													type="text" class="form-control" placeholder="姓名"
													name='name' required>
											</div>
											<div class="col-6 mb-3">
												<label for="validationDefault02">電話</label> <input
													type="text" class="form-control" placeholder="phone"
													name='phone' required>
											</div>
											<div class="col-6 mb-3">
												<label for="validationDefault03">信箱</label> <input
													type="text" class="form-control" placeholder="email"
													name='email' required>
											</div>
											<div class="col-6 mb-3">
												<label for="validationDefault04">收件地址</label> <input
													type="search" class="form-control" placeholder="收件地址"
													name='shippingAddress' required>
												<datalist id="shoplist">
													<option value="台北市復興北路99號12F(台北總公司)">復北門市:台北市復興北路99號12F</option>
													<option value="台中市西區臺灣大道二段309號2樓(台中門市)">台中門市:台中市西區臺灣大道二段309號2樓</option>
													<option value="高雄市前鎮區中山二路2號25樓(高雄門市)">高雄門市:高雄市前鎮區中山二路2號25樓</option>
												</datalist>
												<datalist id="storelist">
													<option value="全家慶成店">
													<option value="7-11松慶店">
												</datalist>
												<div class="storeBtn">
													<input id='chooseStoreBtn' type='button'
														class="form-control btn btn-dark" value='選擇超商'
														style='display: none' onclick='goEzShip()'>
												</div>
											</div>
										</div>
									</td>
								</tr>
								<tr class="">
									<td><input type='button' value='回商城繼續購物'
										class='btn btn-lg btn-dark' onclick='goBackShop()'></td>
									<td><input type='submit' value='送出訂單'
										class='btn btn-lg btn-dark'></td>
								</tr>
							</tbody>
						</table>
					</form>
					<script>                        	
			function goEzShip() {//前往EZShip選擇門市
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
				
				//alert(url); //測試用，測試完畢後請將此行comment
				//alert($("#webPara").val()) //測試用，測試完畢後請將此行comment
				
				$("#ezForm").submit();
			}
		</script>
					<form id="ezForm" method="post" name="simulation_from"
						action="https://map.ezship.com.tw/ezship_map_web.jsp">
						<input type="hidden" name="suID" value="test@vgb.com">
						<!-- 業主在 ezShip 使用的帳號, 隨便寫 -->
						<input type="hidden" name="processID" value="VGB202107050000005">
						<!-- 購物網站自行產生之訂單編號, 隨便寫 -->
						<input type="hidden" name="stCate" value="">
						<!-- 取件門市通路代號 -->
						<input type="hidden" name="stCode" value="">
						<!-- 取件門市代號 -->
						<input type="hidden" name="rtURL" id="rtURL" value="">
						<!-- 回傳路徑及程式名稱 -->
						<input type="hidden" id="webPara" name="webPara" value="">
						<!-- 結帳網頁中cartForm中的輸入欄位資料。ezShip將原值回傳，才能帶回結帳網頁 -->
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