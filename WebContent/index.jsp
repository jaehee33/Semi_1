<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


<c:if test="${empty member}">
	<a href="./member/
	memberJoin.member">Join</a>
	<a href="./member/memberLogin.member">Login</a>
</c:if>
<a href="./notice/noticeList.notice">Notice List</a>
<a href="./faq/faqList.faq">Faq List</a>


<c:if test="${not empty member}">
	<a href="./member/memberLogout.member">Logout</a>
	<a href="./member/memberMyPage.member">MyPage</a>

	<c:if test="${member.job eq 'B'}">
		<a href="./search/locationSearch.search">내 주변</a>
		<a href="./search/styleSearch.search">스타일</a>
		<a href="./book/bookList.book">나의 예약</a>
	</c:if>
</c:if>


</body>
</html>