<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>id : ${store.id}</p>
<p>storeName : ${store.store}</p>
<p>holiday : ${store.holiday}</p>
<p>area : ${store.area}</p>
<p>storetel : ${store.storetel}</p>
<a href="../index.jsp">index</a>
<a href='./storeDelete.store?id=${store.id}'>delete</a>
<a href='./storeUpdate.store?id=${store.id}'>update</a>

<a href="../pos/posInsert.pos?store=${store.store}">posInsert</a>
<a href="../pos/posIndex.pos?store=${store.store}">pos</a>
</body>
</html>