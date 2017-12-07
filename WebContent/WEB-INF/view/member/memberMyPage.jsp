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

<h3>ID: ${m2.id}</h3>
<h3>Name: ${m2.name}</h3>
<h3>Birth: ${m2.birth}</h3>
<h3>Phone: ${m2.phone}</h3>
<h3>Job: ${m2.job}</h3>

<a href="../index.jsp">index</a>
<a href="./memberUpdate.member?id=${m2.id}">memberUpdate</a>
<a href="./memberDelete.member">memberDelete</a>
<c:if test="${sessionScope.member.job eq 'B'}">
<a href="../book/bookView.book">bookView(예약확인)</a>
</c:if>

<c:if test="${sessionScope.member.job eq 'S'}">
<a href="../store/storeWrite.store">storeWrite</a>
<a href="../store/storeView.store">storeView</a>
</c:if>


</body>
</html>