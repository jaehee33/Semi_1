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
<c:if test="${sessionScope.member.job eq 'C'}">
<h3>Store: ${member.store}</h3>
<h3>Area: ${member.area}</h3>
<h3>StoreTel: ${member.storetel}</h3>
<h3>Holiday: ${member.holiday}</h3>
</c:if>

</body>
</html>