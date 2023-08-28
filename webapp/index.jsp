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
<script src="https://t1.kakaocdn.net/kakao_js_sdk/2.3.0/kakao.min.js" integrity="sha384-70k0rrouSYPWJt7q9rSTKpiTfX6USlMYjZUtr1Du+9o4cGvhPAWxngdtVZDdErlh" crossorigin="anonymous"></script>
	
<!-- data-aos -->
<link rel="stylesheet" href="https://cdn.rawgit.com/michalsnik/aos/2.0.1/dist/aos.css" />
<script src="https://cdn.rawgit.com/michalsnik/aos/2.0.1/dist/aos.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js">
</script>

</head>

<style>
	::-webkit-scrollbar {
    width: 8px;  /* 스크롤바의 너비 */
	}
	
	::-webkit-scrollbar-thumb {
	    height: 30%; /* 스크롤바의 길이 */
	    background: #e70012; /* 스크롤바의 색상 */
	    
	    border-radius: 10px;
	}
	
	::-webkit-scrollbar-track {
	    background: rgba(231, 0, 18, .1);  /*스크롤바 뒷 배경 색상*/
	}
	.footerSection { 
		width: 1000px; 
		height: 400px; 
	}
	.footerSection .sky {
		position: absolute; 
		width: 100%; 
		height: 100%;
	}
	.footerSection .sky .sun {
		position: absolute; 
		top: -150px; 
		left: 50%; 
		margin-left: -100px; 
		transform-origin: center 500px; 
		animation: sun linear 20s infinite;
	}
	.footerSection .sky .cloud1 {
		position: absolute; 
		top: -30px; 
		left: 10%; 
		animation: flow linear 10s infinite;
	}
	.footerSection .sky .cloud2 {
		position: absolute; 
		top: 20px; 
		left: 0%; 	
		animation: flow linear 20s infinite;
	}
	.footerSection .town .night { 
		position: absolute; 
		bottom: 0px; 
		left: 40px;
	}
	.footerSection .town .day { 
		position: absolute; 
		bottom: 0px; 
		left: 40px;
		animation: day linear 20s infinite;
	}
	.footerSection .town .circle {
		position: absolute; 
		bottom: 104px; 
		left: 50%; 
		margin-left: -165px; 
		opacity: 0.7;
		animation: rotation linear 20s infinite; 	
	}
	.footerSection .people {	
		width: 100%; 
		height: 100%; 
		position: absolute; 
		top: 0px;
		left: 0px;
		animation: day linear 20s infinite;	
	}
	.footerSection .people .man {
		position: absolute;
		left: 0%;
		bottom: 0px;
		animation: flow linear 7s infinite;
	}
	.footerSection .people .family {
		position: absolute;
		left: 0%;
		bottom: 0px;
		animation: flow linear 20s infinite;
	}
	
	@keyframes rotation {
		0% {transform: rotate(0deg);}
		100% {transform: rotate(360deg);}
	}
	@keyframes sky {
		0% {background-color: #b08fcc;}
		25% {background-color: #b1e1e2;}
		50% {background-color: #fcd2e2;}
		75% {background-color: #636888;}
		100% {background-color: #b08fcc;}
	}
	@keyframes sun {
		0% {opacity:0; transform: rotate(-90deg);}
		25% {opacity:1; transform: rotate(-30deg);}
		50% {opacity:1; transform: rotate(30deg);}
		75% {opacity:0; transform: rotate(90deg);}
		100% {opacity:0; transform: rotate(-90deg);}
	}
	@keyframes day {
		0% {opacity: 0;}
		25% {opacity: 1;}
		50% {opacity: 1;}
		75% {opacity: 0;}
		100% {opacity: 0;}
	}
	@keyframes flow {
		0% { left: 0%; opacity: 0;}
		10% { opacity: 1; }
		80% { opacity: 1; }
		100% { left: 90%; opacity: 0;}
	}
	@keyframes fadeInUp {
        0% {
            opacity: 0;
            transform: translateY(0);
        }
        to {
            opacity: 1;
            transform: translateZ(0);
        }
    }
    @keyframes fadeOutDown {
        0% {
            opacity: 1;
            transform: translateZ(0);
        }
        to {
            opacity: 0;
            transform: translateY(0);
            display: none;
        }
    }
    #recentProdItem:hover {
    	background-color: #f3f6fa;
    }
</style>
<body style="overflow-x: hidden;">
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
	
	<!-- Blog Section Begin -->
	<section class="from-blog spad">
	<br><br><br>
	</section>
	<!-- 최근 본 상품 목록 -->
	<div id="recentViewList" class="bg-white shadow-lg" style="overflow: auto; display: none; z-index: 50; width: 390px; height: 690px; position: fixed; bottom: 90px; right: 24px; border-radius: 30px; padding: 20px;">
		
	</div>
	<div style="display: none;" id="custSeq">${logincust.sequence }</div>
	<div id="recentView" style="font-weight: 700; position: fixed; bottom: 23px; right: 100px; padding: 15px; border: none; border-radius: 10px; z-index: 20;" class="bg-warning text-white btn" onclick="show()">
		최근 본 상품 (0)
	</div>
	<!-- Blog Section End -->
	<!-- Footer Section Begin -->
	<footer class="footer spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12" style="position: relative">
					<div class="text-light" style="position: absolute; top: 70%; left: 30%; z-index: 2; font-size: 30px; font-weight: 700;">오늘의 이야기, 내일을 엽니다</div>
						<div class="footerSection">	
							<article class="sky">			
								<img src="img/sun.png" class="sun" />
								<img src="img/cloud1.png" class="cloud1" />
								<img src="img/cloud2.png" class="cloud2" />
							</article>	
							
							<article class="town">
								<img src="img/circle.png" class="circle" />
								<img src="img/town_night.png" class="night" />
								<img src="img/town_day.png" class="day" />	
							</article>
							
							<article class="people">
								<img src="img/man.png" class="man" />
								<img src="img/family.png" class="family" />
							</article>		
						<div class="footer__about__logo" style="position: absolute; right: 0;">
							<a href="./index.html"><img src="img/logo.png" alt=""></a>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="footer__copyright">
						<div class="footer__copyright__text">
							<p>
								Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
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
		var setCookie = function(name, value, exp) {
		    var date = new Date();
		    date.setTime(date.getTime() + exp*24*60*60*1000);
		    document.cookie = name + '=' + value + ';expires=' + date.toUTCString() + ';path=/';
		};
		var getCookie = function(name) {
		    var value = document.cookie.match('(^|;) ?' + name + '=([^;]*)(;|$)');
		    return value? value[2] : null;
		};
	
		var prodSeqList = [];
		var prodImgList = [];
		var prodNameList = [];
	
		$(document).ready(function() {
			var custSeq = document.getElementById("custSeq").innerText;
			const recentView = document.getElementById("recentView");
			const recentViewList = document.getElementById("recentViewList");
		
			prodSeqList = getCookie("prodSeqList");
			prodImgList = getCookie("prodImgList");
			prodNameList = getCookie("prodNameList");
			
			if (prodSeqList == null) {
				prodSeqList = [];
			} else {
				prodSeqList = getCookie("prodSeqList").split(',');
			} 
			if (prodImgList == null) {
				prodImgList = [];
			} else {
				prodImgList = getCookie("prodImgList").split(',');
			}
			if (prodNameList == null) {
				prodNameList = [];
			} else {
				prodNameList = getCookie("prodNameList").split(',');
			}
			
			if(custSeq === '') {
				recentView.style.display = "none";
				
				setCookie('prodSeqList', prodSeqList, 0);
				setCookie('prodNameList', prodNameList, 0);
				setCookie('prodImgList', prodImgList, 0);
			} else {
				var length = prodSeqList.length;
				recentView.innerText = "최근 본 상품 (" + length + ")";

				var result = "";
				for(var i=0; i<prodSeqList.length; i++) {
					result = result + '<div id="recentProdItem" onclick="goToDetail(' + prodSeqList[i] + ')" class="btn d-flex flex-col align-items-center m-3"><img style="width: 80px;" src="' + prodImgList[i].substr(1, prodImgList[i].length-2) + '"><div class="m-3" style="font-size: 18px; font-weight: 700;">' + prodNameList[i].substr(1, prodNameList[i].length-2) + '</div></div>';
				}
				console.log(result);
				recentViewList.innerHTML = result;
			}
			
		});
		function goToDetail(seq) {
			location.href="product-detail.bit?view=shop-details&sequence=" + seq;
		}
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
		const recentViewList = document.getElementById("recentViewList");
		function show() {
			if (recentViewList.style.display === "none") {
				recentViewList.style.display = "block";
				recentViewList.style.animation = "fadeInUp 0.5s";
			}
			else {
				recentViewList.style.animation = "fadeOutDown 0.5s";
				setTimeout(function() {
					recentViewList.style.display = "none";
				}, 500);
			}
		}
	</script>

</body>

</html>