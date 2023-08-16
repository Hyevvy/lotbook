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
<title>LOTBOOK | 로그인</title>

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
<link rel="icon" href="img/favicon.ico">
</head>
<body>
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
	
		<div class="checkout__form">
			<form action="#">
				<div class="row">
					<div class="col-lg-8 col-md-6 m-auto">

						<div class="col-lg-8">
							<div class="checkout__input m-auto">
								<p>
									아이디(이메일)<span>*</span>
								</p>
								<input type="email">
							</div>


						</div>
						<div class="col-lg-8">
							<div class="checkout__input m-auto">
								<p>
									비밀번호<span>*</span>
								</p>
								<input type="password" required>
							</div>
							<button type="submit" class="site-btn auto-btn">로그인</button>
						</div>
					</div>
				</div>
			</form>
		</div>
</body>
</html>