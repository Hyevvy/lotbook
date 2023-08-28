<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
						<li><a href="category.bit?view=1"  style="font-size: 20px; font-weight: 700;">도서 전체</a></li>
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
				<div class="checkout__order__total">
					상품 목록 
					<c:forEach items="${orderDetailResult}" var="orderDetail" varStatus="status">
						<span id="productName${status.index }">${orderDetail.orderDetailProduct.name } X ${orderDetail.count}</span>
						<br>
					</c:forEach>
				</div>
				<div class="checkout__order__total">
					적립 예정 포인트 
					<span>
						<c:set var="price" value="${totalPoint}"/>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>
                    점</span>
				</div>
				<div class="checkout__order__total">
					사용 포인트 
					<span>
						<c:set var="price" value="${usedPoint }"/>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>
                    점</span>
				</div>
				<div class="checkout__order__total">
					총 금액 
					<span>
						<c:set var="price" value="${totalPrice - usedPoint}"/>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>
                    원</span>
				</div>
				<button type="button" name="submit" class="site-btn" id="order__btn" onclick="goHome()">홈으로
					이동하기</button>
			</div>
		</div>
	</div>
</section>
<!-- Checkout Section End -->



<script type="text/javascript">
function goHome() {
	location.href="main.bit";
}
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
