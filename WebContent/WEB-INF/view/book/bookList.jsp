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
			<th><h3>이름</h3></th>
			<th><h3>전화번호</h3></th>
			<th><h3>가게명</h3></th>
			<th><h3>예약날짜</h3></th>
			<th><h3>예약시간</h3></th>
			<th><h3>스타일</h3></th>
			<th><h3>가격</h3></th>
			<th><h3>쿠폰</h3></th>
			<th><h3>시술여부</h3></th>
		</tr>
		<c:forEach items="${list}" var="b">
			<tr>
				<td><h3>${b.name}</h3><td>
				<td><h3>${b.phone}</h3></td>
				<td><h3>${b.bk_store}</h3></td>
				<td><h3>${b.bk_date}</h3></td>
				<td><h3>${b.bk_time}</h3></td>
				<td><h3>${b.bk_style}</h3></td>
				<td><h3>${b.bk_price}</h3></td>
				<td>
					<h3>
						<c:choose>
							<c:when test="${b.bk_coupon eq 'null'}">사용안함</c:when>
							<c:otherwise>${b.bk_coupon}</c:otherwise>
						</c:choose>
					</h3>
				</td>
				<td><h3>${b.bk_use}</h3></td>
			</tr>
		</c:forEach>
	</table>	
	<a href="../member/memberMyPage.member">마이페이지로 돌아가기</a>
</body>
</html>