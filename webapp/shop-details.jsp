<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page
	import="app.dto.entity.Product, app.dto.entity.Review, app.dto.response.ProductDetailWithReviews, java.util.List"%>
<%
// ProductDetailWithReviews 객체 받아오기
ProductDetailWithReviews productDetailWithReviews = (ProductDetailWithReviews) request
		.getAttribute("productDetailWithReviews");
String selectedProduct = "";
if (productDetailWithReviews != null) {
	selectedProduct = productDetailWithReviews.getContent();
}
// List<Review> reviews = productDetailWithReviews.getReviews();
%>

<style type="text/css">
.info-tag {
	width: 5vw;
	line-height: 1.2;
}

.normal-info {
	vertical-align: bottom;
	line-height: 1.2;
}

.bold-info {
	font-weight: bold;
	font-size: 1.3em;
	line-height: 1.2;
}

.content-style {
	line-height: 1.7;
	font-size: 1.1em;
}

.q-button {
	display: flex;
	width: 140px;
	height: 50px;
	display: inline;
	text-align: center;
	justify-content: space-between
}

.q-quantity{
	background-color: gray; 
    

}
</style>



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
					<a href="main.bit"><img src="img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul id="header__menus">
						<li><a href="./index.jsp">Home</a></li>
						<li><a href="main.bit?view=shop-grid">Shop</a></li>
						<li class="active"><a href="#">Pages</a>
							<ul class="header__menu__dropdown">
								<li><a
									href="product-detail.bit?view=shop-details&sequence=1">Shop
										Details테스트</a></li>
								<li><a href="main.bit?view=shoping-cart">Shoping Cart</a></li>
								<li><a href="main.bit?view=checkout">Check Out</a></li>

							</ul></li>
						<li><a href="main.bit?view=contact">Contact</a></li>
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
					<h2>${ productDetailWithReviews.getName() }</h2>
					<div class="breadcrumb__option">
						<a href="./index.jsp">Home</a> <a href="./index.jsp">${productDetailWithReviews.getMainCategoryName() }</a>
						<a href="./index.jsp">${productDetailWithReviews.getSubCategoryName() }</a>
						<!-- TODO: 클릭시, 카테고리 검색으로 넘기기  -->
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
		<div class="row d-flex justify-content-center">
			<div class="col-lg-5 col-md-5 mr-3">
				<div class="product__details__pic">
					<div class="product__details__pic__item">
						<img class="product__details__pic__item--large"
							src=${productDetailWithReviews.getProductImgurl() } alt="상품사진">
					</div>

				</div>
			</div>
			<div class="col-lg-6 col-md-6">
				<div class="product__details__text">
					<h3>${ productDetailWithReviews.getName() }</h3>
					<div class="product__details__rating">
						<c:set var="fullStars" value="${Math.floor(productDetailWithReviews.averageRating)}" />
						<c:set var="halfStar" value="${productDetailWithReviews.averageRating % 1 >= 0.5 ? 1 : 0}" />
						<c:set var="emptyStars" value="${5 - fullStars - halfStar}" />
						<c:forEach var="i" begin="1" end="${fullStars}">
							<i class="fa fa-star"></i>
						</c:forEach>

						<c:if test="${halfStar == 1}">
							<i class="fa fa-star-half-o"></i>
						</c:if>
					
						<c:forEach var="i" begin="1" end="${emptyStars}">
							<i class="fa fa-star-o"></i>
						</c:forEach>
					
						<span>${productDetailWithReviews.averageRating }</span> 
						<span>(${ productDetailWithReviews.getReviews().size() }개의 리뷰)</span>
					</div>


					<div class="d-flex flex-column mb-3">
						<div class="d-flex flex-row">
							<h5 class="my-2 info-tag normal-info" >정가</h5>
							<div class="my-2">
								<fmt:formatNumber
									value="${ productDetailWithReviews.getOriginalPrice() }"
									type="number" pattern="#,##0" />
								원
							</div>
						</div>
						<div class="d-flex flex-row">
							<h5 class="my-2 info-tag normal-info">판매가</h5>
							<div class="my-2">
								<span class="bold-info"> <fmt:formatNumber
										value="${ productDetailWithReviews.getPrice() }" type="number"
										pattern="#,##0" />
								</span> 원( <span class="text-warning">${ productDetailWithReviews.getDiscountRate().intValue()}%,
								</span> <span> <fmt:formatNumber
										value="${ productDetailWithReviews.getOriginalPrice() - productDetailWithReviews.getPrice() }"
										type="number" pattern="#,##0" /> 원 할인)
								</span>
							</div>
						</div>
						<div class="d-flex flex-row">
							<h5 class="my-2 info-tag normal-info">배송료</h5>
							<div class="my-2">무료</div>
						</div>
					</div>





					<div class="mb-4">
						<p style="display: inline;">${productDetailWithReviews.getContent().substring(0, 100)}...<a
								href="#details-description" class="text-muted"> 더보기</a>
						</p>

					</div>
					<div class="d-flex flex-row">
						

						<div class="d-flex flex-row align-items-center bg-light mr-5"
							style="width: 115px; display: inline-block; margin-right: 16px; margin-bottom: 4px;">
							<span class="p-3 text-dark btn " style="width: 50px;"
								onclick="decreaseQuantity()">-</span> 
							<input type="text"
								value="1" id="product-count" class="fw-normal mb-0 ml-2 bg-light"
								style="width: 50px; border: none; text-align: center;" readonly>
							<span class="p-3 text-dark btn bg-light" style="width: 50px;"
								onclick="increaseQuantity()">+</span>
						</div>




						<!-- stock 0개일때 style, button disabled -->
						<c:choose>
							<c:when test="${productDetailWithReviews.getStock() > 0}">
								<button type="button" class="primary-btn border_none"
									onclick='addToCart(${productDetailWithReviews.getSequence()}, ${logincust.sequence})'
									id="addToCartButton">장바구니에 담기</button>
								<button type="button" class="primary-btn border_none"
									onclick='checkOutBuyNow(${productDetailWithReviews.getSequence()}, ${logincust.sequence})'
									id="checkoutbuynow">바로 구매</button>
							</c:when>
							<c:otherwise>
								<button type="button" class="primary-btn border_none"
									id="addToCartButton" disabled>장바구니에 담기</button>
								<a href="" class="primary-btn" onclick="return false;">바로 구매</a>
							</c:otherwise>
						</c:choose>
					</div>


					<!-- 
					<div class="product__details__quantity">
						<div class="quantity">
							<div class="pro-qty">
								<input type="text" value="1" id="productQuantity"
									oninput="renderExpectedPrice(this.value)">
							</div>
						</div>
					</div>
					 -->


					<div class="d-flex py-4" style="height:5vh;">
						<h5 class="normal-info" id="totalPriceTag"> </h5> <div id="totalPrice" class="bold-info ml-3" style="line-height:1.1;"></div> 
					</div>
					
					



					<!--  
               <button type="button" class="primary-btn border_none"
                  id="addToCartButton">장바구니에 담기</button>
               <a href="#" class="primary-btn">장바구니에 담기</a>
               <a href="main.bit?view=checkoutbuynow&count=${2}&productId=${productDetailWithReviews.getSequence()}"
                  class="primary-btn">바로 구매</a>
                  -->
					<ul>
						<li><b>구매가능 여부</b> <span><c:choose>
									<c:when test="${productDetailWithReviews.getStock() > 0}">구매가능</c:when>
									<c:otherwise>품절</c:otherwise>
								</c:choose></span></li>
						<li><b>작가</b> <span>${productDetailWithReviews.getAuthorName() }</span></li>
						<li><b>출판사</b> <span>${productDetailWithReviews.getPublisherName() }</span></li>
						<li><b>포인트 적립</b> <span><span class="text-warning">${productDetailWithReviews.getPointAccumulation() }</span>포인트
								/ <span class="text-warning">${productDetailWithReviews.getPointAccumulationRate() }%</span></span></li>
					</ul>
				</div>
			</div>
			<div class="col-lg-12">
				<div class="product__details__tab">
					<ul class="nav nav-tabs" role="tablist">
						<li class="nav-item"><a class="nav-link active"
							data-toggle="tab" href="#tabs-1" role="tab" aria-selected="true">상세
								설명</a></li>
						<li class="nav-item"><a class="nav-link" data-toggle="tab"
							href="#tabs-2" role="tab" aria-selected="false">리뷰 <span>(${ productDetailWithReviews.getReviews().size() }개)</span></a>
						</li>
					</ul>
					<div class="tab-content">
						<div class="tab-pane active" id="tabs-1" role="tabpanel">
							<div class="product__details__tab__desc" id="details-description">
								<h6>상세 설명</h6>
								<div class="d-flex flex-column align-items-center">
									<img
										class="product__details__pic__item--large col-lg-6 col-md-6 mb-5"
										src=${productDetailWithReviews.getProductImgurl() } alt="상품사진">
									<p class="col-lg-8 col-md-8 content-style">${productDetailWithReviews.getContent()}</p>
								</div>

								<div class="d-flex flex-column align-items-center">
									<img
										class="product__details__pic__item--large col-lg-6 col-md-6 mb-5"
										src=${productDetailWithReviews.productDetailImgurl }
										alt="상품디테일사진">

								</div>


							</div>
						</div>
						<div class="tab-pane" id="tabs-2" role="tabpanel">
							<div class="product__details__tab__desc">
								<h6>리뷰</h6>
								<p>${productDetailWithReviews.getReviews() }</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Product Details Section End -->

