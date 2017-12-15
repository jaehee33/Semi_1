<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<link href="/Semi_1/css/mypage.css" rel="stylesheet">
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<header>
<h1>나의 정보</h1>
<div id="info">
<ul>
<li>이름: ${m2.name}<span><c:if test="${m2.job eq 'B' }"> [고객]
</c:if><c:if test="${m2.job eq 'S' }"> [점주]</c:if></span></li>
<li>생일: ${m2.birth}</li>
<li>번호: ${m2.phone}</li>
</ul>
</div>

</header>
<nav>

</nav>
<article>

</article>


<a href="../index.jsp">처음으로</a>
<a href="../favor/favorStyle.favor">스타일 즐겨찾기보기</a>
<a href="../favor/favorStore.favor">가게 즐겨찾기보기</a>
<a href="./memberUpdate.member?id=${m2.id}">memberUpdate</a>
<a href="./memberDelete.member">memberDelete</a>
<hr>
<c:if test="${sessionScope.member.job eq 'B'}">
<a href="../use/useList.use">예약/취소</a>
</c:if>

<c:if test="${sessionScope.member.job eq 'S'}">
<c:if test="${empty store}">
<a href="../store/storeWrite.store">storeWrite</a>
</c:if>
<c:if test="${not empty store}">
<a href="../store/storeIndex.store?id=${sessionScope.member.id}">storeIndex</a>
</c:if>
</c:if>
</body>
</html>