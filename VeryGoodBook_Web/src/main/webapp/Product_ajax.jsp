<%@page import="uuu.blackcake.entity.Size"%>
<%@page import="uuu.blackcake.entity.Spicy"%>
<%@page import="uuu.blackcake.entity.Outlet"%>
<%@page import="uuu.blackcake.entity.Product"%>
<%@page import="uuu.blackcake.service.ProductService"%>
<%@page import="uuu.blackcake.entity.CartItem"%>
<%@ page pageEncoding="UTF-8"%>
<!--Product_ajax.jsp start -->
<style>
#productItem {
	width: 50%;
	margin: auto;
	max-width: 1200px
}

#product {
	width: 100%;
	margin: auto;
	max-width: 1200px
}

#productData div {
	white-space: nowrap
}

/* 			.photo{width:40%;min-width:250px;max-width:350px;float:left}			 */
[type=radio] {
	position: absolute;
	opacity: 0;
	width: 1;
	height: 1;
}

/* 			.icon{width:48px} */

/* IMAGE STYLES */
[type=radio]+img {
	cursor: pointer;
}

/* CHECKED STYLES */
[type=radio]:checked+img {
	outline: 2px solid #000;
}

#description {
	clear: both;
	padding-top: 1ex;
	width: 100%
}

.container {
	margin-top: 10vh;
}

.cartBtn {
	width: 60px;
}

.iconImg {
	width: 300px;
}

#album {
	width: 400px;
	height: auto;
	border: none;
	padding: 10px;
	background: #F0ECE3;
	color: white;
}

#main {
	width: 800px;
	height: 800px;
}

.smallPic {
	width: 150px;
	padding: 5px;
	background: white;
	margin: 10px 2px;
}

.selected {
	background: #6c757d;
}

.row {
	margin-left: 0px;
}

#stock {
	font-size: 1.2rem;
	color: #e63946;
}

@media screen and (min-width: 500px) and (max-width: 768px) {
	#album {
		width: 295px;
	}
	.smallPic {
		width: 100px;
	}
}

@media screen and (min-width: 768px) and (max-width: 1250px) {
	#album {
		width: 200px;
	}
	.smallPic {
		width: 80px;
	}
}

@media screen and (min-width: 860px) and (max-width: 1250px) {
	#album {
		width: 300px;
	}
	.smallPic {
		width: 120px;
	}
}

@media screen and (min-width: 1250px) and (max-width: 2000px) {
	#album {
		width: 450px;
	}
	.smallPic {
		width: 150px;
	}
}

input[type=number]::-webkit-outer-spin-button, input[type=number]::-webkit-inner-spin-button
	{
	-webkit-appearance: none;
	margin: 0;
}

/* Firefox */
input[type=number] {
	-moz-appearance: textfield;
}
</style>
<script>
	$(document).ready(init);
	function init() {
		$("#minus").click(minusHandler);
		$("#plus").click(plusHandler);
		$(".smallPic").click(showHandler);
		$(".smallPic:first").addClass("selected");
	}
	function minusHandler() {
		var quantitiyValue = parseInt($("#quantity").val());
		if (quantitiyValue > 0) {
			$("#quantity").val(quantitiyValue - 1);
		}
	}
	function plusHandler() {
		var quantitiyValue = parseInt($("#quantity").val());

		$("#quantity").val(quantitiyValue + 1);
	}
	function showHandler() {
		var image = $(this).attr("src");
		$("#main").attr("src", image);
		$(".smallPic").removeClass("selected");
		$(this).addClass("selected");
	}
	function changeSizeData(theObj) {
		// 				alert($(theObj).attr("src"));
		// 				alert($(theObj).attr("title"));
		// 				alert($(theObj).attr("data-price"));

		$(".sizePrice").text(
				$(theObj).attr("title") + $(theObj).attr("data-price") + "元");
		$("#stock").text(
				$(theObj).attr("title") + "剩餘" + $(theObj).attr("data-stock")
						+ "個");
		$("input[name='quantity']").attr("max", $(theObj).attr("data-stock"));
		// 				$(".price").attr("text", $(theObj).attr("data-price"));
	}
	function changeSpciyData(theObj) {
		// 				alert($(theObj).attr("src"));
		// 				alert($(theObj).attr("title"));
		// 				alert($(theObj).attr("data-price"));
		$("#stock").text(
				$(theObj).attr("title") + "剩餘" + $(theObj).attr("data-stock")
						+ "個");
		$("input[name='quantity']").attr("max", $(theObj).attr("data-stock"));
		// 				$(".price").attr("text", $(theObj).attr("data-price"));
	}
	function submitCart() {
		//         		alert("#cartForm serialize(): " + $("#cartForm").serialize());

		$.ajax({
			url : $("#cartForm").attr('action') + '?ajax=',
			method : 'POST',
			data : $("#cartForm").serialize()
		}).done(submitCartDoneHandler);

		return false;//取消原來同步的submit功能
	}
	function submitCartDoneHandler(data, status, xhr) {
		alert("加入購物車成功");
		$(".cartQuantity").html(data.totalQuantity);
	}
</script>


