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

    <!-- Custom CSS -->
    <link rel="stylesheet" href="app.css">
    
    <style>
    .container{
    margin-top: 10vh;
    }
    td>img{
    width: 100px;
    }
    
    </style>
    
    <script>
    </script>
    <title>購物車</title>
</head>

<body>
    <!-- style="background-color: #EED6C4; -->
	<jsp:include page="subviews/header.jsp" />
    <% 
    List<String> errors = (List<String>)request.getAttribute("errors"); 
    %>
     <%Customer member = (Customer)session.getAttribute("member");%>
     
     <div class="container">
     	<h1 class="text-center">購物明細</h1>
		 <table class="table table-hover">
			  <thead class="thead-dark">
			    <tr>
			      <th scope="col">#</th>
			      <th scope="col">名稱</th>
			      <th scope="col">口味</th>
			      <th scope="col">大小</th>
			      <th scope="col">定價</th>
			      <th scope="col">折扣</th>
			      <th scope="col">售價</th>
			      <th scope="col">數量</th>
			      <th scope="col">小記</th>
				  <th scope="col">刪除</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td><img src="imgs/黑糖糕.png"> 黑糖糕</td>
			      <td></td>
			      <td>大盒</td>
			      <td>200元</td>
			      <td>9折</td>
			      <td>180.0元</td>
			      <td>3盒</td>
			      <td>540元</td>
			      <td><input type="checkbox" name="delete"></td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>XO醬</td>
			      <td>大辣</td>
			      <td></td>
			      <td>500元</td>
			      <td></td>
			      <td>500.0元</td>
			      <td>1罐</td>
			      <td>500元</td>
			      <td><input type="checkbox" name="delete"></td>
			    </tr>
			    <tr>
			      <th scope="row">3</th>
			      <td>XO醬</td>
			      <td>小辣</td>
			      <td></td>
			      <td>500元</td>
			      <td></td>
			      <td>500.0元</td>
			      <td>1罐</td>
			      <td>500元</td>
			      <td><input type="checkbox" name="delete"></td>
			    </tr>
				  <tfoot>
				  <tr>
				  <td>
				  <td>
				  <td>
				  <td>
				  <td>
				  <td>
				  <td>
				  <td>
				  <td>共3項,5件</td>
				  <td>總金額:$1600</td>
				  </tfoot>
			  </tbody>
		</table>
			  <div class="d-flex justify-content-end">
			  <button type="button" class="btn btn-primary btn-lg">結帳</button>
			  </div>
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
</body>

</html>