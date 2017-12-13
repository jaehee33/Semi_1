<%@page import="com.iu.store.StoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr>
		<td>store</td>
		<td>location</td>
	</tr>
	<c:forEach items="${requestScope.storelist}" var="s">
		<tr>
			<td>${s.store}</td>
			<td>${s.area}</td>
		</tr>
	</c:forEach>
	<%ArrayList<StoreDTO> ar=(ArrayList<StoreDTO>)request.getAttribute("storelist");
	for(int i=0;i<ar.size();i++){
	%>
	<tr>
	<td><%=ar.get(i).getStore() %></td>
	<td><%=ar.get(i).getArea() %></td>
	</tr>
	<%} %>
</table>
<c:if test="${page.curBlock gt 1}">
	<input type="button" value="[이전]" title="${page.startNum-1}" class="list">
	</c:if>
	<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
	<input type="button" value="${i}" title="${i}" class="list">
	</c:forEach>
	<c:if test="${page.curBlock lt page.totalBlock}">
	<input type="button" value="[다음]" title="${page.lastNum+1}" class="list">
	</c:if>
</body>
</html>