<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<p>id : ${store.id}</p>
<p>storeName : ${store.store}</p>
<p>holiday : ${store.holiday}</p>
<p>area : ${store.area}</p>
<p>storetel : ${store.storetel}</p>
<a href="../index.jsp">index</a>
<c:if test="${sessionScope.member.job eq 'S'}">
<a href='./storeDelete.store?id=${store.id}'>delete</a>
<a href='./storeUpdate.store?id=${store.id}'>update</a>

<a href="../pos/posIndex.pos?store=${store.store}">pos</a>
<a href="../kind/kindIndex.kind">kind</a>
</c:if>
</body>
</html>