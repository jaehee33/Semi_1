<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>semi hair shop</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/css/store/storeWrite.css"
	rel="stylesheet">
<style type="text/css">
.container{
	width: 55%;
}

</style>
<script type="text/javascript">
$(function(){
	$("#bookdelete").click(function(){
		location.href="./useDelete.use?num=${view.num}";
	});
	$("#backpage").click(function(){
		location.href="./useList.use";
	});
});
</script>
</head>
<body>
	<%@ include file="../temp/header.jsp" %>
	<section id="main">
	<div id="storeView">
			<h1>예약 상세 정보</h1>
			<p id="info1">예약한 헤어샵의 정보를 확인할 수 있습니다.</p>
			
				<table id="semistore">
					<tr id="start">
						<td class="first">예약자명</td>
						<td>${view.name}</td>
					</tr>
					<tr>
						<td class="first">예약헤어샵</td>
						<td>${view.store}</td>
					</tr>
					<tr>
						<td class="first">연락처</td>
						<td>${view.phone}</td>
					</tr>
					<tr>
						<td class="first">예약 날짜</td>
						<td>${view.bk_date}</td>
					</tr>
					<tr>
						<td class="first">예약 시간</td>
						<td>${view.time}</td>
					</tr>
					<tr>
						<td class="first"> 예약 메뉴</td>
						<td>${view.style}</td>
					</tr>
					<tr>
						<td class="first">금액</td>
						<td>${view.price}</td>
					</tr>	
					<tr>
					<td class="first">쿠폰</td>
					<td><c:choose>
							<c:when test="${view.coupon eq null}">사용안함</c:when>
							<c:otherwise>${view.coupon}% 할인쿠폰</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<td class="first">현재상태</td>
					<td>${view.state}</td>
				</tr>
				</table>
				<div id="booklist">
		<div class="btn" id="bookdelete">예약 취소</div>
		<div class="btn" id="backpage">BackPage</div>
		</div>
		</div>
	
	</section>
</body>
</html>