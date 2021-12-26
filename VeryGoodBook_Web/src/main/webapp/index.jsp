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
section{
	margin-top: 5vh;
}
/*   body{ */
/*   	background-image: url("imgs/background\ logo.jpg"); */
/*   	background-repeat: round; */
/* 	background: */
/*   } */
/*  .row { */
/*      margin-right: 0px !important; */
/* } */
</style>
<title>澎湖名產</title>
</head>

<body>
	<jsp:include page="subviews/header.jsp" />
	<section class="container-fulid px-0">
		<div class="row align-items-center">
			<div class="col-lg-6">
				<div id="headingGroup" class="text-center d-none d-lg-block mt-5">
					<h1 class="display-2">
						澎湖<span>/</span>名產
					</h1>
					<h2>黑糖糕</h2>
					<h2>XO醬</h2>
					<h2>海味名產</h2>
				</div>
			</div>
			<div class="col-lg-6 photo rounded">
				<div id="carousel" class="carousel slide" data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#carousel" data-slide-to="0"
							class="active bg-dark"></li>
						<li data-target="#carousel" data-slide-to="1" class="bg-dark"></li>
						<li data-target="#carousel" data-slide-to="2" class="bg-dark"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active" data-interval="4000">
							<a href="#blackCake"> <img src="imgs/slide1.png"
								class="d-block w-100" alt="黑糖糕"></a>
						</div>
						<div class="carousel-item" data-interval="5000">
							<a href="#小管片"> <img src="imgs/slide2.png"
								class="d-block w-100" alt="小館片"></a>
						</div>
						<div class="carousel-item" data-interval="5000">
							<a href="#XO醬"> <img src="imgs/slide3.png"
								class="d-block w-100" alt="XO醬"></a>
						</div>
					</div>
					<button class="carousel-control-prev bg-dark col-1 rounded" type="button"
						data-target="#carousel" data-slide="prev">

						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</button>
					<button class="carousel-control-next bg-dark col-1  rounded" type="button"
						data-target="#carousel" data-slide="next">

						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</button>
				</div>
			</div>
		</div>
	</section>
	<section class="container-fluid px-0">
		<div class="row align-items-center content" id="blackCake">
			<div class="col-md-6 order-2 order-md-1">
				<img src="imgs/黑糖糕1000X1000.png" alt="" class="img-fluid rounded">
			</div>
			<div class="col-md-6 text-center order-1 order-md-2">
				<div class="row justify-content-center">
					<div class="col-10 mb-5 mb-md-0 partOne">
						<h2>黑糖糕</h2>
						<img src="imgs/lolli_icon.png" alt="" class="d-none d-lg-inline">
						<p class="lead">不添加防腐劑的澎湖黑糖糕！黑糖味又濃又Ｑ，真的是台灣島絕！對！找不到的美味，使用上等黑糖、麵粉製成，不僅黑糖原料本身及製作過程不添加香料、焦糖色素及防腐劑外，也不會添加提升黑糖糕Q彈的添加物。源利軒黑糖糕老店堅持讓顧客品嘗到最原始的好味道、好口感。</p>
					</div>
				</div>
			</div>
		</div>
		<div class="row align-items-center content">
			<div class="col-md-6 text-center">
				<div class="row justify-content-center">
					<div class="col-10 mb-5 mb-md-0 partOne">
						<h2>小管片</h2>
						<img src="imgs/lolli_icon.png" alt="" class="d-none d-lg-inline px-4 ">
						<p class="lead">澎湖七美小管片採用當地澎湖現撈小管製成每一片皆由一隻小管，經手工處理、曬乾、烘烤而成製作過程繁瑣但原料使用簡單，保留小管最原有的嚼勁與甜味是最道地最澎湖味的名產，澎湖人最愛！</p>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-lg-6" id="小管片">
				<img src="imgs/小管片1000X1000.png" alt="" class="img-fluid rounded">
			</div>
		</div>

		<div class="row align-items-center content">
			<div class="col-md-6 order-2 order-md-1" id="XO醬">
				<img src="imgs/干貝醬1000X1000.png" alt="" class="img-fluid rounded">
			</div>
			<div class="col-md-6 text-center order-1 order-md-2">
				<div class="row justify-content-center">
					<div class="col-10 mb-5 mb-md-0 partOne">
						<h2>海鮮XO醬</h2>
						<img src="imgs/lolli_icon.png" alt="" class="d-none d-lg-inline">
						<p class="lead">使用新鮮丁香、干貝、蝦米，是澎湖最經典暢銷的XO醬！除了適合拌麵、拌飯，料理時也能添加提味，百搭醬品！此款另售有小辣、中辣</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<br>
	<div class="container col-9">
		<div class="col-lg-12">
			<div class="col text-center">
				<p class="display-4">鮮記聯絡及位置</p>
				<br>
			</div>
		</div>
		<div class="row">
			<div class="col text-center">
				下列為鮮記食品之聯絡方式及位置，如您有任何關於本站購物相關問題，歡迎您與我們聯絡，我們將盡快回覆您，為您服務謝謝。</div>
		</div>
		<br> <br>
		<div class="row text-center">
			<div class="col-sm-12 col-md-6">
				<img src="imgs/logo.png" alt="logo"
					class="rounded mx-auto rounded d-inline-block">
				<ul class=" d-inline-block mt-2 mr-4">
					<li>鮮記食品門市</li>
					<li>門市地址:台北市松山區復興北路99號12樓至14樓</li>
					<li>電話:02-2514-9191</li>
				</ul>
			</div>
			<div class="col-sm-12 col-md-6">
				<img src="imgs/logo.png" alt="logo"
					class="rounded mx-auto rounded d-inline-block">
				<ul class="d-inline-block mt-2 mr-4">
					<li>鮮記食品工廠</li>
					<li>工廠地址:台北市松山區復興北路99號12樓至14樓</li>
					<li>電話:02-2514-9191</li>
				</ul>
			</div>
		</div>
	</div>
	<br>
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