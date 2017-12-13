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
<p>storeName : ${store.store}</p>
<c:if test="${sessionScope.member.job eq 'S'}">
<a href='./storeDelete.store?id=${store.id}'>delete</a>
<a href='./storeUpdate.store?id=${store.id}'>update</a>

<a href="../pos/posIndex.pos?store=${store.store}">pos</a>
<a href="../kind/kindIndex.kind">kind</a>
</c:if>
<c:if test="${sessionScope.member.job eq 'B'}">
<a href="../kind/kindCList.kind?id=${store.id}">메뉴</a>
<a href="./storeView.store?id=${store.id}">정보</a>
<a href="../score/scoreList.score">리뷰</a>
</c:if>
<a href="../index.jsp">index</a>
</body>
</html>