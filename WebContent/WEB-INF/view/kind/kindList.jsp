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
	<td>사진</td>
		<td>kind</td>
		<td>price</td>
		<td>store</td>
	</tr>
	<c:forEach items="${kindlist}" var="k">
		<tr>
		<c:forEach items="${filelist}" var="f">
		<c:if test="${k.num eq f.num}">
		<td><img src="../upload/${f.fname}"></td>
		</c:if>
		<td>사진없음</td>
		</c:forEach>
			<td>${k.kind}</td>
			<td>${k.price}</td>
			<c:forEach items="${storelist}" var="s">
			<c:if test="${k.store eq s.store}">
			<td>${k.store}</td>
			</c:if>
			</c:forEach>
			<td><a href="../use/useWrite.use?store=${store.store}&style=${k.kind}&price=${k.price}">예약</a></td>
			
		</tr>
	</c:forEach>
</table>
</body>
</html>