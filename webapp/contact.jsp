<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header Section Begin -->
<header class="header">
	<div class="header__top">
		<div class="container">
			<nav class="header__menu header__top__right mobile-menu"
				style="padding: 5px 0">
				<ul>
					<c:choose>
						<c:when test="${logincust != null }">
							<li class="active"><a href="main.bit?view=mypage&memberSeq=${logincust.sequence }"><i
									class="fa fa-user"></i> 마이페이지</a></li>
							<li class=""><a href="member.bit?view=logout"><i
									class="fa fa-user"></i> 로그아웃</a></li>
						</c:when>
						<c:otherwise>
							<li class="active"><a href="main.bit?view=signin"><i
									class="fa fa-user"></i> 로그인</a></li>
							<li class=""><a href="main.bit?view=signup"><i
									class="fa fa-user"></i> 회원가입</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</nav>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="header__logo">
					<a href="main.bit"><img src="img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul id="header__menus" >
						<li><a href="main.bit"  style="font-size: 20px; font-weight: 700;">홈</a></li>
						<li><a href="category.bit?view=1"  style="font-size: 20px; font-weight: 700;">도서 전체</a></li>
						<li  class="active"><a href="main.bit?view=contact"  style="font-size: 20px; font-weight: 700;">고객센터</a></li>
					</ul>
				</nav>
			</div>
			<c:choose>
				<c:when test="${logincust != null }">
					<div class="col-lg-3">
						<div class="header__cart">
							<ul>
								<li><a href="main.bit?view=shopping-cart&memberSeq=${logincust.sequence }"><i class="fa fa-shopping-bag"></i> <span>${cartCount }</span></a></li>
							</ul>
						</div>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</header>

<script>
AOS.init({
	easing: 'ease-out-back',
	duration: 1000
	});
</script>

<!-- Header Section End -->
<!-- Hero Section Begin -->
<section class="hero hero-normal">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
				<div class="hero__categories">
					<div class="hero__categories__all">
						<i class="fa fa-bars"></i> <span>카테고리</span>
					</div>
					<jsp:include page="common_categories.jsp" />
				</div>
			</div>
			<div class="col-lg-9">
				<div class="hero__search">
					<div class="hero__search__form">
						<form action="#"
							onsubmit="event.preventDefault(); search(document.getElementById('keyword').value);">
							<div class="hero__search__categories">통합 검색</div>
							<input type="text" id="keyword" placeholder="검색어를 입력해주세요">
							<button type="submit" class="site-btn">검색</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Hero Section End -->

<!-- Breadcrumb Section Begin -->
<section class="breadcrumb-section set-bg"
	data-setbg="img/books.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>Contact Us</h2>
					<div class="breadcrumb__option">
						<a href="./index.jsp">Home</a> <span>Contact Us</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Contact Section Begin -->
<section class="contact spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-3 col-sm-6 text-center" data-aos="fade-up">
				<div class="contact__widget">
					<span class="icon_phone"></span>
					<h4>연락처</h4>
					<p>02-3486-1234</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-6 text-center" data-aos="fade-up">
				<div class="contact__widget">
					<span class="icon_pin_alt"></span>
					<h4>주소</h4>
					<p>서초구 서초대로74길 33</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-6 text-center" data-aos="fade-up">
				<div class="contact__widget">
					<span class="icon_clock_alt"></span>
					<h4>영업시간</h4>
					<p>오전 10:00 - 오후 23:00</p>
				</div>
			</div>
			<div class="col-lg-3 col-md-3 col-sm-6 text-center" data-aos="fade-up">
				<div class="contact__widget">
					<span class="icon_mail_alt"></span>
					<h4>이메일</h4>
					<p>lotbook@gmail.com</p>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Contact Section End -->

<!-- Map Begin -->
<div class="map">
	<iframe
		src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3165.5638989327!2d127.02500447632708!3d37.49461632824809!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x357ca15aee7c32dd%3A0x8735b1d03d755d2c!2z7ISc7Jq47Yq567OE7IucIOyEnOy0iOq1rCDshJzstIjrjIDroZw3NOq4uCAzMw!5e0!3m2!1sko!2skr!4v1691731205115!5m2!1sko!2skr"
		width="600" height="450" style="border: 0;" allowfullscreen=""
		loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
	<div class="map-inside">
		<i class="icon_pin"></i>
		<div class="inside-widget">
			<h4>비트교육센터</h4>
			<ul>
				<li>연락처: 02-3486-1234</li>
				<li>주소: 서초구 서초대로74길 33</li>
			</ul>
		</div>
	</div>
</div>
<!-- Map End -->