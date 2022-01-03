<%@page import="java.util.List"%>
<%@ page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/app.css">
    <style>
    body{
    margin-top: 12vh;
    }
    </style>
    <script>
    $(document).ready(init);
    
    function init() {
            repopulationForm();
    }
    function repopulationForm() {
		<%if("POST".equals(request.getMethod())){ %>
        // alert("post");
        $("value[name='email']").val('<%= request.getParameter("email")%>');
        $("value[name='password']").val('<%= request.getParameter("password")%>');
        $("value[name='passwordCheck']").val('<%= request.getParameter("passwordCheck")%>');
        $("value[name='name']").val('<%= request.getParameter("name")%>');
        $("value[name='gender']").prop('selected',<%= request.getParameter("gender")%>);
        
        // $(".gender[value='<%= request.getParameter("gender")%>']").prop('selected',true);
        $("value[name='phone']").val('<%= request.getParameter("phone")%>');
        $("value[name='id']").val('<%= request.getParameter("id")%>');
        $("value[name='birthday']").val('<%= request.getParameter("birthday")%>');
        $("value[name='address']").val('<%= request.getParameter("address")%>');
        $("value[name='subscribed']").prop('checked',<%= request.getParameter("subscribed")%>);
        <%}%>
    }
    </script>
    
<title>修改會員資料</title>
</head>
<body>
 <%Customer member = (Customer)session.getAttribute("member");%>
	<% 
    List<String> errors = (List<String>)request.getAttribute("errors");
    %>
	<jsp:include page="/subviews/header.jsp" />
	<div class="container">
     <div id="formBackground">
        <div class="registerForm">
            <form method="post" action="update.do" class="col-10 col-md-10 col-lg-9 mr-auto ml-auto">
                      <p><%=errors!=null?errors:"" %> </p>
                     <ul class="errors">
<%--             <% if(errors!=null&&errors.size()!=0){           	 --%>
<!--             	 for(int i =0;i<errors.size();i++){  -->
<!--             	 String msg = (String)errors.get(i); -->
<!--             %> -->
<%--             	<li><%=msg %></li> --%>
            
<%--             	<%} --%>
<!--              }%> -->

            </ul>
                <div class="form-row firstForm justify-content-center">
                    <div class="form-group  col-md-4">
                        <label for="email">Email</label>
                        <input type="email" class="form-control shadow" id="email" placeholder="Email" name="email"
                           value="<%=member!=null?member.getEmail():"" %>" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="password">密碼Password</label>
                        <input type="password" class="form-control shadow" id="password" placeholder="輸入您的密碼"
                           	   name="password"  maxlength="<%=Customer.MAX_PWD_LENGTH%>" minlength="<%=Customer.MIN_PWD_LENGTH %>" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="passwordCheck">確認密碼</label>
                        <input type="password" class="form-control shadow" id="passwordCheck" placeholder="確認您的密碼"
                         	   name="passwordCheck" value="" required>
                    </div>
                </div>
                <div class="form-row justify-content-center">
                    <div class="form-group col-md-4">
                        <label for="name">姓名</label>
                        <input type="text" class="form-control shadow" id="name" placeholder="輸入您的姓名" name="name"
                            value="<%=member!=null?member.getName():"" %>" required>
                    </div>
                    <div class="form-group col-md-4">
                        <div class="input-group-prepend">
                            <label for="gender">性別Gender</label>
                        </div>
                        <select id="gender" class="form-control shadow" name="gender" value="<%=member!=null?member.getGender():"" %>" required>
                            <option value="">選擇</option>
                            <option value="M">男(Male)</option>
                            <option value="F">女(Female)</option>
                            <option value="O">其他(Other)</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="phone">電話</label>
                        <input type="tel" class="form-control shadow" id="phone" placeholder="請輸入電話" name="phone"
                        value="<%=member!=null?member.getPhone():"" %>" name="phone"  required>
                    </div>
                </div>
                <div class="form-row justify-content-center">
                    <div class="form-group col-md-4">
                        <label for="id">身分證字號</label>
                        <label value="<%=member!=null?member.getId():"" %>"></label>
                        <input type="text" class="form-control shadow" id="id" placeholder="輸入您的身分證" name="id"
                               value="<%=member!=null?member.getId():"" %>" pattern="[A-Z][1289][0-9]{8}" required readonly>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="birthday">生日/西元</label>
                        <input type="date" class="form-control shadow" id="birthday" placeholder="eg:1990-11-25"
                               name="birthday" value="<%=member!=null?member.getBirthday():"" %>" required>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="address">地址Address</label>
                        <input type="text" class="form-control shadow" id="address" placeholder="輸入您的地址" name="address"
                               value="<%=member!=null?member.getAddress():"" %>" required>
                    </div>

                </div>
                <div class="form-row justify-content-end mr-3 mb-4">
                    <div class="row col-md-12 justify-content-end">
                        <button type="submit" class="btn btn-primary" id="submitRegister"><span>確認</span></button>
                    </div>
                </div>
            </form>
        </div>
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