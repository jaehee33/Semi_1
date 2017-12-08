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
<h1>useListView</h1>
<h3>번호: ${view.num}</h3>
<h3>전화번호 : ${view.phone}</h3>
<h3>가게명 : ${view.store}</h3>
<h3>예약날짜 : ${view.bk_date}</h3>
<h3>예약시간 : ${view.time}</h3>
<h3>스타일 : ${view.style}</h3>
<h3>가격 : ${view.price}</h3>
	<h3>쿠폰 : 
	<c:choose>
		<c:when test="${view.coupon eq null}">사용안함</c:when>
		<c:otherwise>${view.coupon}</c:otherwise>
	</c:choose>
	</h3>
<a href="./memberMyPage.member">마이페이지</a>

</body>
</html>