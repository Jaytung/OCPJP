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
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap" rel="stylesheet">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Custom CSS -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.css">
<style>
.container {
	margin-top: 12vh;
}

#updateCaptchaImg {
	margin-top: 28px;
}
</style>
<script src="https://code.jquery.com/jquery-3.0.0.js"
	integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
	crossorigin="anonymous"></script>
<script>
	function refreshCaptcha() {
// 	    alert("refresh Captcha");
	    captchaImg.src = "<%=request.getContextPath()%>"+"/imgs/reg_captcha.jpg?test=" + parseInt(new Date().getTime() / 1000);
	}
    $(document).ready(init);
    
    function init() {
            repopulationForm();
    }
    function repopulationForm() {
		<%if ("POST".equals(request.getMethod())) {%>
		//alert("POST");
		$("input[name='id']").val('<%=request.getParameter("id")%>');
		$("input[name='id']").val('${param.id}');
		$("input[name='name']").val('<%=request.getParameter("name")%>');
		$("input[name='password1']").val('<%=request.getParameter("password1")%>');
		$("input[name='password2']").val('<%=request.getParameter("password2")%>');
		$("input[name='email']").val('<%=request.getParameter("email")%>');
		$("input[name='birthday']").val('<%=request.getParameter("birthday")%>');
		$("textarea[name='address']").val('<%=request.getParameter("address")%>');
		$("select[name='gender']").val('<%=request.getParameter("gender")%>');
		$("input[name='phone']").val('<%=request.getParameter("phone")%>');					
		$("input[name='subscribed']").prop('checked', <%=request.getParameter("subscribed") != null%>);					
	<%} else {
Customer member = (Customer) session.getAttribute("member");
if (member != null) {%>
		$("input[name='id']").val('${sessionScope.member.id}');
		$("input[name='name']").val('<%=member.getName()%>');
		$("input[name='email']").val('<%=member.getEmail()%>');
		$("input[name='birthday']").val('<%=member.getBirthday()%>');
		$("input[name='address']").val('<%=member.getAddress()%>');
		$("input[name='phone']").val('<%=member.getPhone()%>');
		
		$("input[name='subscribed']").prop('checked',<%=member.isSubscribed()%>);
		$("select[name='gender']").val('${sessionScope.member.gender}');
		$("select[name='subscribed']").val('${sessionScope.member.subscribed}');
<%} else {%>
	alert('請先登入!');
<%}
}%>
	}
	function changePwdDisplay() {
		if (displayPwd.checked) {
			password.type = "text"
			password1.type = "text";
			password2.type = "text";
		} else {
			password.type = "text"
			password1.type = "password";
			password2.type = "password";
		}
	}
	function changePWD() {
	<%Customer member = (Customer) session.getAttribute("member");%>
		var changePWD1 = document.getElementById('changePWD1');
		var changePWD2 = document.getElementById('changePWD2');

		if(document.getElementById("changeMyPwd").checked){
			changePWD1.style.display='';
			changePWD2.style.display='';	
			$("input[name='password1']").val('');
			$("input[name='password2']").val('');
		}else{
			changePWD1.style.display='none';
			changePWD2.style.display='none';
			$("input[name='password1']").val('<%=member.getPassword()%>');
			$("input[name='password2']").val('<%=member.getPassword()%>');
		}
	}
</script>

