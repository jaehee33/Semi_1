<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<%=request.getContextPath()%>/css/header.css"
	rel="stylesheet">


<header>
	<div id="hdtop">
		<div id="logo">
			<a href="<%=request.getContextPath()%>/index.jsp"> <img
				width="100px" height="80px"
				src="<%=request.getContextPath()%>/img/logo_pantone.png">
			</a>
			<!-- <p>SEMI HAIR</p> -->
		</div>

		<div id="member">
			<c:if test="${empty member}">
				<a href="<%=request.getContextPath()%>/member/memberJoin.member">Join</a>
				<a href="<%=request.getContextPath()%>/member/memberLogin.member">Login</a>
			</c:if>
			<c:if test="${not empty member}">
				<a href="<%=request.getContextPath()%>/member/memberLogout.member">Logout</a>
				<a href="<%=request.getContextPath()%>/member/memberMyPage.member">MyPage</a>
			</c:if>
			<c:if test="${member.job eq 'B'}">
				<a href="<%=request.getContextPath()%>/use/useList.use">예약/취소</a>
			</c:if>
		</div>

		<div id="menu">
			<a class="dropbtn text"
				href="#">ABOUT</a>
			<div class="dropdown">
				<a class="dropbtn text"
					href="<%=request.getContextPath()%>/store/storeList.store">STORE</a>
				<div class="dropdown-content">
					<a href="<%=request.getContextPath()%>/store/storeList.store">STORE</a>
					<a
						href="<%=request.getContextPath()%>/search/locationSearch.search">내주변</a>
				</div>
			</div>
			<a class="dropbtn text"
				href="<%=request.getContextPath()%>/kind/kindFList.kind">STYLE</a>


			<a class="dropbtn text" 
				href="<%=request.getContextPath()%>/coupon/couponList.coupon">EVENT</a>
			<div class="dropdown">
				<a class="dropbtn text"
					href="<%=request.getContextPath()%>/notice/noticeList.notice">NOTICE</a>
				<div class="dropdown-content">
					<a href="<%=request.getContextPath()%>/notice/noticeList.notice">공지사항</a>
					<a href="<%=request.getContextPath()%>/faq/faqList.faq">자주 묻는
						질문</a>
				</div>
			</div>
		</div>
	</div>

</header>


