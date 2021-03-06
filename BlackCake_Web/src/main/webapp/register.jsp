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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Google Font -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+TC&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">


<!-- Custom CSS -->
<link rel="stylesheet" href="css/registerCss.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/app.css">
<style>
#captchaImg {
	height: 40px;
	width: 130;
	max-width: 400px;
	/*     maintain aspect ratio */
}

.container {
	margin-top: 4vh;
}
</style>

<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
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
			<%if ("POST".equals(request.getMethod())) {%>
            $("input[name='email']").val('<%=request.getParameter("email")%>');
            $("input[name='password']").val('<%=request.getParameter("password")%>');
            $("input[name='passwordCheck']").val('<%=request.getParameter("passwordCheck")%>');
            $("input[name='name']").val('<%=request.getParameter("name")%>');
            $("input[name='phone']").val('<%=request.getParameter("phone")%>');
            $("input[name='id']").val('<%=request.getParameter("id")%>');
            $("input[name='birthday']").val('<%=request.getParameter("birthday")%>');
            $("input[name='address']").val('<%=request.getParameter("address")%>');
            $("input[name='subscribed']").prop('checked', <%=request.getParameter("subscribed") != null%>);
            $("select[name='gender']").val('<%=request.getParameter("gender")%>
	');
<%}%>
	}
</script>
<title>??????</title>
</head>

<body>
	<jsp:include page="subviews/navbar.jsp" />
	<div class="container">
		<div id="formBackground">
			<%
			List<String> errors = (List<String>) request.getAttribute("errors");
			%>
			<div class="container">
				<%
				if (errors != null && errors.size() > 0) {
					for (int i = 0; i < errors.size(); i++) {
						String msg = (String) errors.get(i);
				%>
				<div class="alert alert-danger text-center" role="alert">
					<h4><%=msg%>!
					</h4>
				</div>
				<%
				}
				}
				%>
				<div class="registerForm">
					<form method="post" action="register.do"
						class="col-10 col-md-10 col-lg-9 mr-auto ml-auto">
						<%--                       <p><%=errors!=null?errors:"" %> </p> --%>
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
								<label for="email">Email</label> <input type="email"
									class="form-control shadow" id="email" placeholder="Email"
									name="email" required>
							</div>
							<div class="form-group col-md-4">
								<label for="password">??????Password</label> <input type="password"
									class="form-control shadow" id="password"
									placeholder="Password" name="password"
									maxlength="<%=Customer.MAX_PWD_LENGTH%>"
									minlength="<%=Customer.MIN_PWD_LENGTH%>" required>
							</div>
							<div class="form-group col-md-4">
								<label for="passwordCheck">????????????</label> <input type="password"
									class="form-control shadow" id="passwordCheck"
									placeholder="PasswordCheck" name="passwordCheck" required>
							</div>
						</div>
						<div class="form-row justify-content-center">
							<div class="form-group col-md-4">
								<label for="name">??????</label> <input type="text"
									class="form-control shadow" id="name" placeholder="??????????????????"
									name="name" required>
							</div>
							<div class="form-group col-md-4">
								<div class="input-group-prepend">
									<label for="gender">??????Gender</label>
								</div>
								<select id="gender" class="form-control shadow gender"
									name="gender" required>
									<option value="">??????</option>
									<option value="M">???(Male)</option>
									<option value="F">???(Female)</option>
									<option value="O">??????(Other)</option>
								</select>
							</div>
							<div class="form-group col-md-4">
								<label for="phone">??????</label> <input type="tel"
									class="form-control shadow" id="phone" placeholder="??????????????????"
									name="phone" required>
							</div>
						</div>
						<div class="form-row justify-content-center">
							<div class="form-group col-md-4">
								<label for="id">???????????????</label> <input type="text"
									class="form-control shadow" id="id" placeholder="?????????????????????"
									name="id" pattern="[A-Z][1289][0-9]{8}" required>
							</div>
							<div class="form-group col-md-4">
								<label for="birthday">??????/??????</label> <input type="date"
									class="form-control shadow" id="birthday"
									placeholder="1990-11-25" name="birthday" required>
							</div>
							<div class="form-group col-md-4">
								<label for="address">??????Address</label> <input type="text"
									class="form-control shadow" id="address" placeholder="??????????????????"
									name="address" required>
							</div>

						</div>
						<div class="form-row justify-content-center">
							<div class="form-group col-md-4 ">
								<br> <input type="text" class="form-control shadow"
									name="captcha" placeholder="????????????????????????" required>
							</div>
							<div class="form-group col-md-4 text-center mt-auto mb-auto pr-0">
								<img id="captchaImg" src="imgs/reg_captcha.jpg" alt="???????????????"
									class="border shadow rounded" style="vertical-align: bottom;">
								<img src="" alt=""> <a class="text-start"
									id="reCaptchaImg" href="javascript:refreshCaptcha()"> <i
									class="fa fa-refresh fa-2x" aria-hidden="true"></i>
								</a>
							</div>
							<div class="form-group col-md-4">
								<br>
							</div>
						</div>
						<div class="custom-control custom-checkbox form-group row">
							<div class="form-check" id="subscribed">
								<input class="custom-control-input" type="checkbox"
									id="isSubscribed" name="subscribed"> <label
									class="custom-control-label" for="isSubscribed">???????????????</label>
							</div>
						</div>
						<div class="form-row justify-content-center mr-3 mb-4">
							<!--                     <div class="row col-md-9 justify-content-end"> -->
							<!--                         <button type="submit" class="btn btn-primary" id="submitRegister"><span>??????</span></button> -->
							<!--                     </div> -->
						</div>
						<div class="row col-md-12 ml-3 justify-content-end">
							<button type="submit" class="btn btn-dark" id="submitRegister">
								<span>??????</span>
							</button>
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


		<script>
			$(function() {
				$(document).scroll(
						function() {
							var $nav = $("#mainNavbar");
							$nav.toggleClass("scrolled",
									$(this).scrollTop() > $nav.height());
						})
			})
		</script>
</body>

</html>