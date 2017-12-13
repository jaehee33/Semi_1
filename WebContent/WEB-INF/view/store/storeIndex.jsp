<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<p>storeName : ${store.store}</p>
<c:if test="${sessionScope.member.job eq 'B'}">
<a href="../kind/kindCList.kind?id=${store.id}">메뉴</a>
<a href="./storeView.store?id=${store.id}">정보</a>
<a href="../score/scoreList.score">리뷰</a>
</c:if>
<a href="../index.jsp">index</a>
</body>
</html>