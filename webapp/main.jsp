<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">


<!-- <script>
    window.onload = function() {
        $.ajax({
            type: 'GET',
            url: './product',
            dataType: 'json', 
            success: function(result) {
                //console.log(result);        
                },
            error: function(jqXHR, textStatus, errorThrown) {
                console.log("에러 발생: " + textStatus, errorThrown);
            }
        });
    };
</script> -->



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


<section class="latest-product spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>따끈따끈 신상</h4>
                    <div class="latest-product__slider owl-carousel" id="latest-products-carousel-1">
                        <!-- Dynamic content will be added here -->
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>포인트 팡팡</h4>
                    <div class="latest-product__slider owl-carousel" id="latest-products-carousel-2">
                        <!-- Dynamic content will be added here -->
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-md-6">
                <div class="latest-product__text">
                    <h4>사장님이 미쳤어요</h4>
                    <div class="latest-product__slider owl-carousel" id="latest-products-carousel-3">
                        <!-- Dynamic content will be added here -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
<script>
jQuery(document).ready(function() {
    jQuery.ajax({
        type: 'GET',
        url: './product?type=latest', // Replace with your actual API endpoint
        dataType: 'json',
        contentType: "application/json",
        success: function(result) {
        	console.log("최신책:", result)
            var carouselContainer1 = $('#latest-products-carousel-1');
            var carouselContainer2 = $('#latest-products-carousel-2');
            var carouselContainer3 = $('#latest-products-carousel-3');

            result.forEach(function(item, index) {
                var itemContainer = $('<div class="latest-prdouct__slider__item"></div>');
                var itemLink = $('<a href="' + item.productImgurl + '" class="latest-product__item"></a>');
                var imgContainer = $('<div class="latest-product__item__pic"></div>');
                var img = $('<img src="' + item.productImgurl + '" alt="' + item.name + '">');
                var textContainer = $('<div class="latest-product__item__text"></div>');
                var itemName = $('<h6>' + item.name + '</h6>');
                var itemPrice = $('<span>$' + item.price + '</span>');

                // Construct the item structure
                imgContainer.append(img);
                textContainer.append(itemName);
                textContainer.append(itemPrice);
                itemLink.append(imgContainer);
                itemLink.append(textContainer);
                itemContainer.append(itemLink);

               
                carouselContainer1.append(itemContainer);
                
                    //carouselContainer2.append(itemContainer);
                
                    //carouselContainer3.append(itemContainer);
                
            });
            
            

            // Initialize owl carousel for each slider
            carouselContainer1.owlCarousel({
                loop: true,
                margin: 10,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    }
                }
            });

            carouselContainer2.owlCarousel({
                loop: true,
                margin: 10,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    }
                }
            });

            carouselContainer3.owlCarousel({
                loop: true,
                margin: 10,
                responsive: {
                    0: {
                        items: 1
                    },
                    600: {
                        items: 2
                    },
                    1000: {
                        items: 3
                    }
                }
            });
        },
        error: function(jqXHR, textStatus, errorThrown) {
            console.log("에러 발생: " + textStatus, errorThrown);
        }
    });
    jQuery.ajax({
        type: 'GET',
        url: './product?type=point', // Replace with your actual API endpoint
        dataType: 'json',
        contentType: "application/json",
        success: function(result) {
            var carouselContainer1 = $('#latest-products-carousel-1');
            var carouselContainer2 = $('#latest-products-carousel-2');
            var carouselContainer3 = $('#latest-products-carousel-3');

            result.forEach(function(item, index) {
                var itemContainer = $('<div class="latest-prdouct__slider__item"></div>');
                var itemLink = $('<a href="' + item.productImgurl + '" class="latest-product__item"></a>');
                var imgContainer = $('<div class="latest-product__item__pic"></div>');
                var img = $('<img src="' + item.productImgurl + '" alt="' + item.name + '">');
                var textContainer = $('<div class="latest-product__item__text"></div>');
                var itemName = $('<h6>' + item.name + '</h6>');
                var itemPrice = $('<span>$' + item.price + '</span>');

                // Construct the item structure
                imgContainer.append(img);
                textContainer.append(itemName);
                textContainer.append(itemPrice);
                itemLink.append(imgContainer);
                itemLink.append(textContainer);
                itemContainer.append(itemLink);

               
                //carouselContainer1.append(itemContainer);
                
                    carouselContainer2.append(itemContainer);
                
                    //carouselContainer3.append(itemContainer);
                
            });           
        }});
    jQuery.ajax({
        type: 'GET',
        url: './product?type=discount', // Replace with your actual API endpoint
        dataType: 'json',
        contentType: "application/json",
        success: function(result) {
            var carouselContainer1 = $('#latest-products-carousel-1');
            var carouselContainer2 = $('#latest-products-carousel-2');
            var carouselContainer3 = $('#latest-products-carousel-3');

            result.forEach(function(item, index) {
                var itemContainer = $('<div class="latest-prdouct__slider__item"></div>');
                var itemLink = $('<a href="' + item.productImgurl + '" class="latest-product__item"></a>');
                var imgContainer = $('<div class="latest-product__item__pic"></div>');
                var img = $('<img src="' + item.productImgurl + '" alt="' + item.name + '">');
                var textContainer = $('<div class="latest-product__item__text"></div>');
                var itemName = $('<h6>' + item.name + '</h6>');
                var itemPrice = $('<span>$' + item.price + '</span>');

                // Construct the item structure
                imgContainer.append(img);
                textContainer.append(itemName);
                textContainer.append(itemPrice);
                itemLink.append(imgContainer);
                itemLink.append(textContainer);
                itemContainer.append(itemLink);
				
                carouselContainer3.append(itemContainer);
                
            });           
        }});
});
</script>



<!-- Blog Section Begin -->
<section class="from-blog spad"></section>
<!-- Blog Section End -->
