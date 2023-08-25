<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
					받는 분 성함 <span> ${orderResult.receiverName} 님 </span>
				</div>
				<div class="checkout__order__total">
					받는 분 이메일 <span> ${orderResult.receiverEmail} </span>
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
					배송메시지 <span> ${orderResult.vendorMessage} </span>
				</div>
				<div class="checkout__order__products">
					상품 목록 <span>금액</span>
				</div>

				<c:forEach items="${orderDetailResult}" var="orderDetail" varStatus="status">
					<div id="productCount" style="display: none;">${fn:length(orderDetailResult)}</div>
					<div class="checkout__order__total text-muted">
						<span id="productName${status.index }">${orderDetail.orderDetailProduct.name }</span> <span class="text-muted">
							${orderDetail.productPrice} X ${orderDetail.count} 원</span>
					</div>
				</c:forEach>
				<div class="checkout__order__total">
					적립 예정 포인트 <span>${totalPoint} 점</span>
				</div>
				<div class="checkout__order__total">
					사용 포인트 <span>${usedPoint } 점</span>
				</div>
				<div class="checkout__order__total">
					총 금액 <span>${totalPrice - usedPoint}원</span>
				</div>
				<button type="button" name="submit" class="site-btn" id="order__btn">홈으로
					이동하기</button>
			</div>
		</div>
	</div>
	</div>
	</div>
</section>
<!-- Checkout Section End -->



<script type="text/javascript">
	
$(document).ready(function() {
	emailjs.init("BeCe_Kl2PZg0CGUoO");		

    $('button[name=submit]').click(function(){       
    	var message = "ㅇㅇ";
    	const firstProductName = document.getElementById('productName0').innerText;

    	const productListLength = document.getElementById('productCount').innerText;
    	if(productListLength > 1) {
    		// 2종류 이상의 책을 구매
    		message = firstProductName + `외 ` + (Number(productListLength) - 1) + `건 구매 완료되었습니다.`
    	} else {
    		message = firstProductName + ` 구매 완료되었습니다.`
    	}
   
      var templateParams = {	
    		receiverName: `${orderResult.receiverName}`,
    		receiverEmail: `${orderResult.receiverEmail}`,
    		orderPhone : `${orderResult.orderPhone}`,
    		zipcode:  `${orderResult.receiverName}`,
    		streetAddress:  `${orderResult.streetAddress}`,
    		addressDetail:  `${orderResult.addressDetail}`,
    		vendorMessage:  `${orderResult.vendorMessage}`,
    		totalPrice: ${totalPrice},
    		usedPoint: ${usedPoint},
    		finalPrice: ${totalPrice - usedPoint},
            message : message
       		};
           
            	
   	  emailjs.send('service_dwb08qj', 'template_o71nji7', templateParams)
     	    .then(function(response) {
     	       console.log('SUCCESS!', response.status, response.text);
     	    }, function(error) {
     	       console.log('FAILED...', error);
     	    });
          


    });
    
  });
    

	</script>
