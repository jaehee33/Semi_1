<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table>
		<tr>
			<td>date</td>
			<td>import</td>
			<td>expend</td>
			<td>kind</td>
			<td>total</td>
			<td>store</td>
			<td>coupon</td>
		</tr>
		<c:forEach items="${list}" var="a">
		<tr>
			<td>${a.pos_date}</td>
			<c:catch var="null">
			<td>${a.pos_import}</td>
			<td>${a.expend}</td>
			</c:catch>
			<td>${a.kind}</td>
			<td>${a.total}</td>
			<td>${a.store}</td>
			<td>${a.pos_coupon}</td>
		<td></td>
		</tr>
		</c:forEach>
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