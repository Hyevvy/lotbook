<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
request.setCharacterEncoding("UTF-8");
String[] myCartList = request.getParameterValues("myCartList");
String[] myCartProductList = request.getParameterValues("myCartProductList");
String[] myOrderList = request.getParameterValues("myOrderList");
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
	background-color: rgba(0, 0, 0, 0.6);
	animation: fadein 0.4s;
}

@
keyframes fadein {from { opacity:0;
	
}

to {
	opacity: 1;
}
}
</style>
<style>
.star-rating {
	width: 260px;
	/*  padding: 5px;
    text-align: center;
    border-radius: 5px;
    background-color: rgba(0, 0, 0, 0.829); */
}

.star-rating div {
	/* float: left; */
	width: 50%;
}

.stars {
	
}

.stars .fa {
	font-size: 18px;
	cursor: pointer;
}

.stars .fa.active {
	color: red;
}

.print {
	color: #fff;
}

.print img {
	/* 인라인끼리 중앙맞추기 */
	vertical-align: middle;
	margin-right: 5px;
}
</style>
<script>
function enableTextarea(sequence) {
	console.log(sequence);
//	const textarea = document.getElementById('updateComment');
	console.log("textarea-"+sequence);
    const textarea = document.getElementById("textarea-"+sequence);
    console.log("수정");
	
	textarea.disabled = false;
	
	console.log(textarea.disabled);
	var editBtn = document.getElementById("editBtn-"+sequence);
	editBtn.textContent = "저장"; // 버튼 텍스트 변경

	/* var test = $(`#reviewList-${sequence} textarea[id='updateComment']`).val();
	console.log(test); */
	/* console.log(textarea.disabled);

	if (textarea.disabled) {
		textarea.disabled = false;
        editBtn.textContent = "저장"; // 버튼 텍스트 변경
        // 필요한 경우 다른 스타일 변경도 추가할 수 있습니다.
        
        // 수정 완료 후 저장 버튼을 클릭하면 다시 textarea를 비활성화하는 로직을 추가해야 합니다.
        // 저장 버튼에 onclick 이벤트 핸들러를 추가하여 처리할 수 있습니다.
        
    } else {
    	saveChanges(sequence); // 수정된 내용 저장 함수 호출
    } */
};
</script>
<script>
$(document).ready(function(){
	//document.getElementById('updateComment').disabled = true;

	$("#alert-danger").hide();
	
	$('.stars .fa').click(function() {
	    $(this).addClass('active');
		console.log('test');
	    // 클릭한 별을 기준으로 (.fa) 그 이전 별은 보이게 그 뒤에 별들은 안보이게
	    $(this).prevAll().addClass('active');
	    $(this).nextAll().removeClass('active');
	
	    // 순서를 찾는 메서드 index 0 1 2 3 4
	    // 텍스트내용을 출력 text, 태그+텍스트 html
	    var num = $(this).index();
	    var starRate = num + 1;
	    
	    $('input[name=rating]').val(starRate);
	    
	});
	   $('#updateComment1').select(function(){console.log('hi');});
	   
	$(".site-btn").click(function() {
		//event.preventDefault();
		console.log("유효성 검사!");
        var form = $(this).closest("form");
        /* console.log($(this).val());
        var btnId = $(this).val();
        var findBtn = form.parent().find(btnId);
        console.log(findBtn); */
        
        
        //console.log(form.hasClass(""))
        /* var findNode = form.parent().find(".card-body").childNodes[0].childNodes[0].childNodes[1].find(".review-toggle-btn"); // 해당 폼의 부모 노드에서 .collapse 요소를 찾음

        console.log(findNode);
        findNode.hide(); */
         
        if ($(this).attr("id") === "submitBtn") {
            var starRate = form.find('.rating-input').val();

            if (starRate !== "" && starRate >= 1 ) {
                form.find(".alert-danger").css("display", "none");
                
                var formData = form.serialize();
                
                console.log(formData);
                console.log("url => "+ form.attr("action"));
                $.ajax({
                	type: "POST",
                	url: form.attr("action"),
                	data: formData,
                	success: function(response){
                		// Handle success response from the server
                        console.log("Review submitted successfully:", response);
                        // You can update the UI or perform other actions here
                        alert("리뷰가 성공적으로 반영되었습니다!");
                        document.location.reload();
                     	
                        /* var collapseElement = form.parent().find(".collapse").prevObject; // 해당 폼의 부모 노드에서 .collapse 요소를 찾음
                        
                        if (collapseElement.hasClass("show")) {
                            // 현재 상태가 보이는 상태라면 숨김
                            collapseElement.collapse("hide");
                            console.log("숨기기!");
                            
                            var btnId = $(this).val();
                            console.log($(this).val());
                            
                            var findBtn = $($(this).val());
                            
                            findBtn.css("display", "none");
                        } else {
                            // 현재 상태가 숨겨진 상태라면 보이게 함
                            collapseElement.collapse("show"); 
                            console.log("보이기!"); 
                            
                        }*/
                	},
                    error: function(error) {
                        // Handle error response from the server
                        console.error("Error submitting review:", error);
                        // You can display an error message or perform other error handling here
                    }
                }); 
            } else if(starRate == "" || starRate === 0){
                form.find(".alert-danger").css("display", "block");
	            return false; // Prevent form submission
            } else if(form.find(".review-textarea").value == ""){
            	form.find(".review-textarea").focus();
            	return false;
            } else{
	            return true;
            	
            }
        }
    });
});




