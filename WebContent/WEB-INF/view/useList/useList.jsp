<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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

	<h1>Use List</h1>
	<div>
		<form name="frm" action="./useList.jsp">
			<input type="hidden" name="curPage"> 
			<select name="kind" value="${make.kind }">
				<option class="kind" value="title">title</option>
				<option class="kind" value="writer">writer</option>
				<option class="kind" value="contents">contents</option>
			</select> 
			<input type="text" name="search" value="${make.search }">

			<button>search</button>
		</form>
	</div>
	<table>
		<tr>
			<td>name</td>
			<td>birth</td>
			<td>phone</td>
		</tr>
		<c:forEach begin="0" end="${list.size()}" var="i">

			<tr>
				<td>${list[i].name}</td>

				<td><c:catch>
						<c:forEach begin="1" end="${list[i].depth }">--</c:forEach>
					</c:catch>
				<td><a href="./${board }View.${board }?num=${list[i].num }">${list[i].title }</a></td>
				<td>${list[i].writer }</td>

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