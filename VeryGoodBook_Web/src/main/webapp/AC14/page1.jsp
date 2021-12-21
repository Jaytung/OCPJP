<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>page1</title>
</head>
<body>
	<H1>Page1</H1>
<%-- 	<%RequestDispatcher d = request.getRequestDispatcher("page2.jsp"); --%>
// 	d.forward(request, response);//產生response控制權完全轉交給page2
<%-- 	%> --%>
	<jsp:forward page="page2.jsp"/>
</body>
</html>