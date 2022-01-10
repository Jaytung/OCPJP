<%@ page pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,300,400,700"
	rel="stylesheet">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">

<!-- Custom CSS -->
<link rel="stylesheet" href="app.css">
<style>
.container {
	margin-top: 8vh;
}

p {
	color: #483434;
	font-weight: 600;
	/* 	font-size: 1.1rem; */
	line-height: 2;
}
</style>
<title>澎湖名產</title>
</head>

<body>
	<jsp:include page="subviews/navbar.jsp" />
	<div class="container">
		<div class="row align-items-center">
			<div class="col-md-6">
				<h2 class="mb-5">
					<a href="index.jsp">首頁</a>/關於我們
				</h2>
				<p>
					「蒐集整座澎湖島的新鮮，從海底直送心底 」<br> <br>
					鮮計成立於民國100年，由老闆一手創設，已是澎湖當地知名名產老店<br> 店內販售各式名產，種類多樣、品牌眾多。<br>
					老闆抱著最美味最天然健康的堅持，<br> 所有的商品都經過嚴格挑選，為您做好品質把關，<br>
					是您購買澎湖名產的首選通路品牌!<br> 鮮記成為您「蒐集ㄧ整座澎湖島的新鮮」，<br>
					讓您吃的安心、吃的健康、吃的美味，「從海底直送心底 」
				</p>
				<p>
					門市地址:台北市松山區復興北路99號12樓至14樓 <br> 電話:06-9125-1565 <br>
					工廠地址:澎湖縣馬公市仁愛路42號 <br> 電話：02-2514-9191
				</p>
			</div>
			<div class="col-md-6 text-center">
				<h2>門市地圖</h2>
				<iframe
					src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1798.8924043925083!2d121.54352452198901!3d25.05278148187133!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3442abe7665bbd4f%3A0xd48843af978e0dff!2z5oGG6YC45pWZ6IKy6KiT57e05Lit5b-D!5e0!3m2!1szh-TW!2stw!4v1641715257479!5m2!1szh-TW!2stw"
					width="550" height="470" style="border: 0;" allowfullscreen=""
					loading="lazy"></iframe>
			</div>
		</div>
	</div>

	<%@ include file='subviews/footer.jsp'%>
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
						$nav.toggleClass("scrolled", $(this).scrollTop() > $nav
								.height());
					})
		})
	</script>

</body>

</html>