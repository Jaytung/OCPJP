<%@page import="uuu.blackcake.entity.Size"%>
<%@page import="uuu.blackcake.entity.Outlet"%>
<%@page import="uuu.blackcake.entity.Product"%>
<%@page import="uuu.blackcake.service.ProductService"%>
<%@ page pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <title>產品詳細</title>
        <script src="https://code.jquery.com/jquery-3.0.0.js" 
				integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo=" 
				crossorigin="anonymous"></script>
    </head>
	<jsp:include page="/subviews/navbar.jsp">
		<jsp:param value="產品明細" name="subheader"/>
		<jsp:param value="true" name="noNav"/>
	</jsp:include>
    <body >
   	<jsp:include page="/Product_ajax.jsp"></jsp:include>
    </body>

    </html>