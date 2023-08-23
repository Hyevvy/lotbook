<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- Header Section Begin -->
<style>
@media (max-width: 650px) {
    .col-6 {
        width: 100%; /* 전체 너비를 차지하도록 설정 */
    }
    .col-6 table {
        width: 100%; /* 내부 테이블도 전체 너비를 차지하도록 설정 */
    }
    .col-6 td {
        display: block; /* 블록 레벨 요소로 표시하여 한 줄씩 표시되도록 설정 */
        width: 100%; /* 너비 100%로 설정 */
        box-sizing: border-box; /* 박스 모델 설정 */
        margin-bottom: 10px; /* 간격 추가 */
    }
    .col-6 .first-td {
        width: 5%; /* 두 번째와 세 번째 td를 반 너비로 설정 */
        display: inline-block;
    }
    .col-6 .second-td {
        width: 50%; /* 두 번째와 세 번째 td를 반 너비로 설정 */
        display: inline-block;
    }
    .col-10 .full-width {
        width: 100%; /* 첫 번째 td를 한 줄에 놓이도록 설정 */
    }
    .col-8 .first-input {
        width: 5%; /* 우편버튼 위로 */
        display: block;
    }
    .col-4 .second-input {
        width: 50%; /* 우편버튼 */
        display: block;
    }
}
</style>
<script>
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


<form id="register_form" method="post" action="member.bit">
	<input type="hidden" name="view" value="signup"/>
	<div class="d-flex flex-row justify-content-center ">
		<div class="justify-content-center" align="center">
			<!-- <table class="col-10">
				<tr height="40">
					<td class="full-width" align="center"><b>[회원가입]</b></td>
				</tr>
			</table> -->
			<div class="checkout__form full-width">
				<h4>회원가입</h4>
			</div>
			<table width="700" height="600" cellpadding="0" class="col-6"
				style="border-collapse: collapse; font-size: 9pt;">
				<tr class="register " height="30">
					<td width="5%" class="first-td text-danger" align="center"><span>*</span></td>
					<td width="20%" class="second-td"><label for="email">이메일</label></td>
					<td>
						<div class="row">
							<input type="email" class="form-control" name="email" id="email" placeholder="ex) abc@gmail.com" required>
						</div>		
					</td>
				</tr>
				<tr height="7">
					<td colspan="3"><hr /></td>
				</tr>
				<tr class="register" height="30">
					<td width="5%" class="first-td text-danger" align="center">*</td>
					<td width="20%" class="second-td"><label for="password">비밀번호</label></td>
					<td>
					<div class="row form_ip_pw" style="position:relative;">
						<input type="password" class="form-control"
						placeholder="ex) qwerty!123" id="password" name="password" required>
						<i class="fa fa-eye-slash fa-lg" style="position: absolute; top: 50%; transform: translateY(-50%); right: 10px; cursor: pointer; font-size: 22px;"></i>
					</div>
					</td>
				</tr>
				<tr height="7">
					<td colspan="3"><hr /></td>
				</tr>
				<!-- <tr class="register" height="30">
					<td width="5%" align="center">*</td>
					<td width="15%">비밀번호 확인</td>
					<td><input type="password" name="wUserPWConfirm" id="pwCheck"
						onchange="isSame()" />&nbsp;&nbsp;<span id="same"></span></td>
				</tr> 
				<tr height="7">
					<td colspan="3"><hr /></td>
				</tr> -->
				<tr class="register" height="30">
					<td width="5%" class="first-td text-danger" align="center">*</td>
					<td width="20%" class="second-td"><label for="name">이름</label></td>
					<td>
						<div class="row">
						<input type="text" class="form-control"
							placeholder="ex) 홍길동 " id="name" name="name" required>
						</div>
					</td>
				</tr>
				<tr height="7">
					<td colspan="3"><hr /></td>
				</tr>
				<tr class="register" height="30">
						<td width="5%" class="first-td text-danger" align="center">*</td>
						<td width="20%" class="second-td"><label for="phone">휴대전화</label></td>
						<td>
						<div class="row">
							<input type="text" class="form-control" name="phone" id="phone" placeholder="ex) 01012345678" required>
						</div>
						</td>
				</tr>
				<tr height="7">
					<td colspan="3"><hr /></td>
				</tr>
				<tr>
					<td width="5%" class="first-td text-danger" align="center">*</td>
					<td width="20%" class="second-td">주 소</td>
					<td>
						<div class="row hero_search"> 
							<input type="text" id="sample6_postcode" class="form-control col-8 first-input" placeholder="우편번호" name="zipcode" required>
							<input type="button" onclick="getAddress()" class="col-4 second-input" value="우편번호 찾기"> <br/>
							<input type="text" id="sample6_address" class="form-control" placeholder="주소" name="street_address_1"><br/>
							<input type="text" id="sample6_extraAddress" class="form-control" placeholder="참고항목" name="street_address_2">
							<input type="text" id="sample6_detailAddress" class="form-control" placeholder="상세주소" name="address_detail">
							
						</div>
					</td>
				</tr>
		
			</table>
			<div style="display: flex; gap: 10px; justify-content: center; margin-bottom:10px;">	
				<button type="submit" id="register_btn" class="site-btn"> 회원가입</button>
				<input type="button" id="cancel_btn" class="btn btn-secondary" onclick="location.href='main.bit'" value="취소" style="width:7.5rem; height:2.9rem; border-radius:0px; font:14px Cairo;">		
			</div>
		</div>
	</div>
</form>
