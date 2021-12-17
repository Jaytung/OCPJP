<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>AC12 scriptlet demo</title>
</head>
<body>
	<%int i = 9;
	%>
	<p>i:<%=i %></p>
	<%
	  if(i>=10){
	%>
	<p>i是一個>10得數字</p>
	<% }else{ %>
	<p>i是一個&lt;10得數字</p>
	<% } %>
</body>
</html>