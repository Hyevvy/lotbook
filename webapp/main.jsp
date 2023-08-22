<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>
    window.onload = function() {
        $.ajax({
            type: 'GET',
            url: './product',
            dataType: 'json', // 받아올 데이터의 타입 (JSON)
            success: function(result) {
                var latestProductSlider = document.querySelector('.latest-product__slider');
                var latestProductSliderItem = '';
                
                for (var i = 0; i < result.length; i++) {
                    latestProductSliderItem +=
                        `<div class="latest-prdouct__slider__item">
                            <a href="#" class="latest-product__item">
                                <div class="latest-product__item__pic">
                                    <img src="${result[i].productImgurl}" alt="${result[i].name}">
                                </div>
                                <div class="latest-product__item__text">
                                    <h6>${result[i].name}</h6>
                                    <span>$${result[i].price.toFixed(2)}</span>
                                </div>
                            </a>
                        </div>`;
                }

                latestProductSlider.innerHTML = latestProductSliderItem;
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("에러 발생: " + textStatus, errorThrown);
            }
        });
    };
</script>



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
					<a href="./index.jsp"><img src="img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul id="header__menus">
						<li class="active"><a href="./index.jsp">Home</a></li>
						<li><a href="main.bit?view=shop-grid">Shop</a></li>
						<li><a href="#">Pages</a>
							<ul class="header__menu__dropdown">
								<li><a href="main.bit?view=shop-details">Shop Details</a></li>
								<li><a href="main.bit?view=shoping-cart">Shoping Cart</a></li>
								<li><a href="main.bit?view=checkout">Check Out</a></li>

							</ul></li>
						<li><a href="main.bit?view=contact" onclick=li_click(3)>Contact</a></li>
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
		<div class="humberger__open">
			<i class="fa fa-bars"></i>
		</div>
	</div>
</header>
<!-- Header Section End -->
<!-- Hero Section Begin -->
<section class="hero">
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
				<div>
					<img class="hero__item" src="img/banner.png">
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Hero Section End -->

<!-- Featured Section Begin -->
<section class="featured spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="section-title">
					<h2>스테디 셀러</h2>
				</div>
				<div class="featured__controls">
					<ul>
						<li data-filter="*">전체</li>
					</ul>
				</div>
			</div>
		</div>
		<!-- Categories Section Begin -->
		<section class="categories">
			<div class="container">
				<div class="row">
					<div class="categories__slider owl-carousel">
						<div class="col-lg-3">
							<div class="categories__item set-bg"
								data-setbg="img/categories/cat-1.jpg">
								<h5>
									<a href="#">Fresh Fruit</a>
								</h5>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="categories__item set-bg"
								data-setbg="img/categories/cat-2.jpg">
								<h5>
									<a href="#">Dried Fruit</a>
								</h5>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="categories__item set-bg"
								data-setbg="img/categories/cat-3.jpg">
								<h5>
									<a href="#">Vegetables</a>
								</h5>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="categories__item set-bg"
								data-setbg="img/categories/cat-4.jpg">
								<h5>
									<a href="#">drink fruits</a>
								</h5>
							</div>
						</div>
						<div class="col-lg-3">
							<div class="categories__item set-bg"
								data-setbg="img/categories/cat-5.jpg">
								<h5>
									<a href="#">drink fruits</a>
								</h5>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!-- Categories Section End -->
	</div>
</section>
<!-- Featured Section End -->

<!-- Banner Begin -->
<div class="banner">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img src="img/banner/banner01.jpg" style="max-height: 100%" alt="">
				</div>
			</div>
			<div class="col-lg-6 col-md-6 col-sm-6">
				<div class="banner__pic">
					<img src="img/banner/banner02.jpg" alt="">
				</div>
			</div>
		</div>
	</div>
</div>
<!-- Banner End -->

<!-- Latest Product Section Begin -->
<section class="latest-product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>오늘의 신상</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-1.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-2.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-3.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-1.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-2.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-3.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>오늘의 선택</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-1.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-2.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-3.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-1.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-2.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-3.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col-lg-4 col-md-6">
				<div class="latest-product__text">
					<h4>특가 상품</h4>
					<div class="latest-product__slider owl-carousel">
						<div class="latest-prdouct__slider__item">
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-1.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-2.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-3.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
						</div>
						<div class="latest-prdouct__slider__item">
							<a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-1.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-2.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a> <a href="#" class="latest-product__item">
								<div class="latest-product__item__pic">
									<img src="img/latest-product/lp-3.jpg" alt="">
								</div>
								<div class="latest-product__item__text">
									<h6>Crab Pool Security</h6>
									<span>$30.00</span>
								</div>
							</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Latest Product Section End -->

<!-- Blog Section Begin -->
<section class="from-blog spad"></section>
<!-- Blog Section End -->
