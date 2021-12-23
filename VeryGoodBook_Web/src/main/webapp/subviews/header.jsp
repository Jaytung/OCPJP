<%@page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!--header.jsp start-->
        <%Customer member = (Customer)session.getAttribute("member");%>
 <nav id="mainNavbar" class="navbar navbar-light navbar-expand-md py-0 fixed-top rounded-down">
    <a href=" #" class="navbar-brand">鮮記</a>
	<% if(member!=null){%>
 		 <span class="nav-link" id="loginName"> <%=member!=null?member.getName():""%> 你好</span>
 		 <%} %>
    <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks" arir-label="Toggle navigation">
      <span class="navbar-toggler-icon">
      </span>
    </button>
    <div class="collapse navbar-collapse" id="navLinks">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a href='<%=request.getContextPath() %>/index.jsp' class="nav-link">首頁</a>
        </li>
        <li class="nav-item">
          <a href='<%=request.getContextPath() %>/shoplist.jsp' class="nav-link">商品</a>
        </li>
        <li class="nav-item">
          <a href="" class="nav-link">關於</a>
        </li>
      </ul>
      
      
      <ul class="navbar-nav">

      <!-- 尚未登入 -->
      <%if(member==null) {%>
        <li class="nav-item">
          <a class="nav-link" href='<%=request.getContextPath() %>/register.jsp'>註冊</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href='<%=request.getContextPath() %>/login.jsp'>登入</a>
        </li>
        <%}else{ %>
        <!-- 已登入 -->
        <li class = "nav-item">
        	<a class="nav-link" href="<%=request.getContextPath()%>/history.jsp">歷史訂單</a>
        </li>
        <li class = "nav-item">
        	<a class="nav-link" href="<%=request.getContextPath()%>/update.jsp">會員修改</a>
        </li>
        <li class = "nav-item">
        	<a class="nav-link" href="<%=request.getContextPath()%>/logout.do">登出</a>
        </li>
        <%} %>
      </ul>
    </div>
  </nav>
<!--header.jsp end-->