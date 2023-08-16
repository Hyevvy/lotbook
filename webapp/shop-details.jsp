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
								<li class="active">
			                        <a href="/lotbook/signin.jsp"><i class="fa fa-user"></i> 마이페이지</a>
			                    </li>
		                        <li class="">
		                            <a href="/lotbook/signup.jsp"><i class="fa fa-user"></i> 로그아웃</a>
		                        </li>
							</c:when>
							<c:otherwise>
								<li class="active">
		                            <a href="main.bit?view=signin"><i class="fa fa-user"></i> 로그인</a>
		                        </li>
		                        <li class="">
		                            <a href="main.bit?view=signup"><i class="fa fa-user"></i> 회원가입</a>
		                        </li>
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
                            <li class="active"><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="main.bit?view=shop-details">Shop Details</a></li>
                                    <li><a href="main.bit?view=shoping-cart">Shoping Cart</a></li>
                                    <li><a href="main.bit?view=checkout">Check Out</a></li>
                                    
                                </ul>
                            </li>
                            <li ><a href="main.bit?view=contact" onclick=li_click(3)>Contact</a></li>
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
                            <i class="fa fa-bars"></i>
                            <span>All departments</span>
                        </div>
                        <ul>
                            <li><a href="#">Fresh Meat</a></li>
                            <li><a href="#">Vegetables</a></li>
                            <li><a href="#">Fruit & Nut Gifts</a></li>
                            <li><a href="#">Fresh Berries</a></li>
                            <li><a href="#">Ocean Foods</a></li>
                            <li><a href="#">Butter & Eggs</a></li>
                            <li><a href="#">Fastfood</a></li>
                            <li><a href="#">Fresh Onion</a></li>
                            <li><a href="#">Papayaya & Crisps</a></li>
                            <li><a href="#">Oatmeal</a></li>
                            <li><a href="#">Fresh Bananas</a></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="hero__search">
                        <div class="hero__search__form">
                            <form action="#">
                                <div class="hero__search__categories">
                                    통합 검색
                                </div>
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
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>상품명</h2>
                        <div class="breadcrumb__option">
                            <a href="./index.jsp">Home</a>
                            <a href="./index.jsp">대분류</a>
                            <a href="./index.jsp">중분류</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Product Details Section Begin -->
    <section class="product-details spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__pic">
                        <div class="product__details__pic__item">
                            <img class="product__details__pic__item--large"
                                src="img/product/details/product-details-1.jpg" alt="">
                        </div>
                      
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="product__details__text">
                        <h3>상품명</h3>
                        <div class="product__details__rating">
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star"></i>
                            <i class="fa fa-star-half-o"></i>
                            <span>(18 개의 리뷰)</span>
                        </div>
                        <div class="product__details__price">상품 가격(5천원)</div>
                        <p>,"중고등학생도, 비전공자도, 직장인도 프로그래밍에 눈뜨게 만든 바로 그 책이 전면 개정 2판으로 새롭게 태어났다! 챗GPT를 시작으로 펼쳐진 생성 AI 시대에 맞춰 설명과 예제를 다듬고, 최신 경향과 심화 내용을 보충했다. 또한 이번 개정 2판도 50만 코딩 유튜버인 조코딩과 협업을 통해 유튜브 동영상을 제공해 파이썬을 더 쉽게 공부할 수 있다. 8년 연속 베스트셀러! 위키독스 누적 방문 300만! 독자의 입에서 입으로 전해진 추천과 수많은 대학 및 학원의 교재 채택을 통해 검증은 이미 끝났다. 코딩을 처음 배우는 중고등학생부터 코딩 소양을 기르려는 비전공자, 자기계발에 진심인 직장인까지! 이 책과 함께 파이썬 프로그래밍의 세계로 ‘점프’해 보자!".</p>
                        <div class="product__details__quantity">
                            <div class="quantity">
                                <div class="pro-qty">
                                    <input type="text" value="1">
                                </div>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">ADD TO CARD</a>
                        <ul>
                            <li><b>구매가능 여부</b> <span>{ 구매가능? "구매가능" : "품절"}</span></li>
                            <li><b>작가</b> <span>작가 이름</span></li>
                            <li><b>출판사</b> <span>출판사 이름</span></li>
                            <li><b>포인트 적립율</b> <span>5%</span></li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="product__details__tab">
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab"
                                    aria-selected="true">상세 설명</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab"
                                    aria-selected="false">리뷰 <span>(리뷰개수)</span></a>
                            </li>
                        </ul>
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>상세 설명</h6>
                                    <p>"중고등학생도, 비전공자도, 직장인도 프로그래밍에 눈뜨게 만든 바로 그 책이 전면 개정 2판으로 새롭게 태어났다! 챗GPT를 시작으로 펼쳐진 생성 AI 시대에 맞춰 설명과 예제를 다듬고, 최신 경향과 심화 내용을 보충했다. 또한 이번 개정 2판도 50만 코딩 유튜버인 조코딩과 협업을 통해 유튜브 동영상을 제공해 파이썬을 더 쉽게 공부할 수 있다. 8년 연속 베스트셀러! 위키독스 누적 방문 300만! 독자의 입에서 입으로 전해진 추천과 수많은 대학 및 학원의 교재 채택을 통해 검증은 이미 끝났다. 코딩을 처음 배우는 중고등학생부터 코딩 소양을 기르려는 비전공자, 자기계발에 진심인 직장인까지! 이 책과 함께 파이썬 프로그래밍의 세계로 ‘점프’해 보자!"</p>
                                </div>
                            </div>
                            <div class="tab-pane" id="tabs-2" role="tabpanel">
                                <div class="product__details__tab__desc">
                                    <h6>리뷰</h6>
                                    <p>Vestibulum ac diam sit amet quam vehicula elementum sed sit amet dui.
                                        Pellentesque in ipsum id orci porta dapibus. Proin eget tortor risus.
                                        Vivamus suscipit tortor eget felis porttitor volutpat. Vestibulum ac diam
                                        sit amet quam vehicula elementum sed sit amet dui. Donec rutrum congue leo
                                        eget malesuada. Vivamus suscipit tortor eget felis porttitor volutpat.
                                        Curabitur arcu erat, accumsan id imperdiet et, porttitor at sem. Praesent
                                        sapien massa, convallis a pellentesque nec, egestas non nisi. Vestibulum ac
                                        diam sit amet quam vehicula elementum sed sit amet dui. Vestibulum ante
                                        ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;
                                        Donec velit neque, auctor sit amet aliquam vel, ullamcorper sit amet ligula.
                                        Proin eget tortor risus.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Details Section End -->
