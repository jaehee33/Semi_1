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
	var kind='${make.kind}';
	$(".kind").each(function(){
		if($(this).val()==kind){
			$(this).attr("selected", true);
		}		
	});
	
	
	$(".list").click(function(){
		var cur = $(this).attr("store");
		document.frm.curPage.value=cur;
		document.frm.submit();
		
	});
});
</script>
</head>
<body>

	<h1>Use List</h1>
	<div>
		<form name="frm" action="./useList.useList">
			<input type="hidden" name="curPage"> 
			<select name="kind" value="${make.kind }">
				<option class="kind" value="store">ul_store</option>
				<option class="kind" value="style">ul_style</option>
				<option class="kind" value="price">ul_price</option>
			</select> 
			<input type="text" name="search" value="${make.search }">

			<button>search</button>
		</form>
	</div>
	<table>
		<tr>
			<td>번호</td>
			<td>가게명</td>
			<td>예약날짜</td>
			<td>예약시간</td>
			<td>스타일</td>
			<td>가격</td>
			<td>쿠폰</td>
		</tr>
		<c:forEach begin="0" end="${list.size()}" var="i">

			<tr>
				<td>${list[i].store}</td>

				<td><c:catch>
						<c:forEach begin="1" end="${list[i].depth }">--</c:forEach>
					</c:catch>
				<td><a href="./useListView.useList?num=${list[i].num }">${list[i].store }</a></td>
				<td>${list[i].ul_style }</td>

			</tr>
		</c:forEach>
	</table>

	<c:if test="${page.curBlock > 1 }">
		<input type="button" class="list" title="${page.startNum-1}" value="[이전]">
	</c:if>
	<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
		<input type="button" class="list" title="${i}" value="${i }">

	</c:forEach>
	<c:if test="${page.curBlock < page.totalBlock}">
		<input type="button" class="list" title="${page.lastNum+1}" value="[다음]">
	</c:if>

</body>
</html>