<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="../favor/favorInsert.favor" method="post" name="frm" id="frm">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="store" value="${store}">
	<input type="hidden" name="page" value="view">
	<button type="button" class="toggle" id="btn">즐겨찾기</button>
</form>