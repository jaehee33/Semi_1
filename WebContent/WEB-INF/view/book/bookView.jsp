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
	<h3>==예약==</h3>
	<h4>예약자명 : ${view.name}</h4>
	<h4>전화번호 : ${view.phone}</h4>
	<h4>가게명 : ${view.store}</h4>
	<h4>예약날짜 : ${view.bk_date}</h4>
	<h4>예약시간 : ${view.time}</h4>
	<h4>스타일 : ${view.style}</h4>
	<h4>가격 : ${view.price}</h4>
	<h4>쿠폰 : 
	<c:choose>
		<c:when test="${view.coupon eq null}">사용안함</c:when>
		<c:otherwise>${view.coupon}</c:otherwise>
	</c:choose>
	</h4>
	<a href="./bookDelete.book?num=${view.num}">예약 취소하기</a>
	<a href="./bookList.book">나의 예약으로 돌아가기</a>
	</body>
</html>