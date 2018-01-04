<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet">
<%-- <link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"> --%>

<header>
	<div id="hdtop">
		<div id="logo">
			<a href="<%=request.getContextPath()%>/index.jsp"> <img src="<%=request.getContextPath()%>/img/logo/2.png" style="width:10%;height: 100%;">
			</a>
			<!-- <p>SEMI HAIR</p> -->
		</div>

		<div id="menu">
	
			<a class="dropbtn text" href="<%=request.getContextPath()%>/about.jsp">ABOUT</a>
			<div class="dropdown">
				<a class="dropbtn text" href="<%=request.getContextPath()%>/store/storeList.store">STORE</a>
				<div class="dropdown-content">
					<a href="<%=request.getContextPath()%>/store/storeList.store">STORE</a>
					<a href="<%=request.getContextPath()%>/search/locationSearch.search">내주변</a>
				</div>
			</div>
			
			<a class="dropbtn text" href="<%=request.getContextPath()%>/kind/kindFList.kind">STYLE</a>
			<a class="dropbtn text" href="<%=request.getContextPath()%>/coupon/couponList.coupon">EVENT</a>
			<div class="dropdown">
				<a class="dropbtn text" href="<%=request.getContextPath()%>/notice/noticeList.notice">NOTICE</a>
				<div class="dropdown-content">
					<a href="<%=request.getContextPath()%>/notice/noticeList.notice">공지사항</a>
					<a href="<%=request.getContextPath()%>/faq/faqList.faq">FAQ</a>
				</div>
			</div>
			
		</div>
		
		<div id="member">
			<c:if test="${empty member}">
				<a href="<%=request.getContextPath()%>/member/memberJoin.member">Join</a>
				<a href="<%=request.getContextPath()%>/member/memberLogin.member">Login</a>
			</c:if>
			<c:if test="${not empty member}">
			<%-- 	<a href="<%=request.getContextPath()%>/member/memberLogout.member">Logout</a> --%>
				<a href="<%=request.getContextPath()%>/member/kakaoLogout.member">Logout</a>
				<a href="<%=request.getContextPath()%>/member/memberMyPage.member">MyPage</a>
				
			</c:if>
		</div>
		
	</div>

</header>

