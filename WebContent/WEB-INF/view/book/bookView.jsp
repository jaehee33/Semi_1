<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.container{
	width: 55%;
}

</style>
</head>
<body>
	<div class="container">
		<h3>예약</h3>
		<table class="table table-hover">
			<tbody>
				<tr>
					<th>예약자명</th>
					<td>${view.name}</td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td>${view.phone}</td>
				</tr>
				<tr>
					<th>가게명</th>
					<td>${view.store}</td>
				</tr>
				<tr>
					<th>이용일</th>
					<td>${view.bk_date}</td>
				</tr>
				<tr>
					<th>이용시간</th>
					<td>${view.time}</td>
				</tr>
				<tr>
					<th>예약메뉴</th>
					<td>${view.style}</td>
				</tr>
				<tr>
					<th>금액</th>
					<td>${view.price}</td>
				</tr>
				<tr>
					<th>쿠폰</th>
					<td><c:choose>
							<c:when test="${view.coupon eq null}">사용안함</c:when>
							<c:otherwise>${view.coupon}% 할인쿠폰</c:otherwise>
						</c:choose></td>
				</tr>
			</tbody>
		</table>
		<a href="./bookDelete.book?num=${view.num}">예약 취소하기</a>
		<a href="./bookList.book">나의 예약으로 돌아가기</a>
	</div>
</body>
</html>