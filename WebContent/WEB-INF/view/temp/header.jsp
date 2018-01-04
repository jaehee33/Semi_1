<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<%=request.getContextPath()%>/css/header.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet">

<header>
	<div id="hdtop">
		<div id="logo">
			<a href="<%=request.getContextPath()%>/index.jsp"> <img
				src="<%=request.getContextPath()%>/img/logo/logo230.png">
			</a>
			<!-- <p>SEMI HAIR</p> -->
		</div>

		<ul id="menu">

			<li><a class="dropbtn text"
				href="<%=request.getContextPath()%>/about.jsp">ABOUT</a></li>
			<li><ul class="dropdown">
					<li><a class="dropbtn text"
						href="<%=request.getContextPath()%>/store/storeList.store">STORE</a></li>
					<li><ul class="dropdown-content">
							<li><a
								href="<%=request.getContextPath()%>/store/storeList.store">STORE</a></li>
							<li><a
								href="<%=request.getContextPath()%>/search/locationSearch.search">내주변</a></li>
						</ul></li>
				</ul></li>

			<li><a class="dropbtn text"
				href="<%=request.getContextPath()%>/kind/kindFList.kind">STYLE</a></li>
			<li><a class="dropbtn text"
				href="<%=request.getContextPath()%>/coupon/couponList.coupon">EVENT</a></li>
			<li><ul class="dropdown">
				<li><a class="dropbtn text"
					href="<%=request.getContextPath()%>/notice/noticeList.notice">NOTICE</a></li>
				<li><ul class="dropdown-content">
					<li><a href="<%=request.getContextPath()%>/notice/noticeList.notice">공지사항</a></li>
					<li><a href="<%=request.getContextPath()%>/faq/faqList.faq">FAQ</a></li>
				</ul></li>
			</ul>
	</ul>

	<ul id="member">
		<c:if test="${empty member}">
			<li><a href="<%=request.getContextPath()%>/member/memberJoin.member">Join</a></li>
			<li><a href="<%=request.getContextPath()%>/member/memberLogin.member">Login</a></li>
		</c:if>
		<c:if test="${not empty member}">
			<li><a href="<%=request.getContextPath()%>/member/memberLogout.member">Logout</a></li>
			<li><a href="<%=request.getContextPath()%>/member/memberMyPage.member">MyPage</a></li>
		</c:if>
		<c:if test="${member.job eq 'B'}">
			<li><a href="<%=request.getContextPath()%>/use/useList.use">예약/취소</a></li>
		</c:if>
	</ul>

	</div>

</header>

