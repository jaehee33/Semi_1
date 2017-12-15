<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<div id="header">
<a href="<%=request.getContextPath()%>/index.jsp">index</a>
<c:if test="${empty member}">
	<a href="<%=request.getContextPath()%>/member/memberJoin.member">Join</a>
	<a href="<%=request.getContextPath()%>/member/kakaoJoin.member"></a>
	<a href="<%=request.getContextPath()%>/member/memberLogin.member">Login</a>		
</c:if>

		<c:if test="${not empty member}">
			<a href="<%=request.getContextPath()%>/member/memberLogout.member">Logout</a>
			<a href="<%=request.getContextPath()%>/member/memberMyPage.member">MyPage</a>
		</c:if>
		<c:if test="${member.job eq 'B'}">
			<a href="<%=request.getContextPath()%>/use/useList.use">예약/취소</a>
		</c:if>
		<hr>
		<a href="<%=request.getContextPath()%>/search/locationSearch.search">내
			주변</a> <a href="<%=request.getContextPath()%>/kind/kindFList.kind">스타일</a> <a href="<%=request.getContextPath()%>/store/storeList.store">전체
			가게</a>


		<hr>
		<a href="<%=request.getContextPath()%>/notice/noticeList.notice">공지사항</a>
		<a href="<%=request.getContextPath()%>/faq/faqList.faq">자주 묻는 질문</a>
	</div>
</body>
</html>