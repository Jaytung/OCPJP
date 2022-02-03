<%@page import="uuu.blackcake.entity.Outlet"%>
<%@page import="java.util.List"%>
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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">
<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<!-- Fancybox CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/fancybox3/jquery.fancybox.css">
<!-- Custom CSS -->
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/app.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/css/shoplist.css">
<style>
#productDetail{
display: none;width:70%
}
</style>


<script>
	function getImg(theImg) {
		// 		 if(!theImg.src) theImg=this;
		theImg.src = 'imgs/fishlogo1.png';
		theImg.onerror = null;
	}

	function getProduct(pId) {
		//送出同步GET請求
// 				location.href = "Product_ajax.jsp?productId=" + pId;

// 		送出非同步請求
		var xhr = $.ajax({
			url : 'Product_ajax.jsp?productId=' + pId,
			method : 'GET'
		}).done(getProductDoneHandler);
	}
	function getProductDoneHandler(data, textStatus, jqXHR) {
// 		alert(data);
		$("#productDetail").html(data);
 		$("#productDetail").css('height','fit-content');
 		$.fancybox.open({
		    src  : '#productDetail',
		    type : 'inline',
		    opts : {
		      afterShow : function( instance, current ) {
		        console.info('done!');
	      }
	    }
	  });
	}
</script>
<title>商品清單</title>
</head>

<body>
	<jsp:include page="/subviews/navbar.jsp">
		<jsp:param value="shopList" name="shophead"/>
	</jsp:include>
<div id="productDetail"></div>
	<br>
	<br>
	<!-- 		<aside> -->
	<!--  	<a href="shoplist.jsp">全部</a> -->
	<%--  	<a href="<%=request.getRequestURI()%>?name=黑糖糕">黑糖糕</a> --%>
	<%--  	<a href="<%=request.getRequestURI()%>?name=XO">罐醬類</a> --%>
	<!--  	</aside> -->

	<div class="header">
		<h1 class="text-center">商品清單</h1>
	</div>
	<div class="productList row col-12 justify-content-center">
	<div>
		
	</div>
		<%
		//1.取得requst的form data
		String keyword = request.getParameter("keyword");
		String category = request.getParameter("category");
		//2.呼叫商業邏輯

		ProductService pService = new ProductService();
		List<Product> list;
		if (keyword != null && keyword.length() > 0) {
			list = pService.selectProductByName(keyword);
		} else if (category != null && category.length() > 0) {
			list = pService.selectProductByCategory(category);
		} else {
			list = pService.getAllProducts();//改成查詢新品
		}

		if (list != null && list.size() > 0) {
		%>
		<div class="container-fulid px-0">
		<ul class="row text-center">
			<%
			for (int i = 0; i < list.size(); i++) {
				Product p = list.get(i);
			%>
			<li class="col-md-6 col-lg-4"><a
				href='Product.jsp?productId=<%= p.getId()%>'><img
					src='<%=p.getPhotoUrl()%>' onerror='getImg(this)'
					class="productList img-fluid rounded">
					<h2><%=p.getName()%></h2> <span>優惠價:<%=p instanceof Outlet ? ((Outlet) p).getDiscountString() : ""%>
						<%=Math.round(p.getUnitPrice())%>元
				</span> <br></a>
				<a href='javascript:getProduct(<%=p.getId()%>)' value="加到購物車">
				<button class="btn btn-lg btn-dark" onclick="href='javascript:getProduct(<%=p.getId()%>)'">直接購買</button></li>
			<%
			}
			%>
		</ul>
		</div>
		<%
		} else {
		%>
		<p>查無此產品</p>
		<%
		}
		%>

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
	
		<script src="https://code.jquery.com/jquery-3.0.0.js" 
		integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
		crossorigin="anonymous"></script>
		
	<script src='<%=request.getContextPath() %>/fancybox3/jquery.fancybox.js'></script>
		
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