<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="../style/styleDelete.style" method="post" name="frm" id="frm">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="style" value="${style}">
	<button type="button" id="btn" class="on">즐겨찾기</button>
</form>