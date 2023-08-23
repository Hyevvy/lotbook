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
		                        <li class="">
		                            <a href="/lotbook/signup.jsp"><i class="fa fa-user"></i> 로그아웃</a>
		                        </li>
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
                        <ul id="header__menus">
                            <li><a href="./index.jsp">Home</a></li>
                            <li><a href="main.bit?view=shop-grid">Shop</a></li>
                            <li><a href="#">Pages</a>
                                <ul class="header__menu__dropdown">
                                    <li><a href="main.bit?view=shop-details">Shop Details</a></li>
                                    <li><a href="main.bit?view=shoping-cart">Shoping Cart</a></li>
                                    <li><a href="main.bit?view=checkout">Check Out</a></li>
                                    
                                </ul>
                            </li>
                            <li><a href="main.bit?view=contact">Contact</a></li>
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
<div class="checkout__form">
	<form action="member.bit" method="post">
		<input type="hidden" name="view" value="loginimpl">
		<div class="row">
			<div class="col-lg-8 col-md-6 m-auto">

				<div class="col-lg-8">
					<div class="checkout__input m-auto">
						<p>
							아이디(이메일)<span>*</span>
						</p>
						<input type="email" class="form-control" name="email" id="email" placeholder="ex) abc@gmail.com">
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
