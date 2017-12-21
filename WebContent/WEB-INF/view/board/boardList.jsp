<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
		
		$("#backpage").click(function(){
			window.location.href="../index.jsp"
		});		
		
	});
	
</script>
</head>
<body>
	<h2>${board}</h2>
	<div>
		<form name="frm" action="./${board}List.${board}">
			<input type="hidden" name="curPage"> 
			<select name="kind">
				<option class="kind" value="title">TITLE</option>
				<option class="kind" value="contents">CONTENTS</option>
				<option class="kind" value="title" value="contents" >TITLE + CONTENTS</option>
			</select> 
			<input type="text" name="search" value="${make.search}">
			<button>Search</button>
		</form>
	</div>


	<table class="table table-hover">
		<thead>
		<tr>
			<th>NUM</th>
			<c:if test="${member.id eq 'admin'}">
				<td>ID</td>
			</c:if>
			<th>TITLE</th>
			<th>DATE</th>
			<th>HIT</th>
		</tr>
		</thead>
		
		<c:forEach items="${list}" var="i">
			<tbody>
			<tr>
				<td>${i.num}</td>
				<c:if test="${member.id eq 'admin'}">
					<td>${i.id}</td>
				</c:if>
				<td><c:catch>
						<c:forEach begin="1" end="${i.depth}">--</c:forEach>
					</c:catch> 
					<a href="./${board}View.${board}?num=${i.num}">${i.title}</a></td>
				<td>${i.reg_date}</td>
				<td>${i.hit}</td>
			</tr>
			</tbody>
		</c:forEach>

	</table>


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

	<c:if test="${member.id eq 'admin'}">
		<a href="./${board}Write.${board}">Write</a>
	</c:if>
	
	<button type="button" class="btn" id="backpage">BackPage</button>
	
</body>
</html>