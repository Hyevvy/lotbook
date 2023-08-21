<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header Section Begin -->
<%-- <script>
	<%=request.set(request.getAttribute("memberSeq"))%>
</script> --%>
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
						<li><a href="#">Pages</a>
							<ul class="header__menu__dropdown">
								<li><a href="main.bit?view=shop-details">Shop Details</a></li>
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
					<h2>회원정보</h2>
					<div class="breadcrumb__option">
						<a href="./index.jsp">Home</a> <span>member-info</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->
</br>
</br>
<!-- Profile Section Begin -->
<section class="checkout_spad">
	<div class="container">
		<div class="checkout__form">
			<h4>회원 정보 수정</h4>
			<form action="member.bit">
				<input type="hidden" name="view" value="updateinfo">
				<div class="col-lg-6">
					<div class="checkout__input">
						<p>
							이메일<span>*</span>
						</p>
						<input type="text" disabled value="${logincust.email }" style="color:black;" required>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="checkout__input">
						<p>
							이름<span>*</span>
						</p>
						<input type="text" value="${logincust.name }" style="color:black; " required>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="checkout__input">
						<p>
							현재 비밀번호<span>*</span>
						</p>
						<input type="text" required>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="checkout__input">
						<p>
							새로운 비밀번호<span>*</span>
						</p>
						<input type="text" required>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="checkout__input">
						<p>
							휴대전화<span>*</span>
						</p>
						<input type="text" value="${logincust.memberPhone }" style="color:black;" required>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="checkout__input">
						<p>
							주소<span>*</span>
						</p>
						<input type="button" onclick="getAddress()" class="col-4 second-input" value="우편번호 찾기" style="color:black;" > <br/>
						<input type="text" id="sample6_postcode" class="form-control col-8 first-input" placeholder="우편번호" name="zipcode" style="color:black;" required value="${logincust.zipcode }" required>
						<input type="text" id="sample6_address" class="form-control" placeholder="주소" name="street_address_1" style="color:black;" value="${logincust.streetAddress }"><br/>
						<input type="hidden" id="sample6_extraAddress" class="form-control" placeholder="참고항목" name="street_address_2" style="color:black;">
						<input type="text" id="sample6_detailAddress" class="form-control" placeholder="상세주소" name="address_detail" style="color:black;" value="${logincust.addressDetail }">
							
					</div>
				</div>
				<div style="display: flex; gap: 10px; justify-content: center; margin-bottom:10px;">	
					<button type="submit" id="register_btn" class="site-btn"> 정보 수정 </button>
					<input type="button" id="cancel_btn" class="btn btn-secondary" onclick="window.history.back();" value="취소" style="width:7.5rem; height:2.9rem; border-radius:0px; font:14px Cairo;">		
				</div>
			</form>
			<%-- <div class="col-sm-6 ">
				<p>독서하기 좋은 날이네요!</p>
				<h4>${logincust.name}</h4>
			</div>
			<div class="col-sm-6">
				<p>포인트</p>
				<h4>315P</h4>
			</div> --%>

			<div class="row"></div>
		</div>
	</div>
</section>
<%-- <!-- Profile Section End -->
<!-- Cart Section Begin -->
<section class="checkout spad">
	<div class="container">
		<div class="row"></div>
		<div class="checkout__form">
			<h4>장바구니</h4>
			<c:forEach items="${myCartProductList }" var="product">
				<div class="card mb-3">
					<div class="card-body">
						<div class="d-flex justify-content-between">
							<div class="d-flex flex-row align-items-center">
								<div class="col-2">
									<img src="${product.productImgurl }"
										class="img-fluid rounded-3" alt="Shopping item"
										style="width: 85px;">
								</div>
								<div class="col-6">
									<h5>${product.name }</h5>
									<p class="small mb-0">${product.content.substring(0, 75) }...</p>
								</div>
								<div class="d-flex flex-row align-items-center col-4">
									<div style="width: 50px;">
										<h5 class="fw-normal mb-0 ml-2">${product.count }</h5>
									</div>
									<div style="width: 100px;">
										<h5 class="mb-0">${product.price * product.count }원</h5>
									</div>
									<a href="#!" style="color: #cecece;">삭제</a>
									<button type="submit"
										class="ml-5 py-2 bg-danger text-white border-0 rounded-sm"
										style="width: 50px;">주문</button>
								</div>

							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</section>
<!-- Cart Section End -->
<!-- Checkout Section Begin -->
<section class="checkout spad">
	<div class="container">
		<div class="row"></div>
		<div class="checkout__form">
			<h4>주문 내역</h4>
			<c:forEach items="${myOrderList}" var="order">
				<div class="card mb-3 border-0">
					<h6 class="bg-light text-danger border-top border-danger m-0">주문번호
						${order.sequence} ${order.createdAt} ⌵</h6>
						<c:forEach items="${order.orderDetailList}" var="orderDetail">
							<div class="card-body">
								<div class="d-flex justify-content-between">
									<div class="d-flex flex-row align-items-center">
										<div>
											<img
												src=${orderDetail.orderDetailProduct.productImgurl}
												class="img-fluid rounded-3" alt="Shopping item"
												style="width: 65px;">
										</div>
										<div class="ml-3">
											<h5>${orderDetail.orderDetailProduct.name}</h5>
											<p class="small mb-0">${orderDetail.state}</p>
											<button type="submit"
									class="site-btn mx-1 bg-danger text-white border-0 rounded-sm">리뷰
						작성하기</button>
						<button type="submit"
							class="py-2 col-sm-6 bg-secondary text-white border-0 rounded-sm">환불
							요청</button>
								<button type="submit"
							class="py-2 col-sm-6 bg-danger text-white border-0 rounded-sm">주문
							확정</button>
										</div>
									</div>
									<div class="d-flex flex-row align-items-center">
										<div style="width: 50px;">
											<h5 class="fw-normal mb-0">${orderDetail.count}</h5>
										</div>
										<div style="width: 100px;">
											<h5 class="mb-0">${orderDetail.productPrice * orderDetail.count}원</h5>
										</div>
									</div>
								</div>
								</div>
						</c:forEach>
				</div>

			</c:forEach>
		</div>

	</div>
</section>
<!-- Checkout Section End -->
<!-- Review Section Begin --> --%>
<section class="checkout spad">
	<div class="container"></div>
</section>
<!-- Review Section End -->