<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<p>${store.id}</p>
<p>${store.store}</p>
<p>${store.holiday}</p>
<p>${store.area}</p>
<p>${store.storetel}</p>
<a href="../index.jsp">index</a>
<a href='./storeDelete.store?id="${store.id}"'>delete</a>
<a href='./storeUpdate.store?id="${store.id}"'>update</a>
</body>
</html>