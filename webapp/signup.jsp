<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <nav class="header__menu header__top__right mobile-menu" style="padding: 5px 0">
			        <ul>
			        <c:choose>
						<c:when test="${logincust != null }">
							<li class="active"><a href="main.bit?view=mypage"><i
									class="fa fa-user"></i> 마이페이지</a></li>
							<li class=""><a href="/lotbook/index.jsp"><i
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
                        <a href="./index.jsp"><img src="img/logo.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul id="header__menus">
                            <li><a href="./index.jsp">Home</a></li>
                            <li><a href="main.bit?view=shop-grid">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="main.bit?view=shop-details">Shop Details</a></li>
                                    <li><a href="main.bit?view=shoping-cart">Shoping Cart</a></li>
                                    <li><a href="main.bit?view=checkout">Check Out</a></li>
                                    
                                </ul>
                            </li>
                            <li><a href="main.bit?view=contact" onclick=li_click(3)>Contact</a></li>
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

