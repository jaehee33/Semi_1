<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
     <script type="text/javascript">
	$(function(){
		$(".list").click(function(){
			var cur = $(this).attr("title");
			document.frm.curPage.value=cur;
			document.frm.submit();
		});
		$("#type").change(function(){
			var cur = $(".list").attr("title");
			document.frm.curPage.value=cur;
			document.frm.submit();
		});
	});

	
</script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<div>
		<form name="frm" action="./posList.pos">
			<input type="hidden" name="curPage">
			<input type="hidden" name="store" value="${store}">
			<select name="type" id="type">
			<option value="import,expend">total</option>
			<option value="import">import</option>
			<option value="expend">expend</option>
			</select>
		</form>
	</div>
<table>
		<tr>
			<td>date</td>
			<td>import</td>
			<td>expend</td>
			<td>kind</td>
			<td>store</td>
			<td>coupon</td>
		</tr>
		<c:forEach items="${list}" var="a">
		<tr>
			<td>${a.pos_date}</td>
			<c:catch var="null">
			<td>${a.pos_import}</td>
			<td>${a.expend}</td>
			</c:catch>
			<td>${a.kind}</td>
			<td>${a.store}</td>
			<td>${a.pos_coupon}</td>
			<c:if test="${a.state ne '예약'}">
			<td><a href="posDelete.pos?num=?${a.num}">X</a></td>
			</c:if>
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
</body>
</html>