<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>9X9</title>
<style type="text/css">
td{
border: 1px solid black;
}
</style>
</head>
<body>
<table>
		<%for(int i=1;i<=9;i++){ %>
		<th><%=i %>*<%=j%><%=j*i %></th>
		<%}%>
	<tr>
		<%for(int j=1;j<=9;i++){ %>
		<td><%=i%>*<%=j%>=<%=i*j %></td>
	<%}%>
	</tr>
</table>





<hr>

</body>
</html>