<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
<tr>
<td>kind</td>
<td>price</td>
</tr>
	<c:forEach items="${kindlist}" var="k">
	<tr>
	<td>${k.kind}</td>
	<td>${k.price}</td>
	</tr>
	</c:forEach>
</table>