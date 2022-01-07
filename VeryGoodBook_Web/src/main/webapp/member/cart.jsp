<%@page import="uuu.blackcake.entity.Outlet"%>
<%@page import="uuu.blackcake.entity.Size"%>
<%@page import="uuu.blackcake.entity.Product"%>
<%@page import="uuu.blackcake.entity.CartItem"%>
<%@page import="uuu.blackcake.entity.ShoppingCart"%>
<%@page import="java.util.List"%>
<%@ page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
    <!-- Font-Awesome CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
    <link rel="stylesheet" href="/blackcake/app.css">

    
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
    </script>
    
    <style>
    .container{
    margin-top: 12vh;
    }
    td>img{
    width: 100px;
    }
    
    </style>
    
    <script>
    function goBackShop() {
		location.href="<%=request.getContextPath()%>/shoplist.jsp";
	}
    </script>
    <title>購物車</title>
</head>

<body>
    <!-- style="background-color: #EED6C4; -->
<%-- 	<jsp:include page="<%=request.getContextPath() %>subviews/header.jsp" /> --%>
<%-- <%--     <%  --%>
<!-- //     List<String> errors = (List<String>)request.getAttribute("errors");  -->
<%-- <%--     %> --%> 
     
     <div style="margin-top:5vh">
<%--      ${sessionScope.cart} --%>
     </div>
      <jsp:include page="/subviews/header.jsp"/>
     <%
     ShoppingCart cart =(ShoppingCart)session.getAttribute("cart");
     if(cart==null||cart.isEmpty()){
     %>
     <div class="container text-center">
     <h2 class="text-center">購物車是空的!</h2>
     <a href="<%=request.getContextPath()%>/index.jsp">返回首頁</a>
     </div>
     
     <%}else{%>

     <div class="container">
     	<h1 class="text-center">購物明細</h1>
     	<form action="<%=request.getContextPath()%>/member/update_cart.do" method="POST">
		 <table class="table table-hover">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">名稱</th>
			      <th scope="col">大小</th>
			      <th scope="col">口味</th>
			      <th scope="col">定價</th>
			      <th scope="col">折扣</th>
			      <th scope="col">售價</th>
			      <th scope="col">數量</th>
			      <th scope="col">小記</th>
				  <th scope="col">刪除</th>
			    </tr>
			  </thead>
			  <tbody>
			  <%for(CartItem item:cart.getCartItemSet()){ 
			  		Product p = item.getProduct();
			  		Size size = item.getSize();
			  		String spicy = item.getSpicy();
			  		int qty = cart.getQuantity(item);
			  		int stock = size!=null?size.getStock():p.getStock();
			  		%>
			    <tr>
			      <th scope="row"></th>
			      <td><img src="/blackcake/<%=p.getPhotoUrl()%>"><%=p.getName() %> <span>庫存剩餘:<%=stock%></span></td>
			      <td><%=size!=null?size.getName():"" %></td>
			      <td><%=spicy %></td>
			      <td><%=p instanceof Outlet?((Outlet)p).getListPrice():p.getUnitPrice() %></td>
			      <td><%=p instanceof Outlet?((Outlet)p).getDiscountString():""%></td>
			      <td><%=p.getUnitPrice() %></td>
			      <td><input type="number" name="quantity<%=item.hashCode()%>" value="<%=qty%>" required min="<%=stock>0?1:0%>" max="<%=stock>10?10:stock%>"></td>
			      <td><%=p.getUnitPrice()*qty %></td>
			      <td><input type="checkbox" name="delete<%=item.hashCode()%>" class=""></td>
			    </tr>
			    <% } %>
			  </tbody>
				  <tfoot>
				  	<tr>
				  		<td>
				  			<select name="paymentType"></select>
				  			<select name="shippingType">
				  				<option value="超商取貨">超商取貨</option>
				  				<option value="門市取貨">門市付款</option>
				  				<option value="送貨到府">送貨到府</option>
				  			</select>	
				  			
				  		</td>
				  	</tr>
				  	<tr>
					  <td colspan="7">
					  	<fieldset>
					  		<legend>收件人</legend>
					  		<label for="name">姓名</label>
					  		<input placeholder="姓名" name="name" id="name">
					  		<label for="phone">電話</label>
					  		<input placeholder="電話" name="phone" id="phone">
					  		<label for="email">Email</label>
					  		<input placeholder="Email" name="email" id="email">
					  		<label for="address">收件地址</label>
					  		<input placeholder="地址" name="address" id="address">
					  	</fieldset>
					  </td>
				  	</tr>
				  <tr>
				  <td colspan="7">
				  <td><%=cart.size()+"項"+"共"+cart.getTotalQuantity()+"件" %></td>
				  <td>總金額: <%=cart.getTotalAmount() %>元</td>
				  <td><button type="submit" class="btn btn-primary btn-lg">結帳</button></td>
				  </tr>
				  </tfoot>
			</table>
			
				<div class="btn-group" role="group" aria-label="Basic example">
				  <button type="button" class="btn btn-primary btn-lg" onclick="goBackShop()">繼續購物</button>
				  <input type="submit" class="btn btn-primary btn-lg" value="修改購物車">
				  <button type="button" class="btn btn-primary btn-lg">查詢庫存</button>
				</div>
			
<!-- 			<button type="button" class="btn btn-primary btn-lg" onclick="goBackShop()">繼續購物</button> -->
<!-- 			<input type="submit" class="btn btn-primary btn-lg" value="修改購物車"> -->
<!-- 			<button type="button" class="btn btn-primary btn-lg">查詢庫存</button> -->
			
		</form>
		<%} %>
	</div>

  

	
    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
        integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
        integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
        crossorigin="anonymous"></script>
     <script>
                $(function () {
                    $(document).scroll(
                        function () {
                            var $nav = $("#mainNavbar");
                            $nav.toggleClass("scrolled", $(this).scrollTop() > $nav
                                .height());
                        })
                })
     </script>
</body>

</html>