<title>修改會員資料</title>
</head>
<body>
	<%
	member = (Customer) session.getAttribute("member");
	%>
	<%
	List<String> errors = (List<String>) request.getAttribute("errors");
	%>
	<jsp:include page="/subviews/navbar.jsp" />
	<div class="container">
		<div id="formBackground">
			<div class="registerForm">
				<form method="post" action="update.do"
					class="col-10 col-md-10 col-lg-9 mr-auto ml-auto">
					<p><%=errors != null ? errors : ""%>
					</p>
					<h2 class="text-center">修改會員資料</h2>
					<div class="form-row">
						<div class="form-group col-md-4">
							<!-- 							<input type="checkbox" value="變更密碼" id="changeMyPwd" onchange="changePWD()"> -->
							<label for="password">原密碼</label> <input type="password"
								id="password" name="password" class="form-control shadow"
								placeholder="輸入原有的密碼">
							<div class="custom-control custom-switch mt-2 mb-0 d-flex justify-content-end">
								<input type="checkbox" class="custom-control-input"
								 id="changeMyPwd" onchange="changePWD()">
								<label class="custom-control-label" for="changeMyPwd">更改密碼</label>
							</div>
						</div>
						<!-- 						<div class="form-group col-md-4 pt-5"> -->
						<!-- 							<div class="custom-control custom-switch"> -->
						<!-- 								<input type="checkbox" class="custom-control-input" -->
						<!-- 									id="displayPwd" onchange="changePwdDisplay()"> <label -->
						<!-- 									class="custom-control-label" for="displayPwd">顯示密碼</label> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
						<div class="form-group col-md-4" style="display: none"
							id="changePWD1">
							<label for="password1">新密碼</label> <input type="password"
								class="form-control shadow" id="password1" placeholder="輸入新的密碼"
								name="password1" maxlength="<%=Customer.MAX_PWD_LENGTH%>"
								value="<%=member.getPassword()%>" required>
						</div>
						<div class="form-group col-md-4" style="display: none"
							id="changePWD2">
							<label for="passwordCheck">確認密碼</label> <input type="password"
								class="form-control shadow" id="password2" placeholder="確認您的密碼"
								name="password2" value="<%=member.getPassword()%>" required>
						</div>
					</div>
					<div class="border pl-1 pr-1 mb-1">
						<div class="form-row">
							<div class="form-group col-md-4">
								<label for="id">身分證字號</label> <input type="text"
									class="form-control shadow" id="id" placeholder="輸入您的身分證"
									name="id" pattern="[A-Z][1289][0-9]{8}" required readonly>
							</div>
							<div class="form-group  col-md-4">
								<label for="email">Email</label> <input type="email"
									class="form-control shadow" id="email" placeholder="Email"
									name="email" required>
							</div>
							<div class="form-group col-md-4">
								<label for="phone">電話</label> <input type="tel"
									class="form-control shadow" id="phone" placeholder="請輸入電話"
									name="phone" name="phone" required>
							</div>
							<!-- 							<div class="form-group col-md-4"> -->
							<!-- 								<label for="password1">新密碼</label> <input type="password" -->
							<!-- 									class="form-control shadow" id="password1" placeholder="輸入新的密碼" -->
							<%-- 									name="password1" maxlength="<%=Customer.MAX_PWD_LENGTH%>" --%>
							<!-- 									required> -->
							<!-- 							</div> -->
							<!-- 							<div class="form-group col-md-4"> -->
							<!-- 								<label for="passwordCheck">確認密碼</label> <input type="password" -->
							<!-- 									class="form-control shadow" id="password2" placeholder="確認您的密碼" -->
							<!-- 									name="password2" required> -->
							<!-- 							</div> -->
							<div class="form-group col-md-4">
								<label for="name">姓名</label> <input type="text"
									class="form-control shadow" id="name" placeholder="輸入您的姓名"
									name="name" required>
							</div>

							<div class="form-group col-md-4">
								<div class="input-group-prepend">
									<label for="gender">性別Gender</label>
								</div>
								<select id="gender" class="form-control shadow" name="gender"
									required>
									<option value="">選擇...</option>
									<option value="M">男(Male)</option>
									<option value="F">女(Female)</option>
									<option value="O">其他(Other)</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label for="birthday">生日/西元</label> <input type="date"
									class="form-control shadow" id="birthday"
									placeholder="eg:1990-11-25" "
									name="birthday"
									required>
							</div>
							<div class="form-group col-md-4">
								<label for="address">地址Address</label> <input type="text"
									class="form-control shadow" id="address" placeholder="輸入您的地址"
									name="address" required>
							</div>
							<div class="form-group col-md-4">
								<div class="input-group-prepend">
									<label for="gender">是否訂閱電子報</label>
								</div>
								<select id="subscribed" class="form-control shadow isSubscribed"
									name="subscribed" required>
									<option>選擇...</option>
									<option value="true">是</option>
									<option value="false">否</option>
								</select>
							</div>
						</div>
						<div class="form-row">
							<div class="form-group col-md-4 ">
								<label>驗證碼:</label> <input type="text"
									class="form-control shadow" name="captcha"
									placeholder="依圖片輸入驗證碼" required>
							</div>
							<div id="updateCaptchaImg"
								class="form-group col-md-4 text-center pr-0">
								<img id="captchaImg"
									src="<%=request.getContextPath()%>/imgs/reg_captcha.jpg"
									alt="驗證碼圖片" class="border shadow rounded"
									style="vertical-align: bottom;"> <img src="" alt="">
								<a class="text-start" id="reCaptchaImg"
									href="javascript:refreshCaptcha()"> <i
									class="fa fa-refresh fa-2x" aria-hidden="true"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="form-row justify-content-end mr-3 mb-4">
						<div class="row col-md-12 justify-content-end">
							<button type="submit" class="btn btn-primary btn-lg"
								id="submitRegister">
								<span>確認</span>
							</button>
						</div>
					</div>
				</form>
			</div>
		</div>
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
	<script src="https://code.jquery.com/jquery-3.0.0.js"
		integrity="sha256-jrPLZ+8vDxt2FnE1zvZXCkCcebI/C8Dt5xyaQBjxQIo="
		crossorigin="anonymous"></script>


	<script>
		$(function() {
			$(document).scroll(
					function() {
						var $nav = $("#mainNavbar");
						$nav.toggleClass("scrolled", $(this).scrollTop() > $nav
								.height());
					})
		})
	</script>
</body>
</html>