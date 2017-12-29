<%@page import="com.iu.store.StoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
<script type="text/javascript">
	$(function(){
		var kind='${make.kind}';
		$(".kind").each(function(){
			if($(this).val()==kind){
				$(this).attr("selected", true);
			}
		});
		
		$(".list").click(function(){
			var cur = $(this).attr("title");
			document.frm.curPage.value=cur;
			document.frm.submit();
		});
	});
	
</script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<section id="main">
<div>
		<form name="frm" action="./storeList.store">
			<input type="hidden" name="curPage">
			<input type="text" name="search" value="${make.search}">
			<button>Search</button>
		</form>
	</div>
<table>
	<tr>
		<td>store</td>
		<td>location</td>
		<td>즐겨찾기</td>
	</tr>
	<c:forEach items="${requestScope.storelist}" var="s">
		<tr>
			<td><a href="./storeView.store?id=${s.id}">${s.store}</a></td>
			<td>${s.area}</td>
			<td><a href="../favorite/favoriteList.favor">저장</a></td>
		</tr>
	</c:forEach>
</table>
<c:if test="${page.curBlock gt 1}">
	<input type="button" value="[이전]" title="${page.startNum-1}" class="list">
	</c:if>
	<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
	<input type="button" value="${i}" title="${i}" class="list">
	</c:forEach>
	<c:if test="${page.curBlock lt page.totalBlock}">
	<input type="button" value="[다음]" title="${page.lastNum+1}" class="list">
	</c:if>
	</section>
</body>
</html>