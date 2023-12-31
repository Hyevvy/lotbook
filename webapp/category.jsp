<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.util.Arrays, java.util.List"%>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>


<!-- Header Section Begin -->
<header class="header">
	<div class="header__top">
		<div class="container">
			<nav class="header__menu header__top__right mobile-menu"
				style="padding: 5px 0">
				<ul>
					<c:choose>
						<c:when test="${logincust != null }">
							<li class="active"><a
								href="main.bit?view=mypage&memberSeq=${logincust.sequence }"><i
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
						<li class="active"><a href="category.bit?view=1"  style="font-size: 20px; font-weight: 700;">도서 전체</a></li>
						<li><a href="main.bit?view=contact"  style="font-size: 20px; font-weight: 700;">고객센터</a></li>
					</ul>
				</nav>
			</div>
			<c:choose>
				<c:when test="${logincust != null }">
					<div class="col-lg-3">
						<div class="header__cart">
							<ul>
								<li><a
									href="main.bit?view=shopping-cart&memberSeq=${logincust.sequence }"><i
										class="fa fa-shopping-bag"></i> <span>${cartCount }</span></a></li>
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
					<h2>
						<c:choose>
							<c:when test="${param.view == '1'}">컴퓨터 / IT</c:when>
							<c:when test="${param.view == '2'}">컴퓨터 공학</c:when>
							<c:when test="${param.view == '3'}">데이터베이스</c:when>
							<c:when test="${param.view == '4'}">네트워크</c:when>
							<c:when test="${param.view == '5'}">프로그래밍</c:when>
							<c:when test="${param.view == '6'}">소설</c:when>
							<c:when test="${param.view == '7'}">한국소설</c:when>
							<c:when test="${param.view == '8'}">영미소설</c:when>
							<c:when test="${param.view == '9'}">일본소설</c:when>
							<c:when test="${param.view == '10'}">경제 / 경영</c:when>
							<c:when test="${param.view == '11'}">경영일반</c:when>
							<c:when test="${param.view == '12'}">재테크/금융</c:when>
							<c:when test="${param.view == '13'}">유통/창업</c:when>
							<c:when test="${param.view == '14'}">세무/회계</c:when>
							<c:otherwise>카테고리</c:otherwise>
						</c:choose>
					</h2>
					<div>
						<a href="./category.bit?view=1"  style="color:white">도서전체</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Product Section Begin -->