<!-- Modal -->
<div class="modal fade" id="addToCartModal" tabindex="-1" role="dialog"
	aria-labelledby="addToCartModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered mt-sm-3 mt-md-5 mt-lg-6"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="addToCartModalLabel">장바구니 추가</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">장바구니에 상품을 담았습니다. 장바구니로 이동하시겠습니까?</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<a
					href="main.bit?view=shopping-cart&memberSeq=${logincust.sequence}"
					class="btn btn-danger">장바구니로 가기</a>
			</div>
		</div>
	</div>
</div>


<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$("#addToCartButton").click(function() {
			$("#addToCartModal").modal("show");
		});
	});
	
	function addToCart(productSeq, memberSeq) {
		console.log("addtocart발동")
		if (memberSeq === undefined) {
	        alert("로그인이 필요합니다.");
	        return;
	    }
		
		var count = Number($('#productQuantity').val());
		console.log(productSeq, memberSeq, count)
		
		$.ajax({
			url:'rest.bit?view=addToCart&productSequence=' + productSeq + '&count=' + count + '&memberSeq=' + memberSeq,
			success:function(result){
				console.log(result);
				if (result === 0) {
					alert("카트에 넣는 도중 오류가 발생했습니다. 다시 시도해주세요.");
				} else {
					 $('#addToCartModal').modal('show');
					
				}
			}
		});
	}
	
	function checkOutBuyNow(productId, memberSeq) {
	    var count = Number($('#productQuantity').val());
	    
	    // Redirect to the checkout page with the specified count and product ID
	    window.location.href = 'main.bit?view=checkoutbuynow&count=' + count + '&productId=' + productId + '&memberSeq=' + memberSeq;
	}
	
	
    let count = 1;

    function increaseQuantity() {
      count++;
      document.getElementById("product-count").value = count;
      renderExpectedPrice(count);
    }

    function decreaseQuantity() {
      if (count > 1) {
        count--;
        document.getElementById("product-count").value = count;
        renderExpectedPrice(count);
      }
    }
	
	
	// 개수에 따라 총상품금액 선택적 렌더링
	 function renderExpectedPrice(cnt) {
	   console.log("발동");
	   var count = Number(cnt);
	   if (count >= 2) {
		   document.getElementById('totalPriceTag').textContent = '총 상품금액: ';
	     document.getElementById('totalPrice').textContent = count * ${productDetailWithReviews.getPrice()};
	   } else {
		   document.getElementById('totalPriceTag').textContent = '';
	     document.getElementById('totalPrice').textContent = '';
	   }
	 }

</script>
