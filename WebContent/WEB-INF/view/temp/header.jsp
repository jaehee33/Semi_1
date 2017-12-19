<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet">

<header>
	<div id="hdtop">
		<div id="logo">
			<a href="<%=request.getContextPath()%>/index.jsp">
			<img  width="100px" height="80px" src="<%=request.getContextPath()%>/img/logo_pantone.png">
			</a>
		</div>
		
		<div id="">
			<c:if test="${empty member}">
				<a href="<%=request.getContextPath()%>/member/memberJoin.member">Join</a>
				<a href="<%=request.getContextPath()%>/member/memberLogin.member">Login</a>
			</c:if>
		</div>
		
		<div id="">
			<c:if test="${not empty member}">
				<a href="<%=request.getContextPath()%>/member/memberLogout.member">Logout</a>
				<a href="<%=request.getContextPath()%>/member/memberMyPage.member">MyPage</a>
				<a href="<%=request.getContextPath()%>/coupon/couponList.coupon">couponList</a>
			</c:if>
		</div>
		
		<div id="">
			<a href="<%=request.getContextPath()%>/search/locationSearch.search">내주변</a>
			<a href="<%=request.getContextPath()%>/kind/kindFList.kind">스타일</a> 
			<a href="<%=request.getContextPath()%>/notice/noticeList.notice">공지사항</a>
			<a href="<%=request.getContextPath()%>/faq/faqList.faq">자주 묻는 질문</a>
		</div>
	</div>
	
	<hr>
	<c:if test="${member.job eq 'B'}">
		<a href="<%=request.getContextPath()%>/use/useList.use">예약/취소</a>
	</c:if>
	<a href="<%=request.getContextPath()%>/store/storeList.store">전체 가게</a>
</header>