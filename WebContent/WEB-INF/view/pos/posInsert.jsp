<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<form action="posInsert.pos" method="post" name="frm" id="frm">
<input type="text" name="store" value="${sname}" readonly="readonly">
<select name="kind" class="g">
<option value="other">기타</option>
<c:forEach items="${kindlist}" var="a" varStatus="j">
<option value="${a.kind}" title="price${j.index}" class="op">${a.kind}</option>
</c:forEach>
</select>
<c:forEach items="${kindlist}" var="b" varStatus="i">
<input type="hidden" id="price${i.index}" value="${b.price}" class="e">
</c:forEach>
<input type="number" name="pos_import" value="">
<input type="hidden" name="expend" value="0">
<input type="button" value="btn" id="btn">
</form>
