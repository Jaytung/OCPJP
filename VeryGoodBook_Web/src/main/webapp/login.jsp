<%@ page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

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
    <link rel="stylesheet" href="app.css">
    <style>
        .loginForm {
            margin-top: 18vh;
        }

        #captchaImg {
            height: 40px;
            width: 130;
            max-width: 400px;
            /* maintain aspect ratio */
        }
    </style>
    <script>
        function changePwdDisplay() {
            if (displayPwd.checked) {
                inputPassword.type = "text";
            } else {
                inputPassword.type = "password";
            }
        }
        function refreshCaptcha() {
            // alert("refresh Captcha");
            captchaImg.src = "imgs/captcha.jpg?test=" + parseInt(new Date().getTime() / 1000);
        }
    </script>
    <title>登入</title>
</head>

<body>
    <!-- style="background-color: #EED6C4; -->
    <nav id="mainNavbar" class="navbar navbar-light navbar-expand-md py-0 fixed-top">
        <a href="#" class="navbar-brand">CAKE</a>
        <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks" arir-label="Toggle navigation">
            <span class="navbar-toggler-icon">
            </span>
        </button>
        <div class="collapse navbar-collapse" id="navLinks">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a href="index.html" class="nav-link">首頁</a>
                </li>
                <li class="nav-item">
                    <a href="shoplist.html" class="nav-link">商品</a>
                </li>
                <li class="nav-item">
                    <a href="" class="nav-link">關於</a>
                </li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="register.html">註冊</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container">
    <article>
    <%
    List<String> errors = (List(String)).geAttribute("errors");
    %>
    </article>
        <form action="login.do" method="post" class="loginForm  col-md-7 ml-auto mr-auto  border rounded shadow">
            <p><%=erros!=null?errors:"" %> </p>
            <div class="form-row justify-content-center mt-3">
                <div class="form-group col-md-6 col-lg-5 ">
                    <label for="inputEmail"><span>帳號</span></label>
                    <input type="text" class="form-control shadow" id="inputEmail" placeholder="輸入Email或電話" name="email"
                        required>
                </div>
                <div class="form-group col-md-6 col-lg-5">
                    <label for="inputPassword"><span>密碼</span></label>
                    <input type="password" class="form-control shadow" id="inputPassword" placeholder="Password"
                        name="password" required>
                </div>
            </div>
            <div class="form-row justify-content-end">
                <div class="form-group col-md-6 col-lg-6">
                    <div class="custom-control custom-switch">
                        <input type="checkbox" class="custom-control-input" id="displayPwd"
                            onchange="changePwdDisplay()">
                        <label class="custom-control-label" for="displayPwd">顯示密碼</label>
                    </div>
                </div>
            </div>
            <div class="form-row justify-content-center">
                <div class="form-group col-md-6 col-lg-5 ">
                    <br>
                    <input type="text" class="form-control shadow" name="captcha" placeholder="依圖片輸入驗證碼" required>
                </div>
                <div class="form-group col-md-6 col-lg-5 text-start mt-auto mb-auto pr-auto">
                    <img id="captchaImg" src="imgs/captcha.jpg" alt="驗證碼圖片" class="border shadow rounded">
                    <img src="" alt="">
                    <a id="reCaptchaImg" href="javascript:refreshCaptcha()">
                        <i class="fa fa-refresh fa-2x" aria-hidden="true"></i>
                    </a>
                </div>
            </div>
            <br>
            <br>
            <br>
            <div class="form-row justify-content-center text-center">
                <div class="custom-control custom-checkbox form-group col-md-3">
                    <div class="form-check">
                        <input class="custom-control-input" type="checkbox" id="remberMe">
                        <label class="custom-control-label" for="remberMe">
                            記住帳號
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-row justify-content-center text-center">
                <div class=" custom-control custom-checkbox form-group col-md-3 ">
                    <div class="form-check">
                        <input class="custom-control-input" type="checkbox" id="keepLogin">
                        <label class="custom-control-label" for="keepLogin">
                            保持登入
                        </label>
                    </div>
                </div>
            </div>
            <div class="form-row justify-content-center mb-3">
                <div class="col-12 col-md-10 col-lg-8 col-xl-6">
                    <button type="submit" class="btn btn-lg btn-primary btn-block">登入</button>
                </div>
            </div>
        </form>
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
</body>

</html>