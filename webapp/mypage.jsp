<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<!-- Header Section Begin -->
	<header class="header">
		<div class="header__top">
			<div class="container">
				<nav class="header__menu header__top__right mobile-menu">
					<ul>
						<li class="active"><a href="#"><i class="fa fa-user"></i>
								마이페이지</a></li>
						<li class=""><a href="#"><i class="fa fa-user"></i> 로그아웃</a>
						</li>
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
							<li><a href="main.bit?view=shop-grid">Shop</a></li>
							<li><a href="#">Pages</a>
								<ul class="header__menu__dropdown">
									<li><a href="main.bit?view=shop-details">Shop Details</a></li>
									<li><a href="main.bit?view=shoping-cart">Shoping Cart</a></li>
									<li><a href="main.bit?view=checkout">Check Out</a></li>

								</ul></li>
							<li><a href="main.bit?view=contact">Contact</a></li>
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

	<!-- Hero Section Begin -->
	<section class="hero hero-normal">
		<div class="container">
			<div class="row">
				<div class="col-lg-3">
					<div class="hero__categories">
						<div class="hero__categories__all">
							<i class="fa fa-bars"></i> <span>카테고리</span>
						</div>
						<ul>
							<li value="1"><a href="#" class="font-weight-bold">컴퓨터 /
									IT</a>
							<li value="2"><a href="#" style="text-indent: 20px">컴퓨터
									공학</a>
							<li value="3"><a href="#" style="text-indent: 20px">데이터베이스</a>
							<li value="4"><a href="#" style="text-indent: 20px">네트워크</a>
							<li value="5"><a href="#" style="text-indent: 20px">프로그래밍</a>
							<li value="6"><a href="#" class="font-weight-bold">소설</a></li>
							<li value="7"><a href="#" style="text-indent: 20px">한국소설</a>
							<li value="8"><a href="#" style="text-indent: 20px">영미소설</a>
							<li value="9"><a href="#" style="text-indent: 20px">일본소설</a>
							<li value="10"><a href="#" class="font-weight-bold">경제 /
									경영</a></li>
							<li value="11"><a href="#" style="text-indent: 20px">경영일반</a>
							<li value="12"><a href="#" style="text-indent: 20px">재테크/금융</a>
							<li value="13"><a href="#" style="text-indent: 20px">유통/창업</a>
							<li value="14"><a href="#" style="text-indent: 20px">세무/회계</a>
						</ul>
					</div>
				</div>
				<div class="col-lg-9">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="#">
								<div class="hero__search__categories">통합 검색</div>
								<input type="text" placeholder="검색어를 입력해주세요">
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
						<h2>마이페이지</h2>
						<div class="breadcrumb__option">
							<a href="./index.jsp">Home</a> <span>mypage</span>
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
			<div class="row checkout__order">
				<div class="col-sm-6 ">
					<p>독서하기 좋은 날이네요!</p>
					<h4>사용자 이름 님</h4>
				</div>
				<div class="col-sm-6">
					<p>포인트</p>
					<h4>315P</h4>
				</div>
				<button type="submit" class="site-btn">회원 정보 수정</button>
			</div>
		</div>
	</section>
	<!-- Profile Section End -->
	<!-- Cart Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
            </div>
            <div class="checkout__form">
                <h4>장바구니</h4>
                <div class="card mb-3">
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div class="d-flex flex-row align-items-center">
                        <div>
                          <img
                            src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                            class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                        </div>
                        <div class="ml-3">
                          <h5>Iphone 11 pro</h5>
                          <p class="small mb-0">256GB, Navy Blue</p>
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center">
                        <div style="width: 50px;">
                          <h5 class="fw-normal mb-0">2</h5>
                        </div>
                        <div style="width: 100px;">
                          <h5 class="mb-0">900,000원</h5>
                        </div>
                        <a href="#!" style="color: #cecece;">삭제</a>
                      </div>
                    </div>
                  </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Cart Section End -->
   <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
            </div>
            <div class="checkout__form">
                <h4>주문 내역</h4>
                <div class="card mb-3 border-0">
                  <h6 class="bg-light text-danger border-top border-danger m-0">배송 준비중</h6>
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div class="d-flex flex-row align-items-center">
                        <div>
                          <img
                            src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                            class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                        </div>
                        <div class="ml-3">
                          <h5>Iphone 11 pro</h5>
                          <p class="small mb-0">256GB, Navy Blue</p>
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center">
                        <div style="width: 50px;">
                          <h5 class="fw-normal mb-0">2</h5>
                        </div>
                        <div style="width: 100px;">
                          <h5 class="mb-0">900,000원</h5>
                        </div>
                      </div>
                    </div>
                  </div>
                  <button type="submit" class="site-btn mx-1 bg-danger text-white border-0 rounded-sm">주문 취소</button>
                </div>
                <div class="card mb-3 border-0">
                  <h6 class="bg-light text-danger border-top border-danger m-0">배송중</h6>
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div class="d-flex flex-row align-items-center">
                        <div>
                          <img
                            src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                            class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                        </div>
                        <div class="ml-3">
                          <h5>Iphone 11 pro</h5>
                          <p class="small mb-0">256GB, Navy Blue</p>
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center">
                        <div style="width: 50px;">
                          <h5 class="fw-normal mb-0">2</h5>
                        </div>
                        <div style="width: 100px;">
                          <h5 class="mb-0">900,000원</h5>
                        </div>
                      </div>
                    </div>
                  </div>
                  <button type="submit" class="site-btn mx-1 bg-danger text-white border-0 rounded-sm">주문 취소</button>
                </div>
                <div class="card mb-3 border-0">
                  <h6 class="bg-light text-danger border-top border-danger m-0">배송 완료</h6>
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div class="d-flex flex-row align-items-center">
                        <div>
                          <img
                            src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                            class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                        </div>
                        <div class="ml-3">
                          <h5>Iphone 11 pro</h5>
                          <p class="small mb-0">256GB, Navy Blue</p>
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center">
                        <div style="width: 50px;">
                          <h5 class="fw-normal mb-0">2</h5>
                        </div>
                        <div style="width: 100px;">
                          <h5 class="mb-0">900,000원</h5>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row mx-1">
                  	<button type="submit" class="py-2 col-sm-6 bg-secondary text-white border-0 rounded-sm">환불 요청</button>
                    <button type="submit" class="py-2 col-sm-6 bg-danger text-white border-0 rounded-sm">주문 확정</button>
                  </div>
                  
                </div>
                <div class="card mb-3 border-0">
                  <h6 class="bg-light text-danger border-top border-danger m-0">주문 확정 완료</h6>
                  <div class="card-body">
                    <div class="d-flex justify-content-between">
                      <div class="d-flex flex-row align-items-center">
                        <div>
                          <img
                            src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-shopping-carts/img1.webp"
                            class="img-fluid rounded-3" alt="Shopping item" style="width: 65px;">
                        </div>
                        <div class="ml-3">
                          <h5>Iphone 11 pro</h5>
                          <p class="small mb-0">256GB, Navy Blue</p>
                        </div>
                      </div>
                      <div class="d-flex flex-row align-items-center">
                        <div style="width: 50px;">
                          <h5 class="fw-normal mb-0">2</h5>
                        </div>
                        <div style="width: 100px;">
                          <h5 class="mb-0">900,000원</h5>
                        </div>
                      </div>
                    </div>
                  </div>
                  <button type="submit" class="site-btn mx-1 bg-danger text-white border-0 rounded-sm">리뷰 작성하기</button>
                </div>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
    <!-- Review Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="row">
            </div>
            <div class="checkout__form">
                <h4>작성 가능한 리뷰</h4>
                주문 확정 목록
            </div>
        </div>
    </section>
    <!-- Review Section End -->