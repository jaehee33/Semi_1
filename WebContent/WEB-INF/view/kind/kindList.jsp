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
	<%@ include file="../temp/header.jsp"%>
	<table>
		<c:forEach items="${kindlist}" var="k">
			<tr>
				<c:forEach items="${filelist}" var="f">
					<c:if test="${k.num eq f.num}">
						<td><img src="../upload/${f.fname}"></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<td><h3><a href="./kindView.kind?num=${k.num}">${k.kind}</a></h3></td>
			</tr>
			<tr>
				<c:forEach items="${storelist}" var="s">
					<c:if test="${k.store eq s.store}">
						<td>${k.store}</td>
						<td><a href="../favor/favorStyle.favor">♡</a></td>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>