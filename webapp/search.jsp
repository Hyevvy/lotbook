<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ page
	import="app.dto.response.SearchResult, app.dto.mapper.SearchProductMapper, java.util.List"%>

<%
// ProductDetailWithReviews 객체 받아오기
SearchResult searchResult = (SearchResult) request.getAttribute("searchResult");
List<SearchProductMapper> searchedList = searchResult.getSearchList();
%>



<!-- Header Section Begin -->
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
						<li class="active"><a href="#">Pages</a>
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
					<h2>검색 결과</h2>
					<div class="breadcrumb__option">
						<a href="./index.jsp">Home</a> <span>Shopping Cart</span>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->

<section class="product spad">

	<div class="container mb-4">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<span>${searchResult.searchKeyword}</span>  
				<span>검색결과</span> 
				<span>${searchResult.count}</span>
				<span>건</span>
			</div>
			
			<div class="col-lg-3 col-md-5"  style="margin-left: auto; text-align: right;">${searchResult.orderBy} </div>
		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="sidebar">
					<div class="sidebar__item">
						<h4>전체 카테고리</h4>
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
					<div class="sidebar__item">
						<h4>Price</h4>
						<div class="price-range-wrap">
							<div
								class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"
								data-min="10" data-max="540">
								<div class="ui-slider-range ui-corner-all ui-widget-header"></div>
								<span tabindex="0"
									class="ui-slider-handle ui-corner-all ui-state-default"></span>
								<span tabindex="0"
									class="ui-slider-handle ui-corner-all ui-state-default"></span>
							</div>
							<div class="range-slider">
								<div class="price-input">
									<input type="text" id="minamount"> <input type="text"
										id="maxamount">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<!-- TODO:조건부로 검색결과 없다고 띄우기  -->
			
			<div class="col-lg-9">
				<div class="shoping__cart__table">
					<c:forEach var="item" items="${searchResult.searchList}">
						<fmt:parseDate value="${item.createdAt}"
							pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
						<fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월"
							var="formattedDate" />


						<div class="d-flex col-lg-12 py-4"
							style="border-top: 1px solid #d5d5d5;">
							<div class="mr-4 shoping__cart__item">
								<img src="${item.productImgurl }" class="img-fluid rounded-3"
									style="width: 150px;" alt="" />
							</div>

							<div class="d-flex flex-column justify-content-center">
								<div class="my-2">
									<span>[도서]</span>
									<h5 class="font-weight-bold d-inline">${item.name}</h5>
								</div>
								<div>
									<span>${item.authorName}</span> <span>저</span> <br class="my-2" />
									<span>${item.publisherName}</span> <span>${ formattedDate }</span>
								</div>
								<div class="mt-1">

									<span class="text-warning font-weight-bold"> <c:set
											var="discount" value="${item.discountRate }" /> <fmt:formatNumber
											type="number" value="${discount}" /> % 할인
									</span> <span>${item.discountedPrice}</span><span>원</span> <span
										style="text-decoration: line-through; color: #767676;">${item.price}</span>
									<span> | ${item.pointAccumulation}p
										(${item.pointAccumulationRate}%)</span>
								</div>
								<div class="mt-2">
									<span>판매지수: ${item.popularity } |</span> <span>회원리뷰(</span> <span
										class="text-primary">${item.reviewCount }</span> <span>건)</span>
									<span>❤❤❤❤❤</span> <span>${item.ratingAvg }</span>
								</div>
							</div>

							<div class="d-flex flex-column" style="margin-left: auto;">
								<div class="quantity">
									<div class="pro-qty">
										<input type="text" value="1">
									</div>
								</div>
								<a href="#" class="primary-btn cart-btn cart-btn-right"><span
									class="icon_loading"></span> 카트에 넣기</a> <a href="#"
									class="primary-btn cart-btn cart-btn-right"><span
									class="icon_loading"></span> 바로 구매</a>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>

		</div>

		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__btns">
					<a href="#" class="primary-btn cart-btn">CONTINUE SHOPPING</a> <a
						href="#" class="primary-btn cart-btn cart-btn-right"><span
						class="icon_loading"></span> Upadate Cart</a>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping__continue">
					<div class="shoping__discount">
						<h5>Discount Codes</h5>
						<form action="#">
							<input type="text" placeholder="Enter your coupon code">
							<button type="submit" class="site-btn">APPLY COUPON</button>
						</form>
					</div>
				</div>
			</div>
			<div class="col-lg-6">
				<div class="shoping__checkout">
					<h5>Cart Total</h5>
					<ul>
						<li>Subtotal <span>$454.98</span></li>
						<li>Total <span>$454.98</span></li>
					</ul>
					<a href="#" class="primary-btn">PROCEED TO CHECKOUT</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Section End -->
<!-- Shoping Cart Section End -->
