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
			<form action="main.bit?view=checkout-result&sequences=${sequences}&cmd=1" method="post">
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

								적립 예정 포인트 <span>${orderProductList[fn:length(orderProductList) -1].totalPoint }
									점</span>
							</div>
							<div class="checkout__order__total">
								총 결제 금액 <span>${orderProductList[fn:length(orderProductList) - 1].totalPrice }
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
