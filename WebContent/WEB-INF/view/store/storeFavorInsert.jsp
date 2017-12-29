<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="../favor/favorInsert.favor" method="post" name="frm" id="frm">
	<input type="hidden" name="store_id" value="${store_id}">
	<input type="hidden" name="store" value="${store}">
	<button type="button" id="btn" class="off">즐겨찾기</button>
</form>