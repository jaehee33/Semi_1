<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<table>
	<tr>
		<td>kind</td>
		<td>price</td>
		<td>예약여부</td>
		<td>즐겨찾기</td>
	</tr>
	
	<c:forEach items="${kindlist}" var="k">
		<tr>
		<c:forEach items="${filelist}" var="f">
		<c:if test="${k.num eq f.num}">
		<td><img src="../upload/${f.fname}"></td>
		</c:if>
		</c:forEach>
			<td>${k.kind}</td>
			<td>${k.price}</td>
			<td><a href="../use/useWrite.use?store=${store.store}&style=${k.kind}&price=${k.price}">예약</a></td>
			<td><a href="../member/memberStyle.member">스타일즐겨찾기</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>