<section class="product spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="sidebar">
					<div class="sidebar__item">
						<h4>
							<c:choose>
								<c:when test="${param.view == '1'}">컴퓨터 / IT</c:when>
								<c:when test="${param.view == '2'}">컴퓨터 공학</c:when>
								<c:when test="${param.view == '3'}">데이터베이스</c:when>
								<c:when test="${param.view == '4'}">네트워크</c:when>
								<c:when test="${param.view == '5'}">프로그래밍</c:when>
								<c:when test="${param.view == '6'}">소설</c:when>
								<c:when test="${param.view == '7'}">한국소설</c:when>
								<c:when test="${param.view == '8'}">영미소설</c:when>
								<c:when test="${param.view == '9'}">일본소설</c:when>
								<c:when test="${param.view == '10'}">경제 / 경영</c:when>
								<c:when test="${param.view == '11'}">경영일반</c:when>
								<c:when test="${param.view == '12'}">재테크/금융</c:when>
								<c:when test="${param.view == '13'}">유통/창업</c:when>
								<c:when test="${param.view == '14'}">세무/회계</c:when>
							</c:choose>
						</h4>
						<ul>
							<jsp:include page="common_categories.jsp" />
						</ul>
					</div>
				</div>
			</div>
			<div class="col-lg-9 col-md-7">
				<div class="filter__item">
					<div class="row">
						<div class="col-lg-4 col-md-5">
							<div style="margin-left: auto; text-align: right;">
								<!-- 드롭다운 메뉴를 생성하고 선택한 옵션에 따라 요청을 보내는 함수를 호출합니다. -->
								<label for="orderby"></label>
								<select id="orderby" 
									style="margin-left: auto;" onchange="changeOrderBy(this.value)">
									<option value="popular">인기순</option>
									<option value="sales">판매량순</option>
									<option value="high_to_low">높은 가격순</option>
									<option value="low_to_high">낮은 가격순</option>
									<option value="latest">최신순</option>
								</select>
							</div>
						</div>
						<div class="col-lg-4 col-md-4">
							<div class="filter__found">
								<h6>
									<span>${selectCategory.size()}</span> 개의 상품이 있습니다.
								</h6>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<c:forEach items="${selectCategory}" var="product">
						<div class="col-lg-4 col-md-6 col-sm-6">
							<a
								href="/lotbook/product-detail.bit?view=shop-details&sequence=${product.sequence}">
								<div class="product__item">
									<div class="product__item__pic set-bg "
										data-setbg="${product.productImgurl}" style="height: 350px">
									</div>
								<div class="product__item__text">
									<h6>
										${product.name}
									</h6>
									<c:set var="price" value="${product.price}" />
									<span class="price text-dark" style="font-weight: 900;"> <fmt:formatNumber type="number"
											maxFractionDigits="0" value="${price}" /> 원
									</span>
								</div>
							</div>
							</a>
						</div>
					</c:forEach>
				</div>
				<div style="text-align: center;" class="product__pagination">
					<c:set var="end" value="${selectCategory.size()/9}" />

					<c:forEach begin="1" end="${end}" var="pageNum">
						<a style="margin: 0" href="javascript:void(0);" onclick="showPage(${pageNum})" id="btnNum${pageNum}">${pageNum} </a>
					</c:forEach>
				</div>
			</div>
		</div>
</section>



<script>
function changeOrderBy(orderBy) {
    var currentURL = window.location.href;
    var newURL = currentURL.replace(/(\?|&)orderby=[^&]*/, '');
    
    if (newURL.indexOf('?') === -1) {
        newURL += '?';
    } else {
        newURL += '&';
    }
    
    newURL += 'orderby=' + orderBy;
    window.location.href = newURL;
}


function setOrderByDropdownValue() {
    var currentURL = new URL(window.location.href);
    var selectedOrderBy = currentURL.searchParams.get("orderby");
    
    if (selectedOrderBy) {
        var orderByDropdown = document.getElementById("orderby");
        orderByDropdown.value = selectedOrderBy;
    }
}

window.onload = setOrderByDropdownValue();


var itemsPerPage = 9; // 페이지당 아이템 개수
var currentPage = 1; // 현재 페이지 번호
var totalItems = ${selectCategory.size()}; // 총 아이템 개수
var totalPages = Math.ceil(totalItems / itemsPerPage); // 총 페이지 개수

function setActiveButton(buttonId) {
    var buttons = document.querySelectorAll(".product__pagination a");
    buttons.forEach(function(button) {
        if (button.id === buttonId) {
            button.classList.add("bg-danger"); // 선택된 버튼에 빨간색 스타일 추가
            button.classList.add("text-white");
        } else {
            button.classList.remove("bg-danger"); // 다른 버튼에서 빨간색 스타일 제거
            button.classList.remove("text-white");
        }
    });
}


function showPage(pageNum) {

    currentPage = pageNum;

    
    var startIndex = (currentPage - 1) * itemsPerPage;
    var endIndex = Math.min(startIndex + itemsPerPage, totalItems);

    
    var allItems = document.querySelectorAll('.product__item');
    allItems.forEach(function(item, index) {
        if (index >= startIndex && index < endIndex) {
            item.style.display	 = 'block';
        } else {
            item.style.display = 'none';
        }
    });
    setActiveButton("btnNum" + currentPage);
}


showPage(currentPage);
</script>