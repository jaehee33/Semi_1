<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="../style/styleInsert.style" method="post" name="frm" id="frm">
	<input type="hidden" name="num" value="${num}">num : ${num }
	<input type="hidden" name="style" value="${style}">style : ${style }
	<input type="hidden" name="price" value="${price}">price : ${price }
	<input type="hidden" name="store" value="${store}">store : ${store }
	<input type="hidden" name="page" value="view">
	<button type="button" class="btn btn-default" id="btn">즐겨찾기</button>
</form>