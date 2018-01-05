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
<script type="text/javascript">
	$(function(){
		$("#write").click(function(){
			location.href= "/Semi_1/coupon/couponInsert.coupon";
		});
	});
</script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	
	<section>
		<div>
			<h1>COUPON</h1>
		</div>
		<c:forEach items="${ar}" var="a">
			<c:if test="${a.id eq sessionScope.member.id}">
				<div class="adminlist">
				<div class="acoupon">${a.coupon}</div>
				<div class="dcoupon"><a href="./couponDelete.coupon?num=${a.num}">DELETE</a></div>
				</div>
			</c:if>
			<c:if test="${a.id ne sessionScope.member.id}">
				<div class="div_coupon">
						<a class="coupona" href="./couponCome.coupon?coupon=${a.coupon}&count=${a.discount}">
						<span class="span">
						<span class="couponame"><font class="fontspan">Coupon</font></span>
						<span class="coupon_span">${a.discount} <span class="off">%OFF</span></span></a>
				</div>
			</c:if>
		</c:forEach>
		<div id="admin">
		<c:if test="${member.id eq 'admin'}">
			<div id="write">쿠폰 등록하기 +</div>
		</c:if>
		</div>

	</section>
	
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>