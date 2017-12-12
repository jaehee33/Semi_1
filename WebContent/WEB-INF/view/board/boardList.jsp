<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
				<option class="kind" value="title">TITLE</option>
				<option class="kind" value="contents">CONTENTS</option>
			
			<c:if test="${member.id eq 'admin'}">
				<option class="kind" value="id">ID
			</option></c:if>
			
			</select> <input type="text" name="search" value="${make.search}">
			<button>Search</button>
		</form>
	</div>


	<table>
		<tr>
			<td>NUM</td>
			<c:if test="${member.id eq 'admin'}">
					<td>ID</td>
				</c:if>
			<td>TITLE</td>
			<td>CONTENTS</td>
			<td>DATE</td>
			<td>HIT</td>
		</tr>

		<c:forEach items="${list}" var="i">
			<tr>
				<td>${i.num}</td>

				<c:if test="${member.id eq 'admin'}">
					<td id="id">${i.id}</td>
				</c:if>
				<td><c:catch>
						<c:forEach begin="1" end="${i.depth}">--</c:forEach>
					</c:catch> <a href="./${board}View.${board}?num=${i.num}">${i.title}</a></td>
				<td>${i.contents}</td>
				<td>${i.reg_date}</td>
				<td>${i.hit}</td>
			</tr>
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
	
	<a href="../index.jsp">BackPage</a>


</body>
</html>