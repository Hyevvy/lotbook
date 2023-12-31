<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<script>
window.onload = function(){
	let alertMsg = "<%=request.getAttribute("msg") %>";
	if(alertMsg.trim() !== "null" && alertMsg !== ""){
		alert(alertMsg);
	}
}
$(document).ready(function(){
	$('.form_ip_pw i').on('click',function(){
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
</script>
    <!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <nav class="header__menu header__top__right mobile-menu" style="padding: 5px 0">
			        <ul>
			        	<c:choose>
							<c:when test="${logincust != null }">
								<li class="active"><a href="main.bit?view=mypage&memberSeq=${logincust.sequence }"><i
									class="fa fa-user"></i> 마이페이지</a></li>
		                        <li class=""><a href="member.bit?view=logout"><i
									class="fa fa-user"></i> 로그아웃</a></li>
							</c:when>
							<c:otherwise>
								<li class="active">
		                            <a href="main.bit?view=signin"><i class="fa fa-user"></i> 로그인</a>
		                        </li>
		                        <li class="">
		                            <a href="main.bit?view=signup"><i class="fa fa-user"></i> 회원가입</a>
		                        </li>
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
							<li class="active"><a href="main.bit"  style="font-size: 20px; font-weight: 700;">홈</a></li>
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
                            <li><a href="main.bit?view=shopping-cart&memberSeq=${logincust.sequence }"><i class="fa fa-shopping-bag"></i> <span>${cartCount }</span></a></li>
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
<div class="checkout__form">
	<form action="member.bit" method="post">
		<input type="hidden" name="view" value="loginimpl">
		<div class="row" style="margin-top:5vh;">
			<div class="col-lg-5 col-md-6 m-auto d-flex flex-column align-items-center">

				<div class="col-lg-8">
					<div class="checkout__input m-auto">
						<p>
							아이디(이메일)<span>*</span>
						</p>
						<input type="email" class="form-control" name="email" id="email" placeholder="ex) abc@gmail.com" required>
					</div>

				</div>
				<div class="col-lg-8">
					<div class="checkout__input m-auto">
						<p>
							비밀번호<span>*</span>
						</p>
						<!-- <input type="password" required name="password" id="password"> -->
						<div class="form_ip_pw" style="position:relative;">
							<input type="password" class="form-control"
							placeholder="ex) qwerty!123" id="password" name="password" required>
							<i class="fa fa-eye-slash fa-lg" style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px; cursor: pointer; font-size: 22px;"></i>
						</div>
					</div>
					<button type="submit" class="site-btn auto-btn">로그인</button>
				</div>
			</div>
		</div>
	</form>
</div>
