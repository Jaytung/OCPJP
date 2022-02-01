<%@page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!--navbar.jsp start-->

<%
Customer member = (Customer) session.getAttribute("member");
%>


<nav id="mainNavbar"
	class="navbar row navbar-light navbar-expand-lg py-0 fixed-top rounded-down">
	<a href=" #" class="navbar-brand ml-1">鮮記</a>
	<button class="navbar-toggler" data-toggle="collapse"
		data-target="#navLinks" arir-label="Toggle navigation">
		<span class="navbar-toggler-icon"> </span>
	</button>
	<div class="collapse navbar-collapse" id="navLinks">
		<ul class="navbar-nav mr-auto">
			<li class="nav-item nav-link order-md-1"><a
				href='<%=request.getContextPath()%>/index.jsp' class="">首頁</a></li>
			<li class="nav-item  order-3 order-md-2"><a
				href="<%=request.getContextPath()%>/about_us.jsp" class="nav-link">關於我們</a>
			</li>
			<li class="nav-item dropdown order-7 order-md-3"><a
				href='<%=request.getContextPath()%>/shoplist.jsp'
				class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
				data-toggle="dropdown" aria-expanded="false"> 商品 </a>
				<form>
					<div class="dropdown-menu text-center"
						aria-labelledby="navbarDropdown">
						<a class="nav-link"
							href="<%=request.getContextPath()%>/shoplist.jsp?">全部商品</a>
						<div class="dropdown-divider"></div>
						<a class="nav-link"
							href="<%=request.getContextPath()%>/shoplist.jsp?category=糕點">糕點類</a>
						<div class="dropdown-divider"></div>
						<a class="nav-link"
							href="<%=request.getContextPath()%>/shoplist.jsp?category=罐醬">罐醬類</a>
						<div class="dropdown-divider"></div>
						<a class="nav-link"
							href="<%=request.getContextPath()%>/shoplist.jsp?category=海鮮">海鮮類</a>
					</div>
				</form></li>
		</ul>
		<ul class="navbar-nav">
			<!-- 尚未登入 -->
			<%
			if (member == null) {
			%>

			<li class="nav-item dropdown "><span
				class="nav-link dropdown-toggle" id="navbarDropdown"
				role="button" data-toggle="dropdown" aria-expanded="false">
					會員 </span>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="nav-link text-center"
						href='<%=request.getContextPath()%>/register.jsp'>註冊</a> <a
						class="nav-link text-center" href='<%=request.getContextPath()%>/login.jsp'>登入</a>
				</div></li>
			<%
			} else {
			%>
			<!-- 已登入 -->
			<%
			if (member != null) {
			%>

			<%-- 			<span class="nav-link order-1 order-md-1" id="loginName"> <%=member != null ? member.getName() : ""%> --%>
			<!-- 				你好 -->
			<!-- 			</span> -->
			<%
			}
			%>
			<!-- 			<div class="row ml-2"> -->
			<%-- 			<a class="nav-link order-1" href='<%=request.getContextPath()%>/member/cart.jsp'><img src="<%=request.getContextPath()%>/imgs/cart.png"></a> --%>
			<%-- 			<span class="cartQuantity order-2 ">${sessionScope.cart.getTotalQuantity()}</span> --%>
			<!-- 			</div> -->
			<li class="nav-item dropdown"><span
				class="nav-link dropdown-toggle" id="navbarDropdown" role="button"
				data-toggle="dropdown" aria-expanded="false"> 會員中心 </span>
				<div class="dropdown-menu" aria-labelledby="navbarDropdown">
					<a class="nav-link text-center"><%=member != null ? member.getName() + "你好" : ""%></a>
					<a class="nav-link text-center"
						href="<%=request.getContextPath()%>/member/order_history.jsp">歷史訂單</a>
					<a class="nav-link text-center"
						href="<%=request.getContextPath()%>/member/update.jsp">會員修改</a> <a
						class="nav-link text-center" href="<%=request.getContextPath()%>/logout.do">登出</a>
				</div></li>
			<%
			}
			%>
			<li class="nav-link"><a class="order-1"
				href='<%=request.getContextPath()%>/member/cart.jsp'><img
					src="<%=request.getContextPath()%>/imgs/cart.png"> <span
					class="cartQuantity order-2 ">${sessionScope.cart.getTotalQuantity()}</span></a>

			</li>
		</ul>
		<form class="form-inline my-2 my-lg-0 mr-1" action='shoplist.jsp'
			method="get">
			<input type="search" name="keyword" placeholder="SEARCH"
				class="form-control mr-sm-2 ml-auto ml-md-3"
				value="${param.keyword}">
			<button class="btn btn btn-dark my-2 my-sm-0" type="submit">搜尋</button>
		</form>
	</div>
</nav>
<!--navbar.jsp end-->