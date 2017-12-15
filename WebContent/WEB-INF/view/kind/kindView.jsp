<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#font{
	font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<table>
			<tr>
				<td><img src="../upload/${file.fname}"></td>
			</tr>
			<tr>
				<td><h3>${kind.style}</h3></td>
				<td><a href="../member/memberStyle.member">♡</a></td>	
			</tr>
			<tr>
				<td>${kind.store}</td>
			</tr>
	</table>
	<hr>
	<table>
			<tr>
				<td id="font" colspan="3">이 스타일 관련 메뉴</td>
			</tr>
			<c:forEach items="${list}" var="i">		
			<tr>	
				<td>${i.style}</td>
				<td>${i.price}</td>
				<td><a href="../use/useWrite.use?store=${i.store}&style=${i.style}&price=${i.price}">예약</a></td>
			</tr>
			</c:forEach>

	</table>
</body>
</html>