/* function valid_check(a, b){
	//var form = $(this).closest("form");
	console.log('here');
	const starRate = $('input[name=rating]').val();
	//var starRate = form.find('.rating-input').val();
	console.log(starRate);
	if(starRate !== "" && starRate >=1){
		//form.find(".alert-danger").css("display", "none");
		console.log($("#alert-danger"));
		console.log(' 들어옴');
		$("#alert-danger").css("color", "#eeeeee");
		$('.star-rating').css("display", "none");
		$('#alert-14-20').css('display', 'none');
		$("input[name=rating]").val(5);
		$("input[name=rating]").css("display", "none");
		return true;
	}else if(starRate == "" || starRate === 0){
		$("#alert-danger").show();
	}
	 
	
    if (starRate !== "" && starRate >= 1) {
        //form.find(".alert-danger").css("display", "none");
    	$("#alert-danger").hide();
    } else if(starRate == "" || starRate === 0){
        //form.find(".alert-danger").css("display", "block");
    	$("#alert-danger").show();
    } else if(form.find(".review-textarea").value == ""){
    	form.find(".review-textarea").focus();
    }
    else{
    	console.log("성공!");
	    //form.submit();
    	//return true;
    } 
    return false;
} */



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
					<h2>마이페이지</h2>
					<div class="breadcrumb__option">
						<a href="./index.jsp">Home</a> <span>mypage</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->
<br>
<br>
<!-- Profile Section Begin -->
<section class="checkout_spad">
	<div class="container">
		<div class="row checkout__order">
			<div class="col-sm-6 ">
				<p>독서하기 좋은 날이네요!</p>
				<h4>${logincust.name}님</h4>
			</div>
			<div class="col-sm-6">
				<p>포인트</p>
				<h4>315P</h4>
			</div>
			<button type="submit" class="site-btn"
				onclick="location.href='member.bit?view=myinfo'">회원 정보 수정</button>
		</div>
	</div>
