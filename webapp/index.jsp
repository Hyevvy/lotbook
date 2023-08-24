<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zxx">

<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>LOTBOOK</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

<!-- Css Styles -->
<link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="css/nice-select.css" type="text/css">
<link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
<link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="css/style.css" type="text/css">
<link rel="stylesheet" href="css/common-style.css">
<link rel="icon" href="img/favicon.ico">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script defer src="js/signup.js"></script>
<script language="JavaScript" type="text/javascript"
	src="/js/jquery-1.2.6.min.js"></script>
</head>

<body>
	<!-- Page Preloder -->
	<div id="preloder">
		<div class="loader"></div>
	</div>
	<c:choose>
		<c:when test="${center != null }">
			<jsp:include page="${center }.jsp" />
		</c:when>
		<c:otherwise>
			<jsp:include page="main.jsp" />
		</c:otherwise>
	</c:choose>

	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 col-md-6 col-sm-6">
					<div class="footer__about">
						<div class="footer__about__logo">
							<a href="./index.html"><img src="img/logo.png" alt=""></a>
						</div>
						<ul>
							<li>주소: 서울특별시 서초구 서초대로74길 33</li>
							<li>연락처: 02-3486-1234</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
								Copyright &copy;
								<script>
									document.write(new Date().getFullYear());
								</script>
								All rights reserved | LOTBOOK
						</div>
						<div class="footer__copyright__payment">
							<img src="img/payment-item.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- Footer Section End -->


	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
	<script>
		(function() {
			var w = window;
			if (w.ChannelIO) {
				return w.console.error("ChannelIO script included twice.");
			}
			var ch = function() {
				ch.c(arguments);
			};
			ch.q = [];
			ch.c = function(args) {
				ch.q.push(args);
			};
			w.ChannelIO = ch;
			function l() {
				if (w.ChannelIOInitialized) {
					return;
				}
				w.ChannelIOInitialized = true;
				var s = document.createElement("script");
				s.type = "text/javascript";
				s.async = true;
				s.src = "https://cdn.channel.io/plugin/ch-plugin-web.js";
				var x = document.getElementsByTagName("script")[0];
				if (x.parentNode) {
					x.parentNode.insertBefore(s, x);
				}
			}
			if (document.readyState === "complete") {
				l();
			} else {
				w.addEventListener("DOMContentLoaded", l);
				w.addEventListener("load", l);
			}
		})();

		ChannelIO('boot', {
			"pluginKey" : "f6848ac6-3a4e-4ac4-a882-836f1e79f1cc"
		});
	</script>
	<script>
		function search(keyword) {
			// 키워드가 비어있는지 확인
			if (!keyword) {
				alert("검색어를 입력해주세요.");
				return;
			}

			// 키워드의 길이가 너무 짧은지 확인 (예: 2글자 이상)
			if (keyword.length < 2) {
				alert("검색어는 최소 2글자 이상 입력해주세요.");
				return;
			}

			//특수문자나 공백이 있는지 확인
			let special_pattern = /[`~!@#$%^&*|\\\'\";:\/?]/gi;
			if (special_pattern.test(keyword)) {
				alert("특수문자는 검색어로 사용하실 수 없습니다.");
				return;
			}

			if (!keyword.trim()) {
				alert("공백만으로 구성된 검색어는 사용하실 수 없습니다.");
				return;
			}

			window.location.href = 'search.bit?view=search&keyword=' + keyword
					+ '&orderby=popular'
		}
	</script>

</body>

</html>