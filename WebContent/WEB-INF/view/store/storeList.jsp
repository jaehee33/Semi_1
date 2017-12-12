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
<table>
	<tr>
		<td>store</td>
		<td>location</td>
	</tr>
	<c:forEach items="${storelist}" var="s">
		<tr>
		<%-- <c:forEach items="${filelist}" var="f">
		<c:if test="${s.num eq f.num}">
		<td><img src="../upload/${f.fname}"></td>
		</c:if>
		</c:forEach> --%>
			<td>${s.store}</td>
			<td>${s.area}</td>
		</tr>
	</c:forEach>
</table>
</body>
</html>