</section>
<!-- Profile Section End -->
<!-- Cart Section Begin -->
<section class="checkout spad">
	<div class="container">
		<div class="row"></div>
		<div class="checkout__form">
			<h4>장바구니</h4>
			<c:choose>
				<c:when test="${fn:length(myCartProductList) == 0 }">
					<div class="text-muted" style="text-align: center;">
						<i class="bi bi-info-circle-fill" style="font-size: 50px;"></i>
						<div class="text-muted" style="font-size: 20px;">장바구니에 담긴
							상품이 없습니다.</div>
					</div>
				</c:when>
				<c:otherwise>
					<c:forEach items="${myCartProductList }" var="product">
						<div class="card mb-3 overflow-auto">
							<div class="card-body">
								<div class="d-flex justify-content-between">
									<div class="d-flex flex-row align-items-center">
										<div class="col-2">
											<img src="${product.productImgurl }"
												class="img-fluid rounded-3" alt="Shopping item"
												style="width: 85px;">
										</div>
										<div class="col-6 mt-3">
											<h5 class="font-weight-bold">${product.name }</h5>
											<p class="small mb-0">${product.content.substring(0, 75) }...</p>
											<div class="d-flex flex-col mt-2">
												<p class="text-warning font-weight-bold">
													<c:set var="discount" value="${product.discountRate }" />
													<fmt:formatNumber type="number" value="${discount}" />
													% 할인
												</p>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<p class="font-italic text-dark">총 누적 포인트:</p>
												&nbsp;&nbsp;&nbsp;
												<p class="font-italic text-danger"
													id="point${product.sequence }">
													<c:set var="totalPoint"
														value="${(product.price * product.count) * product.pointAccumulationRate * 0.01 }" />
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${totalPoint}" />
												</p>
												&nbsp;
												<p class="font-italic text-dark">점</p>
											</div>

										</div>
										<div class="d-flex flex-row align-items-center col-4">
											<div class="d-flex flex-row align-items-center bg-light">
												<span id="countButtonDiv${product.sequence }"
													class="p-3 text-dark btn"
													onclick="reduceCount(${product.sequence}, ${product.productSequence}, ${logincust.sequence }, ${product.price }, ${product.discountRate }, ${product.pointAccumulationRate })">-</span>
												<h5 class="fw-normal mb-0 ml-2"
													id="product-count${product.sequence }">${product.count }</h5>
												<span id="countButtonDiv${product.sequence }"
													class="p-3 text-dark btn"
													onclick="addCount(${product.sequence}, ${product.productSequence}, ${logincust.sequence }, ${product.price }, ${product.discountRate }, ${product.pointAccumulationRate })">+</span>
											</div>
											<div class="ml-4" style="width: 100px;">
												<h5 class="mb-0" style="font-size: 15px; font-weight: 700;"
													id="price${product.sequence }">
													<c:set var="price"
														value="${(product.price * ((100 - product.discountRate) * 0.01)) * product.count - ((product.price * ((100 - product.discountRate) * 0.01)) * product.count)%10 }" />
													<fmt:formatNumber type="number" maxFractionDigits="3"
														value="${price}" />
													원
												</h5>
											</div>
											<span class="icon_close btn"
												onclick="open_modal(${product.productSequence }, ${logincust.sequence }, '${product.name }')"></span>
											<input id="cart_checkbox${product.sequence }" class="ml-4"
												type="checkbox"
												onclick="is_checked(${product.sequence }, ${product.count }, ${product.price }, ${product.discountRate }, ${product.pointAccumulationRate })">
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
					<br />
					<div class="d-flex flex-col">
						<h4 id="totalCount" style="border: none">총 주문 금액: 0원</h4>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<h4 id="totalPoint" style="border: none">총 누적 포인트: 0점</h4>
					</div>
					<button type="submit"
						class="site-btn bg-danger text-white border-0 rounded-sm col-12"
						onclick="cart_to_order()">주문하기</button>
				</c:otherwise>
			</c:choose>

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
								<div class="d-flex flex-row align-items-center w-100">
									<div>
										<img src=${orderDetail.orderDetailProduct.productImgurl }
											class="img-fluid rounded-3" alt="Shopping item"
											style="width: 65px;">
									</div>
									<div class="ml-3 w-100">
										<h5>${orderDetail.orderDetailProduct.name}</h5>
										<p class="small mb-0">${orderDetail.state}</p>
										<button type="button"
											id="reviewButton-${order.sequence}-${orderDetail.sequence}"
											class="py-2 col-sm-3 bg-primary text-white border-0 rounded-sm review-toggle-btn"
											data-toggle="collapse"
											data-target="#reviewCollapse-${order.sequence}-${orderDetail.sequence}"
											style="display: inline-block; ${orderDetail.state eq 'CONFIRMED' ? '' : 'display: none;'}">리뷰
											작성하기</button>

										<button type="submit"
											class="py-2 col-sm-3 bg-secondary text-white border-0 rounded-sm"
											style="${orderDetail.state eq 'RECEIVED' ? '' : 'display: none;'}">환불
											요청</button>
										<button type="submit"
											class="py-2 col-sm-3 bg-danger text-white border-0 rounded-sm"
											style="${orderDetail.state eq 'RECEIVED' ? '' : 'display: none;'}">주문
											확정</button>
									</div>
									<!-- <div
										class="ml-3 d-flex justify-content-between align-items-center">
										
									</div> -->
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
						<div id="reviewCollapse-${order.sequence}-${orderDetail.sequence}"
							class="collapse">
							<form name="frm" id="ratingForm" action="review.bit">
								<input type="hidden" name="cmd" value="register"> <input
									type="hidden" name="memberSequence"
									value="${logincust.sequence }"> <input type="hidden"
									name="productSequence" value="${orderDetail.productSequence}">
								<input class="rating-input" type="hidden" name="rating" required>
								<span> 별점을 남겨주세요 </span> <span style="color: red;">*</span>
								<div class="star-rating">
									<div class="stars">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i>
									</div>
								</div>
								<div class="alert alert-danger mt-4"
									id="alert-${order.sequence}-${orderDetail.sequence}"
									style="display: none;">별점을 클릭해주세요</div>


								<textarea name="comment" class="form-control review-textarea"
									rows="3" placeholder="리뷰를 자유롭게 작성해주세요." maxlength="200"
									
									required></textarea>
								<button type="button" id="submitBtn"
									class="site-btn mx-1 text-white border-0 rounded-sm mt-2"<%-- value="#reviewButton-${order.sequence}-${orderDetail.sequence}" --%>
									<%-- onclick="valid_check();" --%>
									<%-- onClick="valid_check(alert-${order.sequence}-${orderDetail.sequence},${orderDetail.sequence})" --%>
									>리뷰
									제출</button>
								<button type="button"
									class="site-btn mx-1 bg-secondary text-white border-0 rounded-sm cancel-review-btn"
									data-toggle="collapse"
									data-target="#reviewCollapse-${order.sequence}-${orderDetail.sequence}">취소</button>
							</form>
						</div>
					</c:forEach>
				</div>

			</c:forEach>
		</div>

	</div>
