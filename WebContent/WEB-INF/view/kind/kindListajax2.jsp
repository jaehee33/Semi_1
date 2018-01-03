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
		<c:forEach items="${filelist}" var="f">
		<c:if test="${k.num eq f.num}">
		<td><img src="../upload/${f.fname}"></td>
		</c:if>
		</c:forEach>
			<td>${k.style}</td>
			<td>${k.price}</td>
			<td id="X"><a href="kindDelete.kind?num=${k.num}">X</a></td>
		</tr>
	</c:forEach>
</table>
