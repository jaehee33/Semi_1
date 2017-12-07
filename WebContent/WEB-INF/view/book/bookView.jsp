<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>나의 예약</h1>
	<h3>이름 : ${view.name}</h3>
	<h3>전화번호 : ${view.phone}</h3>
	<h3>가게명 : ${view.bk_store}</h3>
	<h3>예약날짜 : ${view.bk_date}</h3>
	<h3>예약시간 : ${view.bk_time}</h3>
	<h3>스타일 : ${view.bk_style}</h3>
	<h3>가격 : ${view.bk_price}</h3>
	<h3>쿠폰 : 
	<c:choose>
		<c:when test="${view.bk_coupon eq 'null'}">사용안함</c:when>
		<c:otherwise>${view.bk_coupon}</c:otherwise>
	</c:choose>
	</h3>
	<h3>시술여부 : ${view.bk_use}</h3>
	
	<a href="../member/memberMyPage.member">마이페이지로 돌아가기</a>
	</body>
</html>