<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<form action="posInsert.pos" method="post" name="frm" id="frm">
<p class="insertt">
<input type="text" name="store" class="storename" value="${store}" readonly="readonly">
<select name="kind" class="g kind">
<option value="other">기타</option>
<c:forEach items="${kindlist}" var="a" varStatus="j">
<option value="${a.style}" title="${a.price}" id="0" class="op">${a.style}</option>
</c:forEach>
</select>
<c:forEach items="${kindlist}" var="b" varStatus="i">
<input type="hidden" id="price${i.index}" value="${b.price}" class="e">
</c:forEach>
<input type="number" name="pos_import" value="" title="0" class="imoney insertmoney">
<input type="hidden" name="expend" value="0">
</p>
<input type="button" value="INPUT" id="btn" class="btn">
</form>
