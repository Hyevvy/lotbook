<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%    
	request.setCharacterEncoding("UTF-8");
	String[] myCartList = request.getParameterValues("myCartList");
	String[] myCartProductList = request.getParameterValues("myCartProductList");
%>
<style>
	#modal {
		position: fixed;
		top: 0;
		left: 0;
		z-index: 1050;
		display: none;
		overflow: hidden;
		width: 100%;
		height: 100%;
		outline: 0;
		background-color: rgba( 0, 0, 0, 0.6 );
		animation: fadein 0.4s;
		
	}
	
	@keyframes fadein {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
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
							<li class="active"><a href="main.bit?view=mypage&memberSeq=${logincust.sequence }"><i
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
<section class="breadcrumb-section set-bg"
	data-setbg="img/books.jpg">
	<div class="container">
		<div class="row">
			<div class="col-lg-12 text-center">
				<div class="breadcrumb__text">
					<h2>장바구니</h2>
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
<section class="shoping-cart spad">
	<div class="container">
		<div class="row">
			<div class="col-lg-12">
				<div class="shoping__cart__table">
					<table>
						<tbody>
							<c:forEach items="${myCartProductList }" var="product">	                    
								<tr>
									<td>
										<input id="cart_checkbox${product.sequence }" type="checkbox" onclick="is_checked(${product.sequence }, ${product.count }, ${product.price }, ${product.discountRate }, ${product.pointAccumulationRate })">
									</td>
									<td class="d-flex flex-col ml-4" style="margin-right: 20px; width: 500px; text-align: left; font-weight: 700; font-size: 18px;"><img
										src="${product.productImgurl }" alt="" style="width: 85px;">
										<div class="mt-4 ml-4">
											${product.name }
											<p class="small mb-0">${product.content.substring(0, 60) }...</p>
											<div class="d-flex flex-col mt-2">
					                          <p class="text-warning font-weight-bold">
					                          	<c:set var="discount" value="${product.discountRate }"/>
												<fmt:formatNumber type="number" value="${discount}" />
												% 할인
											  </p>
											  &nbsp;&nbsp;&nbsp;&nbsp;
											  <p class="font-italic text-dark">총 누적 포인트: </p>
											  &nbsp;&nbsp;&nbsp;
											  <p class="font-italic text-danger">
												  <c:set var="totalPoint" value="${(product.price * product.count) * product.pointAccumulationRate * 0.01 }"/>
												  <fmt:parseNumber type="number" value="${totalPoint}"  integerOnly="true"/>
											  </p>
											  &nbsp;
											  <p class="font-italic text-dark">점</p>
					                          </div>
											</div>
									</td>
									<td style="font-size: 15px; color: #1c1c1c; font-weight: 300; width: 200px">
										<c:set var="price" value="${(product.price * ((100 - product.discountRate) * 0.01)) - ((product.price * ((100 - product.discountRate) * 0.01)))%10 }"/>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>
										원
									</td>
									<td class="col-1">
										<div class="d-flex flex-row align-items-center bg-light">
				                          	<a href="main.bit?view=changeCartCount&sequence=${product.sequence }&productSequence=${product.productSequence }&count=${product.count - 1 }&memberSeq=${logincust.sequence}" class="p-3 text-dark">-</a>
				                          	<h5 class="fw-normal mb-0 ml-2">${product.count }</h5>
				                        	<a href="main.bit?view=changeCartCount&sequence=${product.sequence }&productSequence=${product.productSequence }&count=${product.count + 1 }&memberSeq=${logincust.sequence}" class="p-3 text-dark">+</a>
				                        </div>
									</td>
									<td style="font-size: 18px; color: #1c1c1c; font-weight: 700; width: 400px">
										총&nbsp;
										<c:set var="price" value="${(product.price * ((100 - product.discountRate) * 0.01)) * product.count - ((product.price * ((100 - product.discountRate) * 0.01)) * product.count)%10 }"/>
										<fmt:formatNumber type="number" maxFractionDigits="3" value="${price}"/>
										원
									</td>
									<td class="shoping__cart__item__close">
										<span class="icon_close" onclick="open_modal(${product.sequence}, ${logincust.sequence }, '${product.name }')"></span>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-6">
				
			</div>
			<div class="col-lg-6">
				<div class="shoping__checkout">
					<h5>결제 예정 정보</h5>
					<ul>
						<li>결제 예정 금액 <span id="totalCount">0원</span></li>
						<li>적립 예정 포인트 <span id="totalPoint">0점</span></li>
					</ul>
					<a class="primary-btn text-white btn" onclick="cart_to_order()">주문하기</a>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Shoping Cart Section End -->

<!-- Modal -->
<div id="modal">
  <div class="modal-dialog">
   <div class="modal-content">
     <div class="modal-header">
       <h5 class="modal-title" id="exampleModalLabel">장바구니 삭제</h5>
       <button type="button" class="close" data-dismiss="modal" aria-label="Close" onclick="close_modal()">
         <span aria-hidden="true">&times;</span>
       </button>
     </div>
     <div class="modal-body" id="modal-body">
       해당 상품을 장바구니에서 삭제하시겠습니까?
     </div>
     <div class="modal-footer">
      	<button class="btn btn-secondary text-light" data-dismiss="modal" onclick="close_modal()">아니오</button>
       <button id="delete_yes" class="btn btn-danger text-light" data-dismiss="modal" onclick="cart_delete()">&nbsp;&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;&nbsp;</button>
     </div>
   </div>
 </div>
</div>

<script>
	var totalCount = 0;
	var totalPoint = 0;
	var selectedCart = [];
	function is_checked(sequence, count, price, discountRate, pointAccumulationRate) {
		
		const checkbox = document.getElementById('cart_checkbox' + sequence);

		if (checkbox.checked) {
			totalCount = totalCount + ((price * ((100 - discountRate) * 0.01)) * count - ((price * ((100 - discountRate) * 0.01)) * count)%10);
			totalPoint = totalPoint + Math.floor(price * count * pointAccumulationRate * 0.01);
			selectedCart.push(sequence);
		} else {
			totalCount = totalCount - ((price * ((100 - discountRate) * 0.01)) * count - ((price * ((100 - discountRate) * 0.01)) * count)%10);
			totalPoint = totalPoint - Math.floor(price * count * pointAccumulationRate * 0.01);
			selectedCart.pop();
		}

		document.getElementById("totalCount").innerHTML = totalCount + " 원";
		document.getElementById("totalPoint").innerHTML = totalPoint + " 점";	
	}
	
	const modal = document.getElementById("modal");
	var productSequence = 0;
	var memberSequence = 0;
	var productName = "";
	
	function open_modal(productSeq, memberSeq, productName) {
		productSequence = productSeq;
		memberSequence = memberSeq;
		modal.style.display = "block";
		
		document.getElementById("modal-body").innerHTML = '"' + productName + '"'+ " 을(를) 장바구니에서 삭제하시겠습니까?";
	}
	
	function close_modal() {
		modal.style.display = "none";
	}
	
	function cart_delete() {
		location.href = 'main.bit?view=deleteCart&sequence=' + productSequence + '&memberSeq=' + memberSequence;
		
		close_modal();
	}
	function cart_to_order() {
		if (selectedCart.length === 0) {
			alert("구매 상품을 1개 이상 담아주세요!!");
		} else {
			location.href = 'main.bit?view=checkout&sequences=' + selectedCart;
		}
	}
</script>