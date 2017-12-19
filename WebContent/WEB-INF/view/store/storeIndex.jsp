<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="<%=request.getContextPath()%>/css/store/storeheader.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<div id="storeheader">
	<div></div>
	<c:forEach items="${filelist}" var="f">
		<c:if test="${store.store eq f.store}">
			<img src="../upload/${f.fname}" width="200px" height="150px">
		</c:if>
	</c:forEach>
	<h1>storeName : ${store.store}</h1>
	<a href="../kind/kindCList.kind?id=${store.id}">메뉴</a>
	<a href="./storeView.store?id=${store.id}">정보</a>
	<a href="../score/scoreList.score">리뷰</a>
	<a href="../index.jsp">index</a>
	</div>
</body>
</html>