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
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="app.css">
    <link rel="stylesheet" href="shoplist.css">
    <style>
    </style>
       <script>
        $(function () {
            $(document).scroll(function () {
                var $nav = $("#mainNavbar");
                $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
            })
        })
    </script>
    <title>商品清單</title>
</head>

<body>
 	<jsp:include page="/subviews/header.jsp">
 	<jsp:param value="shopList" name="shophead"/>
 	</jsp:include>
    <br>
    <br>
    <div class="header">
        <h1 class="text-center">商品清單</h1>
    </div>
    <div class="productList row col-12 justify-content-center">
        <%
        ProductService pService=new ProductService(); 
        List<Product>list = pService.getAllProducts();
        if(list!=null&&list.size()>0){
        %>
       
        <ul class="row text-center">
           <%for(int i =0;i<list.size();i++){
        	  Product p = list.get(i);
        	%>
            <li class="col-md-6 col-lg-4" id=" 1">
                <img src='<%=p.getPhotoUrl() %>' class="img-fluid rounded" alt="">
                <h2><%=p.getName() %></h2>
                <span><%=p.getUnitPrice() %></span>
                <br>
                <button type="button" class="btn btn-primary addToCart">加到購物車</button>                
            </li>
                <%} %>
         	</ul>
         	<% }else{ %>
            <p>查無此產品</p>
			<% } %>
<!--             <li class="col-md-6 col-lg-4 " id=" 2"> -->
<!--                 <img src="raw imgs/XO醬商品01.jpg" class="img-fluid rounded" alt=""> -->
<!--                 <h2>A產品</h2> -->
<!--                 <span>$200</span> -->
<!--                 <br> -->
<!--                 <button type="button" class="btn btn-primary addToCart">加到購物車</button> -->
<!--             </li> -->
<!--             <li class="col-md-6 col-lg-4" id=" 3"> -->
<!--                 <img src="raw imgs/XO醬商品01.jpg" class="img-fluid rounded" alt=""> -->
<!--                 <h2>A產品</h2> -->
<!--                 <span>$200</span> -->
<!--                 <br> -->
<!--                 <button type="button" class="btn btn-primary addToCart">加到購物車</button> -->
<!--             </li> -->
<!--             <li class="col-md-6 col-lg-4" id=" 4"> -->
<!--                 <img src="raw imgs/XO醬商品01.jpg" class="img-fluid rounded" alt=""> -->
<!--                 <h2>A產品</h2> -->
<!--                 <span>$200</span> -->
<!--                 <br> -->
<!--                 <button type="button" class="btn btn-primary addToCart">加到購物車</button> -->
<!--             </li> -->
<!--             <li class="col-md-6 col-lg-4" id=" 5"> -->
<!--                 <img src="raw imgs/XO醬商品01.jpg" class="img-fluid rounded" alt=""> -->
<!--                 <h2>A產品</h2> -->
<!--                 <span>$200</span> -->
<!--                 <br> -->
<!--                 <button type="button" class="btn btn-primary addToCart">加到購物車</button> -->
<!--             </li> -->
<!--             <li class="col-md-6 col-lg-4" id=" 6"> -->
<!--                 <img src="raw imgs/XO醬商品01.jpg" class="img-fluid rounded" alt=""> -->
<!--                 <h2>A產品</h2> -->
<!--                 <span>$200</span> -->
<!--                 <br> -->
<!--                 <button type="button" class="btn btn-primary addToCart">加到購物車</button> -->
<!--             </li> -->
<!--             <li class="col-md-6 col-lg-4" id=" 7"> -->
<!--                 <img src="raw imgs/XO醬商品01.jpg" class="img-fluid rounded" alt=""> -->
<!--                 <h2>A產品</h2> -->
<!--                 <span>$200</span> -->
<!--                 <br> -->
<!--                 <button type="button" class="btn btn-primary addToCart">加到購物車</button> -->
<!--             </li> -->
<!--             <li class="col-md-6 col-lg-4" id=" 8"> -->
<!--                 <img src="raw imgs/XO醬商品01.jpg" class="img-fluid rounded" alt=""> -->
<!--                 <h2>A產品</h2> -->
<!--                 <span>$200</span> -->
<!--                 <br> -->
<!--                 <button type="button" class="btn btn-primary addToCart">加到購物車</button> -->
<!--             </li> -->
<!--             <li class="col-md-6 col-lg-4" id=" 9"> -->
<!--                 <img src="raw imgs/XO醬商品01.jpg" class="img-fluid rounded" alt=""> -->
<!--                 <h2>A產品</h2> -->
<!--                 <span>$200</span> -->
<!--                 <br> -->
<!--                 <button type="button" class="btn btn-primary addToCart">加到購物車</button> -->
<!--             </li>          -->
<!--         </ul> -->
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
            $(document).scroll(function () {
                var $nav = $("#mainNavbar");
                $nav.toggleClass("scrolled", $(this).scrollTop() > $nav.height());
            })
        })
    </script>
</body>

</html>