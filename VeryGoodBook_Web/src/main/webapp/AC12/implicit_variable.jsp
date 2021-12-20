<%@page import="java.util.Random"%>
<%@ page pageEncoding="UTF-8" isErrorPage="true" autoFlush="false"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
	p {
	font-weight: bold;
	font-size: larger;
}
</style>
<title>隱含變數</title>
</head>
<body>
 <h2>隱含變數(Implicit variables)</h2>
 <a href="#response">response</a>|<a href="#out">out</a>|<a href="#session">session</a>
	<h3>request</h3>
	<% 
	String method=request.getMethod(); 
	%>
	<p>請求方式<%=method %> </p>
	<p>request.getURI():<%=request.getRequestURL() %> </p>
	<p>request.getURL():<%=request.getRequestURI() %> </p>
	<p>request.getProtocol():<%=request.getProtocol() %> </p>
	<p>(Server)getLocalName():<%=request.getLocalName()%></p>
	<p>(Server)getLocalAddr():<%=request.getLocalAddr()%></p>
	<p>(Server)getLocalPort():<%=request.getLocalPort()%></p>
	
	<% out.flush();//for test
	Thread.sleep(new Random().nextInt(2000)+1000);//for test
	%>
	
	<p>getContextPath():<%=request.getContextPath()%></p>
	<p>rgetQueryString():<%=request.getQueryString()%></p>
	<p>getHeader("user-agent"):<%=request.getHeader("user-agent")%></p>
	<p>getHeader("accept-language")<%=request.getHeader("accept-language")%></p>

	<p>(Clint)request.getRemoteHost():<%=request.getRemoteHost()%></p>
	<p>(Clint)request.getRemoteAddr():<%=request.getRemoteAddr()%></p>
	<p>(Clint)request.getRemotePort():<%=request.getRemotePort()%></p>
	<form action="#testForm" method="POST" id="testForm">
		<fieldset>
			<legend>POST Form Data</legend>
			
			<input name="id" placeholder="請輸入ID" required>
			<input type="submit">
		</fieldset>
	</form>
	<p>getParameter("id"): <%=request.getParameter("id") %></p>
	<hr>
	<h3 id="response">response</h3>
	<p>getContentType(): <%=response.getContentType() %></p>
	<p>getBufferSize(): <%=response.getBufferSize() %></p>
	<hr>
	<h3 id="out">out</h3>
	<p>getBufferSize(): <%out.print(response.getBufferSize());%>
	<hr>
	<h3 id="session">session</h3>
	<p>session.getId(): <%= session.getId() %></p>
	<hr>
	<h3 id="application">applicaton</h3>
	<p>getContextPath:<%=application.getContextPath() %> </p>
	<p>getRealPath:<%=application.getRealPath("/") %> </p>
	<hr>
	<h3 id="config">config</h3>
	<p>this.getServletName :<%=this.getServletName() %> </p>
	<p>config.getServletName :<%=config.getServletName() %> </p>
	<hr>
	<h3 id="pageContext">pageContext</h3>
	<p>ContextPath: <%= ((HttpServletRequest)pageContext.getRequest()).getContextPath() %> </p>
	<p>ContextPtah: <%= request.getContextPath() %> </p>
	<p>Config.Servlet Name: <%=pageContext.getServletConfig().getServletName() %> </p>
	<p>Config.Servlet Name: <%=config.getServletName() %> </p>
	<hr>
	<h3 id="page">pageContext</h3>
	<p>this.getServletName: <%=this.getServletName()  %> </p>
	<%! int i =200; %>
	<% int i =20; %>
	<p>this.i <%= this.i %> </p>
	<p>i: <%=i %> </p>
	<p>this==page: <%=this==page %> </p>
	<hr>
	</p>
	<%= ""%>
	<hr>
	<p>exception:<%=exception %></p>
</body>
</html>