</section>
<!-- Checkout Section End -->
<!-- Review Section Begin -->
<section class="checkout spad">
	<div class="container">
		<div class="row"></div>
		<div class="checkout__form">
			<h4>작성 가능한 리뷰</h4>
			주문 확정 목록
		</div>
	</div>
</section>
<!-- Review Section Begin -->
<section class="checkout spad">
	<div class="container">
		<div class="row"></div>
		<div class="checkout__form">
			<h4>작성된 리뷰 목록</h4>
			<c:forEach items="${myReviewList}" var="review" varStatus="status">
				<div class="card mb-3 border-0">
					<div class="card-body">
						<div class="d-flex justify-content-between">
							<div class="d-flex flex-row align-items-center w-100">
								<div class="mr-3">${status.index+1 }.</div>
								<div>
									<img src=${review.reviewDetailProduct.productImgurl }
										class="img-fluid rounded-3" alt="Shopping item"
										style="width: 65px;">
								</div>
								<div class="ml-3 w-100">
									<h5>${review.reviewDetailProduct.name }</h5>
									<%-- <p class="small mb-0">${orderDetail.state}</p> --%>
								</div>
								<!-- <div
										class="ml-3 d-flex justify-content-between align-items-center">
										
									</div> -->
							</div>
							<div class="d-flex flex-row align-items-center">
								<%-- <div style="width: 80px;">
										<h5 class="fw-normal mb-0">수량: ${review.reviewDetailProduct.count}</h5>
									</div> --%>
								<%-- <div style="width: 100px;">
										<h5 class="mb-0">${orderDetail.productPrice * orderDetail.count}원</h5>
									</div> --%>
							</div>

						</div>
					</div>
					<div id="reviewList-${review.sequence}">

						<%-- <input type="hidden" name="cmd" value="register"> <input
								type="hidden" name="memberSequence"
								value="${logincust.sequence }"> <input type="hidden"
								name="productSequence" value="${orderDetail.productSequence}">
							<input class="rating-input" type="hidden" name="rating" value=""
								required> <span> 별점을 남겨주세요 </span> <span
								style="color: red;">*</span> --%>

						<div class="star-rating">
							<div class="stars">
								<c:forEach var="i" begin="1" end="5">
									<c:choose>
										<c:when test="${i <= review.rating}">
											<i class="fa fa-star active"></i>
										</c:when>
										<c:otherwise>
											<i class="fa fa-star"></i>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>

						<textarea id="textarea-${review.sequence}" name="comment" class="form-control"
							rows="3" style="background-color: #f1f3f5; resize: none;"
							placeholder="리뷰를 자유롭게 작성해주세요." maxlength="200" disabled
							>${review.comment } </textarea>
						<button type="button" id="editBtn-${review.sequence}"
							class="site-btn edit-review-btn mx-1 text-white border-0 rounded-sm mt-2"
							onclick="enableTextarea(${review.sequence })"
							>수정</button>
						<%-- 						<button type="submit" id="submitBtn"
							class="site-btn edit-review-btn mx-1 text-white border-0 rounded-sm mt-2"
							value="#reviewButton-${review.sequence}" onclick="enableEdit(${review.sequence})">수정</button> --%>
						<button type="button"
							class="site-btn mx-1 bg-secondary text-white border-0 rounded-sm cancel-review-btn"
							data-toggle="collapse"
							data-target="#reviewCollapse-${review.sequence}">삭제</button>
					</div>

				</div>

				<div style="padding-top: 20px;">
					<hr>
				</div>

			</c:forEach>
		</div>
	</div>
</section>
<!-- Review Section End -->

<!-- Modal -->
<div id="modal">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">장바구니 삭제</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close" onclick="close_modal()">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body" id="modal-body">해당 상품을 장바구니에서 삭제하시겠습니까?
			</div>
			<div class="modal-footer">
				<button class="btn btn-secondary text-light" data-dismiss="modal"
					onclick="close_modal()">아니오</button>
				<button id="delete_yes" class="btn btn-danger text-light"
					data-dismiss="modal" onclick="cart_delete()">&nbsp;&nbsp;&nbsp;&nbsp;예&nbsp;&nbsp;&nbsp;&nbsp;</button>
			</div>
		</div>
	</div>
