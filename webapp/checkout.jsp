<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("UTF-8");
String[] orderProductList = request.getParameterValues("orderProductList");
String[] sequences = request.getParameterValues("sequences");
%>


<script>
var payPrice = 0;
var usePoint = 0;
function orderProducts (sequences){
	console.log('sequences', sequences);
	location.href = 'main.bit?view=checkout-result&sequences=' + sequences;
	request.setAttribute('zipcode', document.getElementById("sample6_postcode").value);
} 

function get_my_info(name, email, memberPhone, zipcode, streetAddress, addressDetail) {
	const checkbox = document.getElementById("check_box");
	
	if (checkbox.checked) {
		document.getElementById("custName").value = name;
		document.getElementById("custEmail").value = email;
		document.getElementById("custPhone").value = memberPhone;
		document.getElementById("sample6_postcode").value = zipcode;
		document.getElementById("sample6_address").value = streetAddress;
		document.getElementById("sample6_detailAddress").value = addressDetail;
	} else {
		document.getElementById("custName").value = "";
		document.getElementById("custEmail").value = "";
		document.getElementById("custPhone").value = "";
		document.getElementById("sample6_postcode").value = "";
		document.getElementById("sample6_address").value = "";
		document.getElementById("sample6_detailAddress").value = "";
	}
}
function use_all_point(totalPoint, totalPrice) {
	var checkbox = document.getElementById("checkbox");
	
	if (checkbox.checked) {
		document.getElementById("usePoint").value = totalPoint;
		document.getElementById("totalPrice").innerHTML = totalPrice - totalPoint + " 원";
		payPrice = totalPrice - totalPoint;
		usePoint = totalPoint
	}
}
function checkout_result(sequences) {
	location.href = "main.bit?view=checkout-result&sequences=" + sequences + "&cmd=" + 1 + "&usePoint=" + usePoint;
	
}
function use_point(value, totalPrice, myPoint) {
	if (value > myPoint) {
		alert("사용할 수 있는 포인트를 초과했습니다.");
		document.getElementById("usePoint").value = myPoint;
		document.getElementById("totalPrice").innerHTML = totalPrice - myPoint + " 원";
	} else {
		document.getElementById("totalPrice").innerHTML = totalPrice - value + " 원";
		payPrice = totalPrice - value;
		usePoint = value;
	}
	
}
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
						<li><a href="category.bit?view=1">Shop</a></li>
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
						<jsp:include page="common_categories.jsp" />
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
<section class="breadcrumb-section set-bg" data-setbg="img/books.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>Checkout</h2>
					<div class="breadcrumb__option">
						<a href="./index.jsp">Home</a> <span>Checkout</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Checkout Section Begin -->
<section class="checkout spad">
	<div class="container">
		<div class="row"></div>
		<div class="checkout__form">
			<h4>결제 확인서</h4>
			<form action="main.bit?view=checkout-result&sequences=${sequences }&cmd=1" method="post">
				<input type="hidden" name="view" value="checkout-result" />
				<div class="row">
					<div class="col-lg-8 col-md-6">
						<div class="d-flex flex-col align-items-center">
							<input id="check_box" type="checkbox" class="mb-3 text-dark"
								onclick="get_my_info('${logincust.name }', '${logincust.email }', '${logincust.memberPhone }', '${logincust.zipcode }', '${logincust.streetAddress }', '${logincust.addressDetail }')">
							<p class="ml-2 text-muted">내 정보 불러오기</p>
						</div>
						<div class="row">
							<div class="col-lg-8 col-md-6">
								<div class="checkout__input">
									<p>
										받는 분 성함<span>*</span>
									</p>
									<input class="text-dark" id="custName" type="text"
										name="input__receiverName" required>
								</div>
							</div>
						</div>
						<div class="checkout__input">
							<p>
								이메일(청구서 수신용)<span>*</span>
							</p>
							<input class="text-dark" id="custEmail" type="email"
								name="input__email" required>
						</div>

						<div class="checkout__input">
							<p>
								연락처<span>*</span>
							</p>
							<input class="text-dark" id="custPhone" type="tel"
								pattern="[0-9]{3}[0-9]{4}[0-9]{4}" name="input__phone" required>
						</div>
						<div class="checkout__input">
							<p>
								우편 번호<span>*</span>
							</p>
							<input class="text-dark" type="text" id="sample6_postcode"
								placeholder="우편번호" name="input__zipcode"> <input
								type="button" onclick="getAddress()" value="우편번호 찾기"><br>
						</div>
						<div class="checkout__input">
							<p>
								주소<span>*</span>
							</p>
							<input class="text-dark" type="text" id="sample6_address"
								placeholder="주소" name="input__street_address"><br>
							<input class="text-dark" type="text" id="sample6_detailAddress"
								placeholder="상세주소" name="input__address_detail"> <input
								class="text-dark" type="text" id="sample6_extraAddress"
								placeholder="배송 메세지" name="input__vendor_message">
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="checkout__order">
							<h4>주문 내역</h4>
							<div class="checkout__order__products">
								상품 목록 <span>금액</span>
							</div>
							<ul>
								<c:forEach items="${orderProductList }" var="product">
									<li>${product.name.substring(0, 10) }...X${product.count }
										<span> <c:set var="price"
												value="${(product.price * ((100 - product.discountRate) * 0.01)) * product.count - ((product.price * ((100 - product.discountRate) * 0.01)) * product.count)%10 }" />
											<fmt:formatNumber type="number" maxFractionDigits="3"
												value="${price}" /> 원
									</span>
									</li>
								</c:forEach>
							</ul>
							<div class="checkout__order__total">

								적립 예정 포인트 
								<span>
									<c:set var="price" value="${orderProductList[fn:length(orderProductList) -1].totalPoint }"/>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>
			                    점</span>
							</div>
							<div style="border-bottom-width: 1px; border-bottom-style: solid; border-bottom-color: rgb(225, 225, 225); padding-bottom: 10px; margin-bottom: 15px;">
								<div class="checkout__order__total" style="border: none; margin-bottom: -5px">
								포인트 사용<span><input id="usePoint" name="usePoint" type="text" value=0 style="width: 100px; text-align: right; border: none;" onchange="use_point(this.value, ${orderProductList[fn:length(orderProductList) - 1].totalPrice }, ${logincust.accumulatedPoint })"></span>
								</div>
								<div class="text-muted" style="text-align: right; font-size: 8px;">
									사용 가능 포인트: ${logincust.accumulatedPoint } 점
								</div>
								<div style="width: 100%; text-align: right;">
									<input id="checkbox" type="checkbox" onclick="use_all_point(${logincust.accumulatedPoint }, ${orderProductList[fn:length(orderProductList) - 1].totalPrice })"><label style="text-align: right; margin-left: 5px;">전액 사용</label>
								</div>
							</div>
							<div class="checkout__order__total">
								총 결제 금액
								<span id="totalPrice">
									<c:set var="price" value="${orderProductList[fn:length(orderProductList) - 1].totalPrice }"/>
									<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>
			                    원</span>
							</div>
							<button type="submit" class="site-btn">주문하기</button>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</section>
<!-- Checkout Section End -->
