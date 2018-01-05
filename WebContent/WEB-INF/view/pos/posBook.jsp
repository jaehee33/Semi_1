<%@page import="com.iu.posbook.PosBookDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>SemiHairShop - PosBook</title>
<style type="text/css">
#first{
font-weight: bold;
font-size: 15px;
}
td a{
text-decoration: none;
}

td a:hover{
color: red;
text-decoration: none;
}
</style>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<section id="main">
<div id="posBackground">
<%@ include file="./posHeader.jsp" %>
<table class="table table-hover">
		<tr id="first">
			<td>ID</td>
			<td>NAME</td>
			<td>Phone</td>
			<td>BK_DATE</td>
			<td>STYLE</td>
			<td>PRICE</td>
			<td>TIME</td>
			<td>COUPON</td>
			<td>완료여부</td>
		</tr>
		<c:forEach items="${posbook}" var="a">
		<tr>
			<td>${a.id}</td>
			<td>${a.name}</td>
			<td>${a.phone}</td>
			<td>${a.bk_date}</td>
			<td>${a.style}</td>
			<td>${a.price}</td>
			<td>${a.time}</td>
			<td>${a.coupon}</td>
			<td><a href="posbookDelete.pos?num=${a.num}&store=${store}">완료</a></td>
		</tr>
		</c:forEach>
	</table>
	</div>
	</section>
</body>
</html>