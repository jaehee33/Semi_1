<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
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
				<td><h3><a href="./kindView.kind?num=${k.num}&$style=${k.style}">${k.style}</a></h3></td>
			</tr>
			<tr>
				<c:forEach items="${storelist}" var="s">
					<c:if test="${k.store eq s.store}">
						<td>${k.store}</td>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	</section>
</body>
</html>