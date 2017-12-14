<%@page import="com.iu.posbook.PosBookDTO"%>
<%@page import="java.util.ArrayList"%>
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
<%@ include file="../temp/header.jsp" %>
<table>
		<tr>
			<td>ID</td>
			<td>NAME</td>
			<td>Phone</td>
			<td>BK_DATE</td>
			<td>STYLE</td>
			<td>PRICE</td>
			<td>TIME</td>
			<td>COUPON</td>
		</tr>
		<%ArrayList<PosBookDTO> ar=(ArrayList<PosBookDTO>)request.getAttribute("posbook");
		for(int i=0;i<ar.size();i++){
		System.out.println(ar.get(i).getId());
		}
			%>
		
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
		<td></td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>