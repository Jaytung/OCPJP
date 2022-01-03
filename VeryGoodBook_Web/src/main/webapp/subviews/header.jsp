<%@page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!--header.jsp start-->
        <%Customer member = (Customer)session.getAttribute("member");%>
 <nav id="mainNavbar" class="navbar navbar-light navbar-expand-md py-0 fixed-top rounded-down">
    <a href=" #" class="navbar-brand">鮮記</a>
    <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks" arir-label="Toggle navigation">
      <span class="navbar-toggler-icon">
      </span>
    </button>
    <div class="collapse navbar-collapse" id="navLinks">
      <ul class="navbar-nav mr-auto">
        <li class="nav-item">
          <a href='<%=request.getContextPath() %>/index.jsp' class="nav-link">首頁</a>
        </li>
        <li class="nav-item dropdown">
          <a href='<%=request.getContextPath() %>/shoplist.jsp' class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
          商品
          </a>
          <form>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          	<a class="nav-link" href="<%=request.getContextPath()%>/shoplist.jsp?category=糕點">糕點類</a>
          	<div class="dropdown-divider"></div>
          	<a class="nav-link" href="<%=request.getContextPath()%>/shoplist.jsp?category=罐醬">罐醬類</a>
          	<div class="dropdown-divider"></div>
          	<a class="nav-link" href="#">海鮮類</a>
          </div>
          </form>
        </li>
        <li class="nav-item">
          <a href="" class="nav-link">關於</a>
        </li>
      </ul>

      <ul class="navbar-nav ">
      <!-- 尚未登入 -->
      <%if(member==null) {%>
       <li class="nav-item dropdown">
       	<span class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
       會員
       	</span>
       		<div class="dropdown-menu" aria-labelledby="navbarDropdown">
          		<a class="nav-link" href='<%=request.getContextPath() %>/register.jsp'>註冊</a>
          		<a class="nav-link" href='<%=request.getContextPath() %>/login.jsp'>登入</a>
        	</div>
       </li>
        <%}else{ %>
        <!-- 已登入 -->
        <% if(member!=null){%>
 		 <span class="nav-link" id="loginName"> <%=member!=null?member.getName():""%> 你好</span>
 		<%} %>
        <li class="nav-item dropdown">
       	 <span class="nav-link dropdown-toggle" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false">
       		會員中心
       	 </span>
       	 <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        	<a class="nav-link" href="<%=request.getContextPath()%>/history.jsp">歷史訂單</a>
        	<a class="nav-link" href="<%=request.getContextPath()%>/update_check.jsp">會員修改</a>
        	<a class="nav-link" href="<%=request.getContextPath()%>/logout.do">登出</a>
         </div>
        </li>
        <%} %>
      </ul>
      <form class="form-inline my-2 my-lg-0" action='shoplist.jsp' method="get">
	  <input type="search" name="keyword" placeholder="SEARCH" class="form-control mr-sm-2" value="${param.keyword}">
	  <button class="btn btn-outline-dark my-2 my-sm-0" type="submit">搜尋</button>
	  </form>
    </div>
  </nav>
<!--header.jsp end-->