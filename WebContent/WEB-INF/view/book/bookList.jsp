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
	<table>
		<tr>
			<th>예약번호</th>
			<th>가게명</th>
			<th>예약날짜</th>
			<th>예약시간</th>
			<th>스타일</th>
			<th>가격</th>
			<th>쿠폰</th>
		</tr>
		<c:forEach items="${list}" var="b">
			<tr>
				<td><a href="./bookView.book?num=${b.num}">${b.num}</a></td>
				<td>${b.bk_store}</td>
				<td>${b.bk_date}</td>
				<td>${b.bk_time}</td>
				<td>${b.bk_style}</td>
				<td>${b.bk_price}</td>
				<td>
					<c:choose>
						<c:when test="${b.bk_coupon eq null}">사용안함</c:when>
						<c:otherwise>${b.bk_coupon}</c:otherwise>
					</c:choose>
				</td>
			</tr>
		</c:forEach>
	</table>	
	
	<a href="../member/memberMyPage.member">마이페이지로 돌아가기</a>
</body>
</html>