<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Event</title>
<link href="/Semi_1/css/coupon/coupon.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div>
			<h1>COUPON</h1>
		</div>
		
		<p>member: ${member.id}</p>
		<c:forEach items="${ar}" var="a">
			<c:if test="${a.id eq sessionScope.member.id}">
				<div>${a.coupon}</div>
			</c:if>
			<c:if test="${a.id ne sessionScope.member.id}">
				<p></p>
				<div class="div_coupon">
					<a
						href="./couponCome.coupon?coupon=${a.coupon}&count=${a.discount}"><img
						class="coupon_1" src="/Semi_1/img/coupon/coupon.jpg">${a.coupon}</a>
				</div>
			</c:if>
		</c:forEach>

		<c:if test="${member.id eq 'admin'}">
			<a href="<%=request.getContextPath()%>/coupon/couponInsert.coupon">coupon</a>
		</c:if>
	</section>
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>