<div class="productItem">
	<%
	String productId = request.getParameter("productId");
	Product p = null;
	if (productId != null) {
		ProductService pService = new ProductService();
		p = pService.selectProductById(productId);
	}
	if (p == null) {
	%>
	<p>
		查無此商品(id=<%=productId%>)
	</p>
	<%
	} else {
	%>

	<div class="container" id="product">
		<form action="add_to_cart.do" method="POST" id="cartForm"
			onsubmit="return submitCart()">

			<input type='hidden' value='<%=p.getId()%>' name='productId'>
			<div class="row">
				<div
					class="col-sm-12 col-md-6 col-lg-6 photo rounded order-1 order-md-1 mb-1 mainProduct">
					<img src="<%=p.getPhotoUrl()%>" class="rounded" id="main" alt="">
				</div>
				<div
					class="col-sm-12 col-md-6 col-lg-6 order-3 order-md-3 productDetail">
					<div class="text-center">
						<hr>
						<h2>
							<%=p.getName()%>
						</h2>
						<hr>
						<h3>產品敘述:</h3>
						<p>
							<%=p.getDescription()%>
						</p>
						<hr>
						<h3>
							優惠價:<%=p instanceof Outlet ? ((Outlet) p).getDiscountString() : ""%>
							<span class="sizePrice"> <%=Math.round(p.getUnitPrice())%>元
								&nbsp;&nbsp;&nbsp;&nbsp;
							</span>
						</h3>
						<%
						if (p instanceof Outlet) {
						%>
						<h4>
							定價:<span class="sizePrice"> <%=((Outlet) p).getListPrice()+""%>
							</span>
						</h4>

						<%
						}
						%>

						<hr>
						<h3>庫存:</h3>
						<p>
							總數:<span class="stock"><%=p.getStock()%></span>
							&nbsp;&nbsp;&nbsp;&nbsp;<span id="stock"></span>
						</p>
						<hr>
						<div class="col-md-6 order-4 order-md-4" style="max-width: 100%;">
							<div class="btn-group btn-group-toggle" data-toggle="buttons">
								<%
								if (p.getSizeMapSize() > 0) {
								%>
								<%
								for (Size size : p.getSizes()) {
								%>
								<label class="btn btn-dark" for="<%=size.getName()%>"> <input
									type="radio" name="size" value="<%=size.getName()%>"
									id="<%=size.getName()%>" title='<%=size.getName()%>'
									data-stock='<%=size.getStock()%>'
									data-price='<%=size.getUnitPrice()%>'
									Value="<%=size.getName()%>" onclick='changeSizeData(this)'
									required="required"> <%=size.getName()%>
								</label>
								<%
								}
								%>
								<%
								} else if (p.getSpicyMapSize() > 0) {
								%>
								<%
								for (Spicy spicy : p.getSpicy()) {
								%>
								<label class="btn btn-dark" for="<%=spicy.getName()%>">
									<input type="radio" name="spicy" value="<%=spicy.getName()%>"
									id="<%=spicy.getName()%>" title='<%=spicy.getName()%>'
									data-stock='<%=spicy.getStock()%>' Value="<%=spicy.getName()%>"
									onclick='changeSpciyData(this)' required="required"> <%=spicy.getName()%>
								</label>
								<%
								}
								%>
								<%
								}
								%>
							</div>
						</div>
					</div>
				</div>

				<div class="col-6 col-md-6 rounded order-2 order-md-5 mt-0">
					<div id="album"
						class="row-6 row-sm-9 row-md-12 justify-content-center rounded ">
						<div class="row justify-content-center">
							<img class="rounded shadow smallPic" src="<%=p.getPhotoUrl()%>">
							<img class="rounded shadow smallPic" src="<%=p.getPhotoUrl1()%>">
						</div>
					</div>
					<%
					if (p.getSizeMapSize() > 0) {
					%>
					<div id="album" class="row-9 rounded">
						<%
						for (Size size : p.getSizes()) {
						%>
						<div class="row row-6 row-sm-9 row-md-12 justify-content-center">
							<img
								src="<%=size.getPhotoURL() == null ? size.getPhotoURL() : size.getIconURL()%>"
								class="rounded shadow smallPic" title='<%=size.getName()%>'
								data-photo='<%=size.getPhotoURL()%>' />
							<%
							}
							%>
						</div>
					</div>
				</div>
				<%
				}
				%>

				<%
				}
				%>
			</div>
			<div class="col-sm-12 col-md-6 order-8 mt-4 productInput">
				<div class="text-center">
					<span class="">數量:</span>
					<div class="input-group justify-content-center">
						<span class="input-group-addon">
							<button class="btn btn-dark btn-lg mr-1 cartBtn" type="button"
								id="minus">
								<span class="cartPlusAndMinus">-</span>
							</button>
						</span> <input type="number"
							class="form-control form-control-lg text-center rounded col-sm-12 col-md-4 col-lg-3"
							aria-label="" value="0" id="quantity" name="quantity" min="1">
						<span class="input-group-addon">
							<button class="btn btn-dark btn-lg ml-1 cartBtn" type="button"
								id="plus">
								<span class="cartPlusAndMinus">+</span>
							</button>
						</span>
					</div>
					<!-- /input-group -->
				</div>
				<!-- /.col-lg-6 -->
				<div class="text-center" id="addToCart">
					<br> <input class="btn btn-lg btn-dark" type="submit"
						value="加到購物車">
				</div>
			</div>
		</form>
	</div>
</div>
<!-- product_ajax.jsp end -->