</div>
<script>
	var totalPrice = 0;
	var totalPoint = 0;
	var selectedCart = [];
	function is_checked(sequence, count, price, discountRate, pointAccumulationRate) {
		
		const checkbox = document.getElementById('cart_checkbox' + sequence);

		if (checkbox.checked) {
			selectedCart.push(sequence);
			var strPrice = document.getElementById("price" + sequence).innerText.split(" ")[0];
			var strPoint = document.getElementById("point" + sequence).innerText.split(": ")[0];
			
			var priceList = strPrice.split(",");
			var tmp1 = 0;
			var k = 0;
			for(var i=priceList.length-1; i>=0; i--) {
				var j = 1000**(i);
				tmp1 += priceList[k++] * j;
			}
			totalPrice = totalPrice + tmp1;
			
			var pointList = strPoint.split(",");
			var tmp2 = 0;
			var k = 0;
			for(var i=pointList.length-1; i>=0; i--) {
				var j = 1000**(i);
				tmp2 += pointList[k++] * j;
			}
			totalPoint = totalPoint + tmp2;

		} else {
			selectedCart.pop();
			var strPrice = document.getElementById("price" + sequence).innerText.split(" ")[0];
			var strPoint = document.getElementById("point" + sequence).innerText.split(": ")[0];
			
			var priceList = strPrice.split(",");
			var tmp1 = 0;
			var k = 0;
			for(var i=priceList.length-1; i>=0; i--) {
				var j = 1000**(i);
				tmp1 += priceList[k++] * j;
			}
			totalPrice = totalPrice - tmp1;
			
			var pointList = strPoint.split(",");
			var tmp2 = 0;
			var k = 0;
			for(var i=pointList.length-1; i>=0; i--) {
				var j = 1000**(i);
				tmp2 += pointList[k++] * j;
			}
			totalPoint = totalPoint - tmp2;
		}
		
		document.getElementById("totalCount").innerHTML = "총 주문 금액: " + totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + " 원,";
		document.getElementById("totalPoint").innerHTML = "총 누적 포인트: " + totalPoint.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + " 점";	
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
	function addCount(sequence, productSeq, memberSeq, price, discountRate, pointAccumulationRate) {
		var count = Number($('#product-count' + sequence).text() * 1);
		
		const checkbox = document.getElementById('cart_checkbox' + sequence);
		
		if (checkbox.checked) {
			
		} else {
			$.ajax({
				url:'rest.bit?view=changeCount&sequence=' + sequence + '&productSequence=' + productSeq + '&count=' + (count+1) + '&memberSeq=' + memberSeq,
				success:function(result){
					if (result === 0) {
						alert("재고 이상의 상품을 담을 수 없습니다!");
					} else {
						$('#product-count' + sequence).text(result);
						$("#price" + sequence).text(((price * ((100 - discountRate) * 0.01)) * (count+1) - ((price * ((100 - discountRate) * 0.01)) * (count+1))%10).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$('#point' + sequence).text((Math.floor(price * (count+1) * pointAccumulationRate * 0.01)).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
					}
				}
			});
		}
		
		
		
	}
	function reduceCount(sequence, productSeq, memberSeq, price, discountRate, pointAccumulationRate) {
		var count = Number($('#product-count' + sequence).text());
		
		const checkbox = document.getElementById('cart_checkbox' + sequence);
		
		if (checkbox.checked) {
			
		} else {
			$.ajax({
				url:'rest.bit?view=changeCount&sequence=' + sequence + '&productSequence=' + productSeq + '&count=' + (count-1) + '&memberSeq=' + memberSeq,
				success:function(result){
					$('#product-count' + sequence).text(result);
					if (count <= 1) {
						$("#price" + sequence).text(((price * ((100 - discountRate) * 0.01)) * (1) - ((price * ((100 - discountRate) * 0.01)) * (1))%10).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$('#point' + sequence).text((Math.floor(price * (1) * pointAccumulationRate * 0.01)) + " 점");
					} else {
						$("#price" + sequence).text(((price * ((100 - discountRate) * 0.01)) * (count-1) - ((price * ((100 - discountRate) * 0.01)) * (count-1))%10).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",") + " 원");
						$('#point' + sequence).text((Math.floor(price * (count-1) * pointAccumulationRate * 0.01)).toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
					}
				}
			});
		}
		
	}
</script>