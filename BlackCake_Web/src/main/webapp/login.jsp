<%@page import="java.util.List"%>
<%@ page import="uuu.blackcake.entity.Customer"%>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css" />
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<!-- Font-Awesome CSS -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.css">
<style>
#captchaImg {
	height: 40px;
	width: 130;
	max-width: 400px;
}

.icon-div {
	position: relative;
	width: 200px;
}

#togglePassword {
	position: absolute;
	right: 15px;
	top: 40px;
}
</style>
<script>
	function refreshCaptcha() {
		// alert("refresh Captcha");
		captchaImg.src = "imgs/captcha.jpg?test="
				+ parseInt(new Date().getTime() / 1000);
	}
</script>
<title>登入</title>
</head>

<body>
	<!-- style="background-color: #EED6C4; -->
	<jsp:include page="subviews/navbar.jsp" />
	<%
	List<String> errors = (List<String>) request.getAttribute("errors");
	%>
	<%
	Customer member = (Customer) session.getAttribute("member");
	%>
	<div class="container">
		<%
		if (errors != null && errors.size() > 0) {
			for (int i = 0; i < errors.size(); i++) {
				String msg = (String) errors.get(i);
		%>

		<div class="alert alert-danger text-center" role="alert"><%=msg%>!
		</div>
		<%
		}
		}
		%>
		<form action="login.do" method="post"
			class="loginForm col-md-6 ml-auto mr-auto mb-auto border rounded shadow">
			<div class="form-row justify-content-center mt-3">
				<div class="form-group col-md-6 col-lg-5 ">
					<label for="inputAccount"><span>帳號</span></label> <input
						type="text" class="form-control shadow" id="inputAccount"
						name="account" placeholder="輸入Email或電話" required
						value="${(empty param.account)?(cookie.account.value):(param.account)}">
				</div>
				<div class="form-group col-md-6 col-lg-5">
					<label for="inputPassword"><span>密碼</span></label> <input
						type="password" class="form-control shadow" id="password"
						placeholder="請輸入密碼" name="password" required> <i
						class="bi bi-eye-slash" id="togglePassword"></i>
				</div>
			</div>
			<!-- 			<div class="form-row justify-content-end"> -->
			<!-- 				<div class="form-group col-md-6 col-lg-6"> -->
			<!-- 					<div class="custom-control custom-switch"> -->
			<!-- 						<input type="checkbox" class="custom-control-input" -->
			<!-- 							id="displayPwd" onchange="changePwdDisplay()"> <label -->
			<!-- 							class="custom-control-label" for="displayPwd">顯示密碼</label> -->
			<!-- 					</div> -->
			<!-- 				</div> -->
			<!-- 			</div> -->
			<div class="form-row justify-content-center">
				<div class="form-group col-md-6 col-lg-5 ">
					<br> <input type="text" class="form-control shadow"
						name="captcha" placeholder="依圖片輸入驗證碼" required>
				</div>
				<div
					class="form-group col-md-6 col-lg-5 text-center mt-auto mb-auto pr-auto">
					<img id="captchaImg" src="imgs/captcha.jpg" alt="驗證碼圖片"
						class="border shadow rounded" style="vertical-align: bottom;">
					<a id="reCaptchaImg" href="javascript:refreshCaptcha()"> <i
						class="fa fa-refresh fa-2x" aria-hidden="true"></i>
					</a>
				</div>
			</div>
			<br> <br> <br>
			<div class="form-row justify-content-center text-center">
				<div class="custom-control custom-checkbox form-group col-md-3">
					<div class="form-check">
						<input class="custom-control-input" type="checkbox" id="remberMe"
							name="remberMe" value="on" ${cookie.remberMe.value}> <label
							class="custom-control-label" for="remberMe"> 記住帳號 </label>
					</div>
				</div>
			</div>
			<div class="form-row justify-content-center mb-3">
				<div class="col-12 col-md-10 col-lg-8 col-xl-6">
					<button type="submit" class="btn btn-lg btn-dark btn-block">登入</button>
				</div>
			</div>
		</form>
	</div>


	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.min.js"
		integrity="sha384-VHvPCCyXqtD5DqJeNxl2dtTyhF78xXNXdkwX1CZeRusQfRKp+tA7hAShOK/B/fQ2"
		crossorigin="anonymous"></script>
	<script>
		const togglePassword = document.querySelector("#togglePassword");
		const password = document.querySelector("#password");

		togglePassword.addEventListener("click", function() {
			// toggle the type attribute
			const type = password.getAttribute("type") === "password" ? "text"
					: "password";
			password.setAttribute("type", type);

			// toggle the icon
			this.classList.toggle("bi-eye");
		});

		// prevent form submit
		const form = document.querySelector("form");
		form.addEventListener('submit', function(e) {
			e.preventDefault();
		});
	</script>
</body>

</html>