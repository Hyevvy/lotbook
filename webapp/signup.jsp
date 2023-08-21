<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	<div class="d-flex flex-row justify-content-center">
		<div class="justify-content-center" align="center">
		<table class="col-10">
			<tr height="40">
				<td align="center"><b>[회원가입]</b></td>
			</tr>
		</table>
		<table width="700" height="600" cellpadding="0" class="col-6"
			style="border-collapse: collapse; font-size: 9pt;">
			<tr class="register" height="30">
				<td width="5%" align="center">*</td>
				<td width="15%"><label for="email">이메일</label></td>
				<td>
					<div class="row">
						<input type="email" class="form-control" name="email" id="email" placeholder="ex) abc@gmail.com">
					</div>		
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr class="register" height="30">
				<td width="5%" align="center">*</td>
				<td width="15%"><label for="password">비밀번호</label></td>
				<td>
				<div class="row">
					<input type="password" class="form-control"
					placeholder="ex) qwerty!123" id="password" name="password">
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
				<td width="5%" align="center">*</td>
				<td width="15%"><label for="name">이름</label></td>
				<td>
					<div class="row">
					<input type="text" class="form-control"
						placeholder="ex) 홍길동 " id="name" name="name">
					</div>
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<!-- <tr class="register" height="30">
				<td width="5%" align="center">*</td>
				<td width="15%">성 별</td>
				<td>남 성<input type="radio" name="wUserGender" value="1" checked />&nbsp;여
					성<input type="radio" name="wUserGender" value="2" />
				</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr> -->
			<tr class="register" height="30">
				
					<td width="5%" align="center">*</td>
					<td width="15%"><label for="phone">휴대전화</label></td>
					<td>
					<div class="row">
						<input type="text" class="form-control" name="phone" id="phone" placeholder="ex) 01012345678">
					</div>
					</td>
			</tr>
			<tr height="7">
				<td colspan="3"><hr /></td>
			</tr>
			<tr>
				<td width="5%" align="center">*</td>
				<td width="15%">주 소</td>
				<td>
					<div class="row hero_search"> 
								
						<input type="text" id="sample6_postcode" class="form-control col-8" placeholder="우편번호" name="zipcode">
						<input type="button" onclick="getAddress()" class="col-4" value="우편번호 찾기"> <br/>
						<input type="text" id="sample6_address" class="form-control" placeholder="주소" name="street_address_1"><br/>
						<input type="text" id="sample6_extraAddress" class="form-control" placeholder="참고항목" name="street_address_2">
						<input type="text" id="sample6_detailAddress" class="form-control" placeholder="상세주소" name="address_detail">
						
					</div>
				</td>
			</tr>
	
		</table>
		<button type="submit" id="register_btn" class="site-btn"> 회원가입</button>
		<input type="button" id="cancel_btn" class="btn btn-secondary" onclick="location.href='main.bit'" value="취소" style="width:7.5rem; height:3rem"/>
		</div>
		</div>
	</form>


<!-- 

<div class="form-group">
	<label for="email">이메일:</label> <input type="text" class="form-control"
		placeholder="Enter email" id="email" name="email"> <span
		id="check_email"></span>
</div>
<div class="form-group">
	<label for="password">비밀번호:</label> <input type="password"
		class="form-control" placeholder="Enter password" id="password"
		name="password">
</div>
<div class="form-group">
		<label for="password2">비밀번호 확인:</label> 
		<input type="password" class="form-control" placeholder="Enter password2" id="password2" name="password2">
	</div>
<div class="form-group">
	<label for="pwd">이름:</label> <input type="text" class="form-control"
		placeholder="Enter name" id="name" name="name">
</div>
<div class="form-group">
	<label for="phone">전화번호:</label> <input type="text"
		class="form-control" placeholder="Enter phone" id="phone" name="phone">
</div>
<div class="form-group">
	<label for="pwd">주소:</label> <input type="text" class="form-control"
		placeholder="Enter name" id="name" name="name">
</div>
<div class="form-group form-check">
	<label class="form-check-label"> <input
		class="form-check-input" type="checkbox"> Remember me
	</label>
</div>
<button type="button" id="register_btn" class="btn btn-primary">Submit</button>
</form> -->

<!-- <div class="hero__search">
	<div class="hero__search__form"></div>
</div>
<div class="hero__search">
	<div class="hero__search__form">
		<form action="#">
			<div class="hero__search__categories">비밀번호</div>
			<input type="password" placeholder="비밀번호를 입력해주세요.">
		</form>
	</div>
</div>


<div class="hero__search">
	<div class="hero__search__form">
		<form action="#">
			<div class="hero__search__categories">이름</div>
			<input type="password" placeholder="멤버 이름을 입력해주세요.">
		</form>
	</div>
</div> -->

<!-- <div class="hero__search">
	<div class="hero__search__form">
		<form action="#">
			<div class="hero__search__categories">우편번호</div>
			<div>
				<input type="text" id="sample6_postcode" placeholder="우편번호">
			</div>

		</form>
	</div>
</div>

<div class="hero_search">
	<input type="button" onclick="getAddress()" value="우편번호 찾기"><br>

	<input type="text" id="sample6_address" placeholder="주소"><br>
	<input type="text" id="sample6_detailAddress" placeholder="상세주소">
	<input type="text" id="sample6_extraAddress" placeholder="참고항목">
</div> -->

