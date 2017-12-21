<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="../favor/favorInsert.favor" method="post" name="frm" id="frm">
	<input type="hidden" name="store" value="${store}">store : ${store }
	<button type="button" class="btn btn-default" id="btn">♡</button>
</form>