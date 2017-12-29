<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<form action="../style/styleInsert.style" method="post" name="frm" id="frm">
	<input type="hidden" name="num" value="${num}">
	<input type="hidden" name="style" value="${style}">
	<c:if test="">
		<input type="hidden" name="price" value="${price}">
		<input type="hidden" name="store" value="${store}">
		<button type="button" id="btn" class="off">즐겨찾기</button>
	</c:if>
	<c:if test="">
		<button type="button" id="btn" class="on">즐겨찾기</button>
	</c:if>
>>>>>>> sj_favorite
</form>