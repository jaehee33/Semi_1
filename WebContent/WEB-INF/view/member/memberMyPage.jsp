<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>ID: ${sessionScope.member.id}</h3>
<h3>Name: ${sessionScope.member.name}</h3>
<c:if test="${sessionScope.member.job eq 'S'}">
<a href="./store/storeWrite.store">storeWrite</a>
</c:if>

</body>
</html>