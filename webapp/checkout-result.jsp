<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<script>
	
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
					<h2>결제서</h2>
					<div class="breadcrumb__option">
						<a href="./index.jsp">Home</a> <span>결제서</span>
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
		<div class="col-lg-12">
			<div class="checkout__order">
				<h4>결제 내역</h4>
				<div class="checkout__order__total">
					${orderResult.sequence} 받는 분 성함 <span>
						${orderResult.receiverName} 님 </span>
				</div>
				<div class="checkout__order__total">
					연락처 <span> ${orderResult.orderPhone} </span>
				</div>
				<div class="checkout__order__total">
					우편 번호 <span> ${orderResult.zipcode} </span>
				</div>
				<div class="checkout__order__total">
					주소 <span> ${orderResult.streetAddress} </span>
				</div>
				<div class="checkout__order__total">
					상세주소 <span> ${orderResult.addressDetail} </span>
				</div>
				<div class="checkout__order__total">
					상세주소 <span> ${orderResult.addressDetail} </span>
				</div>
				<div class="checkout__order__products">
					상품 목록 <span>금액</span>
				</div>

				<c:forEach items="${orderDetailResult}" var="orderDetail">
					<ul>
						<li>${orderDetail.orderDetailProduct.name } ${orderDetail.count }X ${orderDetail.productPrice}</li>
					</ul>
				</c:forEach>
				<div class="checkout__order__total">
					적립 예정 포인트 <span>${totalPoint} </span>
				</div>
				<div class="checkout__order__total">
					총 금액 <span>${totalPrice}원</span>
				</div>
				<button type="button" class="site-btn" id="order__btn"
					onclick={sendRequest}>주문하기</button>
			</div>
		</div>
	</div>
	</div>
	</div>
</section>
<!-- Checkout Section End -->

<script>

function sendRequest(){
	$.ajax({
		url : "request_ajax.jsp",
		type : "post",
		data : {"receiver_name" : receiver_name, "zipcode" : zipcode, "order_phone": order_phone},
		dataType : "text",
		success : function(result){
			document.getElementById("text").innerHTML = result;
		}
	});
}


document.querySelector("#order__btn").addEventListener("click",function(){
	const receiver_name = document.querySelector('#input__receiverName').value;
	const order_phone = document.querySelector('#input__phone').value;
	
	const zipcode = document.querySelector('#sample6_postcode').value;
	const street_address = document.querySelector('#sample6_address').value;
	const address_detail = document.querySelector('#sample6_extraAddress').value;
	const vendor_message = document.querySelector('#sample6_detailAddress').value;
	
	
	console.log(receiver_name, order_phone);
	console.log('hi');
});
		
</script>

