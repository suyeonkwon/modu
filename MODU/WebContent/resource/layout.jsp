<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<c:set var="mem" value="${sessionScope.mem}"/>
<!DOCTYPE HTML>
<!--
	Ion by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->

<html>
	<head>
		<title><decorator:title/></title>
		<style type="text/css">
					#header #nav2:hover #sub-menu{
						opacity: 1;
						visibility: visible;
					}
		</style>
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<!--[if lte IE 8]><script src="js/html5shiv.js"></script><![endif]-->
		<script src="../resource/js/jquery.min.js"></script>
		<script src="../resource/js/skel.min.js"></script>
		<script src="../resource/js/skel-layers.min.js"></script>
		<script src="../resource/js/init.js"></script>

			<link rel="stylesheet" href="../resource/css/skel.css" />
			<link rel="stylesheet" href="../resource/css/style.css" />
			<link rel="stylesheet" href="../resource/css/style-xlarge.css" />
	</head>
	<decorator:head/>
	<body id="top">
		<!-- Header -->
			<header id="header" class="skel-layers-fixed">
				<h1><a href="${path}/main/main.do">MODU</a></h1>
				<nav id="nav">
					<ul>
						<li><a href="${path}/plan/planner.do?id=${sessionScope.login}">플래너</a></li>
						<li><a href="${path}/board/planboard.do?type=1">일정공유</a></li>
						<li><a href="${path}/board/review.do?type=1">리뷰</a></li>
					</ul>
				</nav>
				<nav id="nav2">
					<ul>
						<c:if test="${empty sessionScope.login}">
							<li><a href="${path}/member/loginForm.do">로그인</a></li>
							<li><a href="${path}/member/joinForm.do" class="button special">Join</a></li>
						</c:if>
						<c:if test="${!empty sessionScope.login}">
							<c:if test="${mem.profile.equals('')}">
								<li><a href="#"><img src="${path}/resource/images/user.png"></a>
							</c:if>
							<c:if test="${!mem.profile.equals('')}">
								<li><a href="#"><img src="${path}/member/picture/${mem.profile}"></a>
							</c:if>
								<ul id="sub-menu">
									<li style="font-weight:bold;">${mem.nick}</li>
									<li><a href="${path}/member/mypage.do?id=${sessionScope.login}">마이페이지</a></li>
									<li><a href="${path}/member/logout.do">로그아웃</a></li>
								</ul>
							</li>
						</c:if>
					</ul>
				</nav>
			</header>
		<!-- Banner -->

		<!-- One -->
		
		<!-- Two -->		
		<decorator:body/>
		<!-- Footer -->
			<footer id="footer">
				<div class="container">
					<div class="row double">
						<div class="6u">
							<div class="row collapse-at-2">

							</div>
						</div>

					</div>
					<ul class="copyright">
						<li>구디아카데미 개인프로젝트</li>
						<li>Design: <a href="http://templated.co">TEMPLATED</a></li>
						<li>Images: <a href="http://unsplash.com">Unsplash</a></li>
					</ul>
				</div>
			</footer>
	</body>
</html>