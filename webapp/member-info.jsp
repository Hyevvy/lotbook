<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header Section Begin -->
<%-- <script>
	<%=request.set(request.getAttribute("memberSeq"))%>
</script> --%>
<script>
	$(document).ready(function(){
		$('.form_ip_pw i, .form_ip_pw_redo i').on('click',function(){
		 	var input = $(this).closest('.form_ip_pw, .form_ip_pw_redo').find('input');
			  
			$('input').toggleClass('active');
			if($('input').hasClass('active')){
				$(this).attr('class', "fa fa-eye fa-lg")
				.prev('input').attr('type', "text");
			}else{
				$(this).attr('class', "fa fa-eye-slash fa-lg")
				.prev('input').attr('type',"password");
			}
		});
	});
	$(function(){
	  	$("#alert-success").hide();
        $("#alert-danger").hide();
        $("#inputPwRedo").keyup(function(){
            var pwd1=$("#inputPw").val();
            var pwd2=$("#inputPwRedo").val();
            console.log(pwd1+" ,"+pwd2);
            if(pwd1 != "" || pwd2 != ""){
                if(pwd1 == pwd2){
                    $("#alert-success").show();
                    $("#alert-danger").hide();
                    $("#register_btn").removeAttr("disabled");
                }else{
                    $("#alert-success").hide();
                    $("#alert-danger").show();
                    $("#register_btn").attr("disabled", "disabled");
                }    
            }
        });
	})
</script>
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
					<a href="main.bit"><img src="img/logo.png" alt=""></a>
				</div>
			</div>
			<div class="col-lg-6">
				<nav class="header__menu">
					<ul id="header__menus">
						<li><a href="./index.jsp">Home</a></li>
						<li><a href="category.bit?view=1">Shop</a></li>
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
			<form action="member.bit" method="post">
				<input type="hidden" name="view" value="updateinfoimpl">
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
						<input type="text" value="${logincust.name }" style="color:black; " name="name" required>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="checkout__input">
						<p>
							새 비밀번호<span>*</span>
						</p>
						<div class="form_ip_pw" style="position: relative;">
						    <input type="password" id="inputPw" required placeholder="새 비밀번호를 입력해 주세요" style="padding-right: 40px;">
						    <i class="fa fa-eye-slash fa-lg" style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px; cursor: pointer; font-size: 22px;"></i>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="checkout__input">
						<p>
							새 비밀번호 확인<span>*</span>
						</p>
						<div class="form_ip_pw_redo" style="position: relative;">
						    <input type="password" id="inputPwRedo" name="password" required placeholder="새 비밀번호를 한번더 입력해 주세요" style="padding-right: 40px;">
						    <i class="fa fa-eye-slash fa-lg" style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px; cursor: pointer; font-size: 22px;"></i>
						</div>
					</div>
					<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>
					<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
				</div>
				<div class="col-lg-6">
					<div class="checkout__input">
						<p>
							휴대전화<span>*</span>
						</p>
						<input type="text" value="${logincust.memberPhone }" style="color:black;" name="phone" required>
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

			<div class="row"></div>
		</div>
	</div>
</section>