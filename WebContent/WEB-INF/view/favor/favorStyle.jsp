<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>Insert title here</title>

</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<h1>스타일 즐겨찾기 보기</h1>
		<table>
			<tr>
				<td>사진</td>
				<td>종류</td>
				<td>가격</td>
				<td>가게명</td>
			</tr>
			<c:forEach items="${list}" var="i">
				<tr>
					<td>사진</td>
					<td>${i.style}</td>
					<td>${i.price}</td>
					<td>${i.store}</td>
				</tr>			
			</c:forEach>
		</table>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>