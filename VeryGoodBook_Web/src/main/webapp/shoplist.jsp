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
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<!-- Custom CSS -->
<link rel="stylesheet" href="app.css">
<link rel="stylesheet" href="shoplist.css">

<script>
	function getImg(theImg) {
		// 		 if(!theImg.src) theImg=this;
		theImg.src = 'imgs/fishlogo1.png';
		theImg.onerror = null;
	}

	function getProduct(pId) {
		//送出同步GET請求
		location.href = "Product.jsp?productId=" + pId;

		//送出非同步請求
		// 		var xhr = $.ajax({
		// 			url:'Product.jsp?productId='+pId,
		// 			method:'GET'
		// 		}).done(getProductDoneHandler);	
	}
	function getProductDoneHandler(data, textStatus, jqXHR) {
		// 		alert(data);
	}
</script>
<title>商品清單</title>
</head>

<body>
	<jsp:include page="/subviews/header.jsp">
		<jsp:param value="shopList" name="shophead" />
	</jsp:include>
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
		<%
		//1.取得requst的form data
		String keyword = request.getParameter("keyword");
		String category = request.getParameter("category");
		//TODO:加上分類查詢
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

		<ul class="row text-center">
			<%
			for (int i = 0; i < list.size(); i++) {
				Product p = list.get(i);
			%>
			<li class="col-md-6 col-lg-4 " id=" 1"><a
				href="javascript:getProduct(<%=p.getId()%>)"> 
				<img
					src='<%=p.getPhotoUrl()%>' onerror='getImg(this)'
					class="productList img-fluid rounded">
					<h2><%=p.getName()%></h2> <span>優惠價:<%=p instanceof Outlet ? ((Outlet) p).getDiscountString() : ""%>
						<%=Math.round(p.getUnitPrice())%>元
				</span> <br></a>
					<button type="button" class="btn btn-dark addToCart">加到購物車</button></li>
			<%
			}
			%>
		</ul>
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
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
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