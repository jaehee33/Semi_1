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
<c:forEach items="${ar}" var="a">
<c:if test="${a.id eq sessionScope.member.id}"><div>${a.coupon}</div></c:if>
<c:if test="${a.id ne sessionScope.member.id}">
<div>
<a href="./couponCome.coupon?coupon=${a.coupon}&count=${a.discount}">${a.coupon}</a>
</div>
</c:if>
</c:forEach>
<c:if test="${member.id eq 'admin'}">
	<a href="<%=request.getContextPath()%>/coupon/couponInsert.coupon">coupon</a>
	</c:if>
</body>
</html>