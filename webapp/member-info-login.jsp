<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header Section Begin -->
<%-- <script>
	<%=request.set(request.getAttribute("memberSeq"))%>
</script> --%>
<script>
	$(document).ready(function(){
		$('.form_ip_pw i').on('click',function(){
			$('input').toggleClass('active');
			if($('input').hasClass('active')){
				$(this).attr('class', "fa fa-eye fa-lg")
				.prev('input').attr('type', "text");
			}else{
				$(this).attr('class', "fa fa-eye-slash fa-lg")
				.prev('input').attr('type',"password");
			}
		});
	});
</script>
<header class="header">
	<div class="header__top">
		<div class="container">
			<nav class="header__menu header__top__right mobile-menu"
				style="padding: 5px 0">
				<ul>
					<c:choose>
						<c:when test="${logincust != null }">
							<li class="active"><a href="main.bit?view=mypage"><i
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
						<li><a href="main.bit?view=contact"  style="font-size: 20px; font-weight: 700;">고객센터</a></li>
					</ul>
				</nav>
			</div>
			<c:choose>
				<c:when test="${logincust != null }">
					<div class="col-lg-3">
						<div class="header__cart">
							<ul>
								<li><a href="#"><i class="fa fa-shopping-bag"></i> <span>3</span></a></li>
							</ul>
						</div>
					</div>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>
		</div>
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>
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
<section class="breadcrumb-section set-bg" data-setbg="img/books.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>회원정보</h2>
					<div class="breadcrumb__option">
						<a href="./index.jsp">Home</a> <span>member-info</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->
</br>
</br>
<!-- Profile Section Begin -->
<section class="checkout_spad">
	<div class="container">
		<h4>비밀번호 확인</h4>
		<p style="margin-top:10px;">안전한 개인정보보호를 위해 비밀번호를 입력해주세요.</p>
		<hr style="border: 1px solid black; margin:20px 0;">
			<div class="checkout__form">
			<form action="member.bit" method="post">
				<input type="hidden" name="view" value="updateinfo">
		
				<div class="col-lg-6">
					<div class="checkout__input">
						<p>
							현재 비밀번호<span>*</span>
						</p>
						<div class="form_ip_pw" style="position: relative;">
						    <input type="password" id="inputPw" name="password" required placeholder="비밀번호를 입력해주세요" style="padding-right: 40px;">
						    <i class="fa fa-eye-slash fa-lg" style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px; cursor: pointer; font-size: 22px;"></i>
						</div>
					</div>
				</div>
				<hr>
				<div style="margin: 0 auto; width:150px;">
					<button type="submit" class="site-btn auto-btn">로그인</button>				
				</div>
			</form>
			
			<div class="row"></div>
		</div>
	</div>
</section>
