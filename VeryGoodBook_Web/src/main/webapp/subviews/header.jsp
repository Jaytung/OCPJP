<%@ page pageEncoding="UTF-8"%>
<!--header.jsp start-->
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
        <li class="nav-item">
          <a href='<%=request.getContextPath() %>/shoplist.jsp' class="nav-link">商品</a>
        </li>
        <li class="nav-item">
          <a href="" class="nav-link">關於</a>
        </li>
      </ul>
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" href='<%=request.getContextPath() %>/register.jsp'>註冊</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href='<%=request.getContextPath() %>/login.jsp'>登入</a>
        </li>
      </ul>
    </div>
  </nav>
<!--header.jsp end-->