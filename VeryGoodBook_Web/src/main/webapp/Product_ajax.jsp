<%@page import="uuu.blackcake.entity.Size"%>
<%@page import="uuu.blackcake.entity.Outlet"%>
<%@page import="uuu.blackcake.entity.Product"%>
<%@page import="uuu.blackcake.service.ProductService"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="stylesheet" href="app.css">

<style>
.cartBtn {
	width: 60px;
}

.iconImg {
	width: 300px;
}

#album {
	width: 250px;
	height: auto;
	border: none;
	padding: 10px;
	background: #F0ECE3;
	color: white;
}

#main {
	width: 600px;
	height: 600px;
}

.smallPic {
	width: 100px;
	padding: 5px;
	background: white;
	margin: 10px 2px;
}

.selected {
	background: orange;
}

.row {
	margin-left: 0px;
}

#sizeStock {
	color: #e63946;
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
            function showHandler(){
            	var image = $(this).attr("src");
            	 $("#main").attr("src",image);
            	 $(".smallPic").removeClass("selected");
            	 $(this).addClass("selected");
            }
        	function changeData(theObj){
// 				alert($(theObj).attr("src"));
// 				alert($(theObj).attr("title"));
// 				alert($(theObj).attr("data-price"));
				
				$(".sizePrice").text($(theObj).attr("title") +$(theObj).attr("data-price") + "元");
				$("#sizeStock").text($(theObj).attr("title") + "剩餘" + $(theObj).attr("data-stock") + "個");
				$("input[name='quantity']").attr("max", $(theObj).attr("data-stock"));
// 				$(".price").attr("text", $(theObj).attr("data-price"));
			}
        	function submitCart() {
        		alert("#cartForm serialize(): " + $("#cartForm").serialize());
        		
        		$.ajax({
        			url:$("#cartForm").attr('action')+'?ajax=',
        			method:'POST',
        			data:$("#cartForm").serialize()		
        		}).done(submitCartDoneHander);
        		
        		
        		return false;//取消原來同步的submit功能
			}
        	function submitCartDoneHander(data,status,xhr) {
				alert("加入購物車");
				$(".cartQty").html(data.totalQuantity);
			}
        	</script>
<title>產品詳細</title>
</head>

<body id="product">
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

	<jsp:include page="subviews/navbar.jsp" />
	<div class="container ">
		<form action="add_to_cart.do" method="POST" id="cartForm" onsubmit="return submitCart()">

			<input type='hidden' value='<%=p.getId()%>' name='productId'>
			<div class="row">
				<div
					class="col-sm-12 col-md-6 col-lg-6 photo rounded order-1 order-md-1">
					<img src="<%=p.getPhotoUrl()%>" class="rounded" id="main" alt="">
				</div>
				<div class="col-sm-12 col-md-6 col-lg-6 order-3 order-md-3">
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
							特價:<%=p instanceof Outlet ? ((Outlet) p).getDiscountString() : ""%>
							<span class="sizePrice"><%=p.getUnitPrice() + "元"%>
								&nbsp;&nbsp;&nbsp;&nbsp;</span>
						</h3>
						<%
						if (p instanceof Outlet) {
						%>
						<h4>
							定價:<span class="sizePrice"><%=((Outlet) p).getListPrice() + ""%></span>
						</h4>
						<%
						}
						%>
						<hr>
						<h3>庫存:</h3>
						<p>
							總數:<%=p.getStock() + "個"%>
							&nbsp;&nbsp;&nbsp;&nbsp;<span id="sizeStock"></span>
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
								<label class="btn btn-primary" class="btn btn-primary"
									for="<%=size.getName()%>"> <input type="radio"
									name="size" value="<%=size.getName()%>"
									id="<%=size.getName()%>" title='<%=size.getName()%>'
									data-stock='<%=size.getStock()%>'
									data-price='<%=size.getPrice()%>' Value="<%=size.getName()%>"
									onclick='changeData(this)' required="required"> <%=size.getName()%>
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

				<div class="col-6 col-md-6 rounded order-2 order-md-5">
					<%
					if (p.getSizeMapSize() > 0) {
					%>
					<div id="album" class="rounded">
						<%
						for (Size size : p.getSizes()) {
						%>
						<div class="row">
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
			<div class="col-sm-12 col-md-6 order-6 mt-4">
				<div class="text-center">
					<span class="">數量:</span>
					<div class="input-group justify-content-center">
						<span class="input-group-addon">
							<button class="btn btn-dark btn-lg mr-1 cartBtn" type="button"
								id="minus">
								<span class="cartPlusAndMinus">-</span>
							</button>
						</span> <input type="text"
							class="form-control form-control-lg text-center rounded col-sm-12 col-md-4 col-lg-3"
							aria-label="" value="0" id="quantity" name="quantity"> <span
							class="input-group-addon">
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
	<br>
	<br>
	<br>
	<br>
	<br>


	<%@ include file='subviews/footer.jsp'%>
	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.6.0.js"
		integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
		crossorigin="anonymous"></script>
	</script>
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
	$(function () { $(document).scroll( function () { var $nav =
	$("#mainNavbar"); $nav.toggleClass("scrolled", $(this).scrollTop() >
	$nav .height()); }) })
	</script>
</body>


</html>