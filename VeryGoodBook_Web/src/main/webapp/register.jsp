<%@page import="java.util.List"%>
<%@ page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
        integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">


    <!-- Custom CSS -->
    <link rel="stylesheet" href="app.css">
    <style>
        .form-control {
            margin-bottom: 10px;
        }

        .registerForm {
            margin: 10vh 0px;
        }

        .firstForm {
            margin-top: 4em;
        }

        form {
            background: #e0dedc;
            padding: 20px;
            border: 1px solid wheat;
            border-radius: 1%;
        }

        span {
            font-size: 1.4rem;
            font-weight: 500;
        }

        #subscribed {
            margin-left: 9vw;
        }

        #captchaImg {
            width: 160px;
            height: auto;
        }

        #reCaptchaImg {
            padding-left: 5px;
            align-self: flex-end
        }

        @media screen and (max-width: 769px) {
            #subscribed {
                margin-left: 0vw;
            }
        }
        
    </style>

    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
        crossorigin="anonymous"></script>
    <script>
        function refreshCaptcha() {
            // alert("refresh Captcha");
            captchaImg.src = "imgs/reg_captcha.jpg?test=" + parseInt(new Date().getTime() / 1000);
        }
        $(document).ready(init);
               
        function init() {
                repopulationForm();
        }
        function repopulationForm() {
			<%if("POST".equals(request.getMethod())){ %>
            // alert("post");
            $("input[name='email']").val('<%= request.getParameter("email")%>');
            $("input[name='password']").val('<%= request.getParameter("password")%>');
            $("input[name='passwordCheck']").val('<%= request.getParameter("passwordCheck")%>');
            $("input[name='name']").val('<%= request.getParameter("name")%>');
            $(".gender[value='<%= request.getParameter("gender")%>']").prop('checked',true);
            $("input[name='phone']").val('<%= request.getParameter("phone")%>');
            $("input[name='id']").val('<%= request.getParameter("id")%>');
            $("input[name='birthday']").val('<%= request.getParameter("birthday")%>');
            $("input[name='address']").val('<%= request.getParameter("address")%>');
            $("input[name='subscribed']").prop('checked',<%= request.getParameter("subscribed")%>);
            <%}%>
        }
        </script>
    <title>註冊</title>
</head>

<body>
    <nav id="mainNavbar" class="navbar navbar-light  navbar-expand-md py-0 fixed-top">
        <a href=" #" class="navbar-brand">CAKE</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks" arir-label="Toggle navigation">
            <span class="navbar-toggler-icon">
            </span>
        </button>
        <div class="collapse navbar-collapse" id="navLinks">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a href="index.jsp" class="nav-link">首頁</a>
                </li>
                <li class="nav-item">
                    <a href="shoplist.jsp" class="nav-link">商品</a>
                </li>
                <li class="nav-item">
                    <a href="" class="nav-link">關於</a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="login.jsp">登入</a>
                </li>
            </ul>
        </div>
    </nav>
    <% 
    List<String> errors = (List<String>)request.getAttribute("errors"); 
    %>
    <br>
    <div id="formBackground">
        <div class="registerForm">
            <form method="post" action="register.do" class="col-10 col-md-10 col-lg-9 mr-auto ml-auto">
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
                    <div class="form-group  col-md-3">
                        <label for="email">Email</label>
                        <input type="email" class="form-control shadow" id="email" placeholder="Email" name="email"
                            required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="password">密碼Password</label>
                        <input type="password" class="form-control shadow" id="password" placeholder="Password"
                            name="password"  maxlength="<%=Customer.MAX_PWD_LENGTH%>" minlength="<% %>" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="passwordCheck">確認密碼</label>
                        <input type="password" class="form-control shadow" id="passwordCheck"
                            placeholder="PasswordCheck" name="passwordCheck" required>
                    </div>
                </div>
                <div class="form-row justify-content-center">
                    <div class="form-group col-md-3">
                        <label for="name">姓名</label>
                        <input type="text" class="form-control shadow" id="name" placeholder="輸入您的姓名" name="name"
                            required>
                    </div>
                    <div class="form-group col-md-3">
                        <div class="input-group-prepend">
                            <label for="gender">性別Gender</label>
                        </div>
                        <select id="gender" class="form-control shadow" name="gender" required>
                            <option value="">選擇</option>
                            <option value="M">男(Male)</option>
                            <option value="F">女(Female)</option>
                            <option value="O">其他(Other)</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="phone">電話</label>
                        <input type="tel" class="form-control shadow" id="phone" placeholder="輸入您的電話" name="phone"
                            required>
                    </div>
                </div>
                <div class="form-row justify-content-center">
                    <div class="form-group col-md-3">
                        <label for="id">身分證字號</label>
                        <input type="text" class="form-control shadow" id="id" placeholder="輸入您的身分證" name="id"
                            pattern="[A-Z][1289][0-9]{8}" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="birthday">生日/西元</label>
                        <input type="date" class="form-control shadow" id="birthday" placeholder="1990-11-25"
                            name="birthday" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="address">地址Address</label>
                        <input type="text" class="form-control shadow" id="address" placeholder="輸入您的地址" name="address"
                            required>
                    </div>

                </div>
                <div class="form-row justify-content-center">
                    <div class="form-group col-md-3 ">
                        <br>
                        <input type="text" class="form-control shadow" name="captcha" placeholder="依圖片輸入驗證碼" required>
                    </div>
                    <div class="form-group col-md-3 text-start mt-auto mb-auto pr-auto">
                        <img id="captchaImg" src="imgs/reg_captcha.jpg" alt="驗證碼圖片" class="border shadow rounded">
                        <img src="" alt="">
                        <a id="reCaptchaImg" href="javascript:refreshCaptcha()">
                            <i class="fa fa-refresh fa-2x" aria-hidden="true"></i>
                        </a>
                    </div>
                    <div class="form-group col-md-3">
                        <br>
                    </div>
                </div>
                <div class="custom-control custom-checkbox form-group row">
                    <div class="form-check" id="subscribed">
                        <input class="custom-control-input" type="checkbox" id="isSubscribed" name="sibscribed">
                        <label class="custom-control-label" for="isSubscribed">訂閱電子報</label>
                    </div>
                </div>
                <div class="form-row justify-content-center mr-3 mb-4">
                    <div class="row col-md-9 justify-content-end">
                        <button type="submit" class="btn btn-primary" id="submitRegister"><span>註冊</span></button>
                    </div>
                </div>
            </form>
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