<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
	<h1>${board}</h1>
	<div>
		<form name="frm" action="./${board}List.${board}">
			<input type="hidden" name="curPage"> <select name="kind">
				<option class="kind" value="all">All</option>
				<option class="kind" value="pick">PICK</option>
				<option class="kind" value="cut">CUT</option>
				<option class="kind" value="perm">PERM</option>
				<option class="kind" value="clinic">CLINIC</option>
				<option class="kind" value="styling">STYLE</option>
			</select>
		</form>
	</div>
	<table>
		<tr>
			<td>NUM</td>
			<td>ID</td>
			<td>TITLE</td>
			<td>CONTENTS</td>
			<td>DATE</td>
			<td>HIT</td>
			<td>POINT</td>
		</tr>
		
		<c:forEach items="${list}" var="i">
			<tr>
			 	<td>${i.num}</td>			
				<td>${i.id}</td>
				<td>${i.title}</td>
				<td>${i.contents}</td>
				<td>${i.reg_date}</td>
				<td>${i.hit}</td>
				<td>${i.point}</td>
			</tr>
		</c:forEach>
	</table>

	<c:if test="${not empty member}">
	<button>Write</button>
	</c:if>
	
	<c:if test="${page.curBlock gt 1}">
		<input type="button" class="list" title="${page.startNum-1}"
			value="[이전]">
	</c:if>

	<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
		<input type="button" class="list" title="${i}" value="${i}">
	</c:forEach>

	<c:if test="${page.curBlock lt page.totalBlock}">
		<input type="button" class="list" title="${page.lastNum+1}"
			value="[다음]">
	</c:if>
	
	<a href="../storeIndex.store?id=${id}">BackPage</a>
</body>
</html>