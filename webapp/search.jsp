<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<%@ page
	import="app.dto.response.SearchResult, app.dto.mapper.SearchProductMapper, java.util.List"%>

<%
// ProductDetailWithReviews 객체 받아오기
SearchResult searchResult = (SearchResult) request.getAttribute("searchResult");
List<SearchProductMapper> searchedList = searchResult.getSearchList();

int endPage = (int) Math.ceil((double) searchResult.getCategoryCount() / 9.0);
pageContext.setAttribute("endPage", endPage);
%>


<style type="text/css">
.star { //
	color: #EDBB0E;
	color: #ffc107;
	letter-spacing: -1.2px;
}

.book-title {
	overflow: hidden;
	text-overflow: ellipsis;
	display: inline;
	font-size: 1.3em; /* 글자 크기 */
	font-weight: bold; /* 글자 두께 */
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
							<li class="active"><a href="main.bit?view=mypage"><i
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
						<li><a href="main.bit"
							style="font-size: 20px; font-weight: 700;">홈</a></li>
						<li class="active"><a href="category.bit?view=1"
							style="font-size: 20px; font-weight: 700;">도서 전체</a></li>
						<li><a href="main.bit?view=contact"
							style="font-size: 20px; font-weight: 700;">고객센터</a></li>
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
					<h2>검색 결과</h2>
					<div class="breadcrumb__option">
						<a href="./index.jsp">Home</a> <span>검색 결과</span>

					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<!-- Breadcrumb Section End -->

<!-- Shoping Cart Section Begin -->

<section class="product spad">

	<div class="container mb-4">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<span>"${searchResult.searchKeyword}"</span> <span>검색결과</span> <span>${searchResult.totalCount}</span>
				<span>건</span>
			</div>

			<c:if test="${searchResult.categoryCount != null}">
				<div>"${searchResult.currentCategoryName}" 카테고리
					${searchResult.categoryCount}건</div>
			</c:if>



			<div style="margin-left: auto; text-align: right;">
				<!-- 드롭다운 메뉴를 생성하고 선택한 옵션에 따라 요청을 보내는 함수를 호출합니다. -->
				<select id="orderby" style="margin-left: auto;"
					onchange="changeOrderBy(this.value)">
					<option name="popular" value="popular">인기순</option>
					<option name="high_to_low" value="high_to_low">높은 가격순</option>
					<option name="low_to_high" value="low_to_high">낮은 가격순</option>
					<option name="latest" value="latest">최신순</option>
					<option name="sales" value="sales">판매량순</option>
				</select>
			</div>


		</div>
	</div>


	<div class="container">
		<div class="row">
			<div class="col-lg-3 col-md-5">
				<div class="sidebar" style="position: sticky; top: 32px;">
					<div class="sidebar__item">
						<h4 onclick="removeCategory()" style="cursor: pointer;">전체
							카테고리</h4>
						<ul>
							<li value="1" onclick="updateCategory(this)"><a href="#"
								class="font-weight-bold">컴퓨터 / IT</a></li>
							<li value="2" onclick="updateCategory(this)"><a href="#"
								style="text-indent: 20px">컴퓨터 공학
									(${searchResult.countByCategory['컴퓨터공학'] != null ? searchResult.countByCategory['컴퓨터공학'] : 0})</a></li>
							<li value="3" onclick="updateCategory(this)"><a href="#"
								style="text-indent: 20px">데이터베이스
									(${searchResult.countByCategory['데이터베이스'] != null ? searchResult.countByCategory['데이터베이스'] : 0})</a></li>
							<li value="4" onclick="updateCategory(this)"><a href="#"
								style="text-indent: 20px">네트워크
									(${searchResult.countByCategory['네트워크'] != null ? searchResult.countByCategory['네트워크'] : 0})</a></li>
							<li value="5" onclick="updateCategory(this)"><a href="#"
								style="text-indent: 20px">프로그래밍
									(${searchResult.countByCategory['프로그래밍'] != null ? searchResult.countByCategory['프로그래밍'] : 0})</a></li>
							<li value="6" onclick="updateCategory(this)"><a href="#"
								class="font-weight-bold">소설</a></li>
							<li value="7" onclick="updateCategory(this)"><a href="#"
								style="text-indent: 20px">한국소설
									(${searchResult.countByCategory['한국소설'] != null ? searchResult.countByCategory['한국소설'] : 0})</a></li>
							<li value="8" onclick="updateCategory(this)"><a href="#"
								style="text-indent: 20px">영미소설
									(${searchResult.countByCategory['영미소설'] != null ? searchResult.countByCategory['영미소설'] : 0})</a></li>
							<li value="9" onclick="updateCategory(this)"><a href="#"
								style="text-indent: 20px">일본소설
									(${searchResult.countByCategory['일본소설'] != null ? searchResult.countByCategory['일본소설'] : 0})</a></li>
							<li value="10" onclick="updateCategory(this)"><a href="#"
								class="font-weight-bold">경제 / 경영</a></li>
							<li value="11" onclick="updateCategory(this)"><a href="#"
								style="text-indent: 20px">경영일반
									(${searchResult.countByCategory['경영일반'] != null ? searchResult.countByCategory['경영일반'] : 0})</a></li>
							<li value="12" onclick="updateCategory(this)"><a href="#"
								style="text-indent: 20px">재테크/금융
									(${searchResult.countByCategory['재테크/금융'] != null ? searchResult.countByCategory['재테크/금융'] : 0})</a></li>
							<li value="13" onclick="updateCategory(this)"><a href="#"
								style="text-indent: 20px">유통/창업
									(${searchResult.countByCategory['유통/창업'] != null ? searchResult.countByCategory['유통/창업'] : 0})</a></li>
							<li value="14" onclick="updateCategory(this)"><a href="#"
								style="text-indent: 20px">세무/회계
									(${searchResult.countByCategory['세무/회계'] != null ? searchResult.countByCategory['세무/회계'] : 0})</a></li>
						</ul>
					</div>
				</div>
			</div>

			<!-- TODO:조건부로 검색결과 없다고 띄우기  -->

			<c:choose>
				<c:when test="${searchResult.totalCount eq 0}">
					<div
						class="d-flex flex-column align-items-center justify-content-center col-lg-9">
						<div class="my-5">
							<span>${searchResult.searchKeyword}</span> <span>에 대한
								검색결과가 없습니다.</span>
						</div>
						<p>입력한 검색어의 철자 또는 띄어쓰기가 정확한지 다시 한번 확인해 주세요.</p>
					</div>
				</c:when>
				<c:otherwise>

					<div class="col-lg-9 pr-0">
						<div class="shoping__cart__table">

							<c:forEach var="item" items="${searchResult.searchList}">
								<div class="pagination_item">
									<fmt:parseDate value="${item.createdAt}"
										pattern="yyyy-MM-dd HH:mm:ss" var="parsedDate" />
									<fmt:formatDate value="${parsedDate}" pattern="yyyy년 MM월"
										var="formattedDate" />

									<div class="d-flex col-lg-12 py-4 pr-0"
										style="border-top: 1px solid #d5d5d5; transition: box-shadow 0.3s, cursor 0.3s;"
										onmouseover="this.style.cursor='pointer'; this.style.boxShadow='0px 4px 8px rgba(0, 0, 0, 0.1)'"
										onmouseout="this.style.cursor='default'; this.style.boxShadow='none'"
										onclick="redirectToProductDetail(${item.sequence}); return false;">

										<div class="mr-4 shoping__cart__item">
											<img src="${item.productImgurl }" class="img-fluid rounded-3"
												style="width: 150px;" alt="" />
										</div>

										<div class="d-flex flex-column justify-content-center">
											<div class="my-2" style="max-width: 25vw;">
												<span>[도서] </span> <span
													class="font-weight-bold  book-title">${item.name}</span>
											</div>
											<div>
												<span>${item.authorName}</span> <span>저</span> <br
													class="my-2" /> <span>${item.publisherName}</span> <span>${formattedDate}</span>
											</div>
											<div class="mt-1">
												<span class="text-warning font-weight-bold"> <c:set
														var="discount" value="${item.discountRate }" /> <fmt:formatNumber
														type="number" value="${ discount }" pattern="#,##0" /> %
													할인
												</span><span> <fmt:formatNumber type="number"
														value="${item.discountedPrice }" pattern="#,##0" />
												</span> 원 <span
													style="text-decoration: line-through; color: #767676;">
													<fmt:formatNumber type="number" value="${item.price}"
														pattern="#,##0" />
												</span> <span> | ${item.pointAccumulation}p
													(${item.pointAccumulationRate}%)</span>
											</div>
											<div class="mt-2">
												<span>판매지수: ${item.popularity } |</span> <span>회원리뷰(</span>
												<span class="text-primary">${item.reviewCount }</span> <span>건)</span>



												<span class="product__details__rating star"> <c:set
														var="fullStars" value="${Math.floor(item.ratingAvg)}" />
													<c:set var="halfStar"
														value="${item.ratingAvg % 1 >= 0.5 ? 1 : 0}" /> <c:set
														var="emptyStars" value="${5 - fullStars - halfStar}" /> <c:forEach
														var="i" begin="1" end="${fullStars}">
														<i class="fa fa-star"></i>
													</c:forEach> <c:if test="${halfStar == 1}">
														<i class="fa fa-star-half-o"></i>
													</c:if> <c:forEach var="i" begin="1" end="${emptyStars}">
														<i class="fa fa-star-o"></i>
													</c:forEach>


												</span> <span>${item.ratingAvg}</span>
											</div>
										</div>

										<div class="d-flex flex-column justify-content-center"
											style="margin-left: auto; margin-right: 10px;">
											<c:choose>
												<c:when test="${item.getStock() > 0}">
													<a href="#"
														class="primary-btn cart-btn cart-btn-right mb-2"
														onclick='addToCart(${item.sequence}, ${logincust.sequence}); event.stopPropagation(); return false;'>장바구니에
														넣기</a>
													<a href="#" class="primary-btn text-white btn"
														onclick='checkOutBuyNow(${item.sequence}, ${logincust.sequence}); event.stopPropagation(); return false;'>바로
														구매</a>
												</c:when>
												<c:otherwise>
													<a href="#"
														class="primary-btn cart-btn cart-btn-right mb-2 btn"
														style="background: #c8c8c8; width:177.05px;"
														onclick='event.stopPropagation(); return false;'>ㅤ품절 상품ㅤ
														</a>

												</c:otherwise>
											</c:choose>
										</div>

									</div>
								</div>
							</c:forEach>

						</div>
					</div>
				</c:otherwise>
			</c:choose>

		</div>


		<div style="text-align: center;" class="product__pagination">




			<c:forEach begin="1" end="${endPage}" var="pageNum">
				<a style="margin: 0" href="javascript:void(0);"
					onclick="showSelectedPage(${pageNum}); console.log(${pageNum});"
					id="btnNum${pageNum}">${pageNum} </a>
			</c:forEach>
		</div>


	</div>
</section>
<!-- Product Section End -->
<!-- Shoping Cart Section End -->


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



<script>
		
		$(document).ready(function () {
		    var currentURL = new URL(window.location.href);
		    var selectedOrderBy = currentURL.searchParams.get("orderby");
		    var displayText;

		    switch (selectedOrderBy) {
		        case 'popular':
		            displayText = '인기순';
		            break;
		        case 'high_to_low':
		            displayText = '높은 가격순';
		            break;
		        case 'low_to_high':
		            displayText = '낮은 가격순';
		            break;
		        case 'latest':
		            displayText = '최신순';
		            break;
		        case 'sales':
		            displayText = '판매량순';
		            break;
		        default:
		        	displayText = '인기순';
		           break; 
		    }

		    document.querySelector(".current").setAttribute("id", "current");
		    if (selectedOrderBy !== '') {
		    	const test = document.getElementById("current");
		    	test.innerText = displayText; 
		    }
		});
		
		
		function setOrderByDropdownValue() {
		    var currentURL = new URL(window.location.href);
		    var selectedOrderBy = currentURL.searchParams.get("orderby");
		    
		    if (selectedOrderBy) {
		        var orderByDropdown = document.getElementById("orderby");
		        orderByDropdown.value = selectedOrderBy;
		    }
		}

		window.onload = setOrderByDropdownValue;


        // 정렬 기준을 변경.
        function changeOrderBy(orderBy) {
            var currentURL = window.location.href;
            
            // 쿼리 스트링에서 orderby 값을 변경.
            var newURL = currentURL.replace(/(\?|&)orderby=[^&]*/, '');
            if (newURL.indexOf('?') === -1) {
                newURL += '?';
            } else {
                newURL += '&';
            }
            newURL += 'orderby=' + orderBy;
            
            // 변경된 URL로 페이지를 이동.
            window.location.href = newURL;
        }
        
        // 카테고리 변경
        function updateCategory(element) {
            var categoryValue = element.getAttribute('value');
            var url = window.location.href;

            if (url.indexOf('?') > -1) {
                if (url.indexOf('category=') > -1) {
                    url = url.replace(/(category=)[^\&]+/, '$1' + categoryValue);
                } else {
                    url += '&category=' + categoryValue;
                }
            } else {
                url += '?category=' + categoryValue;
            }

            window.location.href = url;
        }
        
        
        function redirectToProductDetail(sequence) {
            var productDetailURL = 'product-detail.bit?view=shop-details&sequence=' + sequence;
            window.location.href = productDetailURL;
        }
        
        
        $(document).ready(function() {
    		$("#addToCartButton").click(function() {
    			$("#addToCartModal").modal("show");
    		});
    	});
    	
    	function addToCart(productSeq, memberSeq) {
    		if (memberSeq === undefined) {
    	        alert("로그인이 필요합니다.");
    	        return;
    	    }
    		
    		
    		
    		$.ajax({
    			url:'rest.bit?view=addToCart&productSequence=' + productSeq + '&count=' + 1 + '&memberSeq=' + memberSeq,
    			success:function(result){
    				
    				if (result === 0) {
    					alert("카트에 넣는 도중 오류가 발생했습니다. 다시 시도해주세요.");
    				} else {
    					 $('#addToCartModal').modal('show');
    					
    				}
    			}
    		});
    	}
    	
    	function checkOutBuyNow(productSeq, memberSeq) {
    	    // var count = Number($('#productQuantity').val());
    	    if (memberSeq === undefined) {
    	        alert("로그인이 필요합니다.");
    	        return;
    	    }
    	    // Redirect to the checkout page with the specified count and product ID
    	    window.location.href = 'main.bit?view=checkoutbuynow&count=' + 1 + '&productId=' + productSeq + '&memberSeq=' + memberSeq;
    	}
    	
        // 이하, 페이지네이션 관련 코드
        let itemsPerPage = 9; // 페이지당 아이템 개수
        let currentPage = 1; // 현재 페이지 번호
        let totalItems = ${searchResult.categoryCount}; // 해당 카테고리 총 개수
        let totalPages = Math.ceil(totalItems / itemsPerPage); // 총 페이지 개수
    	
    	 function setActiveButton(buttonId) {
           let buttons = document.querySelectorAll(".product__pagination a");
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
       
       
       function showSelectedPage(pageNum) {
          console.log(pageNum);

           currentPage = pageNum;

           
           let startIndex = (currentPage - 1) * itemsPerPage;
           let endIndex = Math.min(startIndex + itemsPerPage, totalItems);

           
           let allItems = document.querySelectorAll('.pagination_item');
           allItems.forEach(function(item, index) {
               if (index >= startIndex && index < endIndex) {
                   item.style.display    = 'block';
               } else {
                   item.style.display = 'none';
               }
           });
           setActiveButton("btnNum" + currentPage);
       }
       
       function removeCategory() {
    	    var url = new URL(window.location.href);
    	    var params = url.searchParams;
    	    params.delete('category');
    	    window.location.href = url.toString();
    	}



       showSelectedPage(currentPage);
    	

</script>
