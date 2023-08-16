<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<title>LOTBOOK | 회원가입</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/signup.css" type="text/css">
<link rel="icon" href="img/favicon.ico">
</head>
<body>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script defer src="js/signup.js"></script>
	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<nav class="header__menu header__top__right mobile-menu">
					<ul>
						<li class="active"><a href="/lotbook/signin.jsp"><i
								class="fa fa-user"></i> 로그인</a></li>
						<li class=""><a href="/lotbook/signup.jsp"><i
								class="fa fa-user"></i> 회원가입</a></li>
					</ul>
				</nav>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="header__logo">
						<a href="./index.jsp"><img src="img/logo.png" alt=""></a>
					</div>
				</div>
				<div class="col-lg-6">
					<nav class="header__menu">
						<ul>
							<li><a href="./index.jsp">Home</a></li>
							<li><a href="./shop-grid.jsp">Shop</a></li>
							<li class="active"><a href="#">Pages</a>
								<ul class="header__menu__dropdown">
									<li><a href="./shop-details.jsp">Shop Details</a></li>
									<li><a href="./shoping-cart.jsp">Shoping Cart</a></li>
									<li class="active"><a href="./checkout.jsp">Check Out</a></li>

								</ul></li>

							<li><a href="./contact.jsp">Contact</a></li>
						</ul>
					</nav>
				</div>
			</div>
			<div class="humberger__open">
				<i class="fa fa-bars"></i>
			</div>
		</div>
	</header>
	<!-- Header Section End -->
	<div class="hero__search">
		<div class="hero__search__form">
			<form action="#">
				<div class="hero__search__categories">이메일</div>
				<input type="email" placeholder="아이디를 입력해주세요.">
			</form>
		</div>
	</div>
	<div class="hero__search">
		<div class="hero__search__form">
			<form action="#">
				<div class="hero__search__categories">비밀번호</div>
				<input type="password" placeholder="비밀번호를 입력해주세요.">
			</form>
		</div>
	</div>


	<div class="hero__search">
		<div class="hero__search__form">
			<form action="#">
				<div class="hero__search__categories">닉네임</div>
				<input type="password" placeholder="멤버 이름을 입력해주세요.">
			</form>
		</div>
	</div>


	<div class="hero_search">
		<input type="text" id="sample6_postcode" placeholder="우편번호"> <input
			type="button" onclick="getAddress()" value="우편번호 찾기"><br>
		<input type="text" id="sample6_address" placeholder="주소"><br>
		<input type="text" id="sample6_detailAddress" placeholder="상세주소">
		<input type="text" id="sample6_extraAddress" placeholder="참고항목">

	</div>
</body>
</html>