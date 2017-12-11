<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<form action="posInsert.pos" method="post" name="frm">
<input type="text" name="store" value="${sname}" readonly="readonly">
<select name="kind">
<c:forEach items="${kindlist}" var="a">
<option value="${a.kind}">${a.kind}</option>
</c:forEach>
<option value="other">기타</option>
</select>
<input type="number" name="pos_import" id="price">
<button>버튼</button>
</form>
