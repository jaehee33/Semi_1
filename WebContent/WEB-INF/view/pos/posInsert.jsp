<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<form action="posInsert.pos" method="post" name="frm">
<input type="text" name="store" value="${sname}" readonly="readonly">
<select name="kind" class="g">
<c:forEach items="${kindlist}" var="a" varStatus="j">
<option value="${a.kind}" title="price${j.index}" class="op">${a.kind}</option>
</c:forEach>
<option value="other">기타</option>
</select>
<c:forEach items="${kindlist}" var="b" varStatus="i">
<input type="hidden" id="price${i.index}" value="${b.price}" class="e">
</c:forEach>
<input type="number" name="pos_import" value="">
<input type="button" value="btn" id="btn">
</form>
