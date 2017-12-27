<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/Semi_1/css/board/list.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		var kind = '${make.kind}';
		$(".kind").each(function() {
			if ($(this).val() == kind) {
				$(this).attr("selected", true);
			}
		});

		$(".list").click(function() {
			var cur = $(this).attr("title");
			document.frm.curPage.value = cur;
			document.frm.submit();
		});
		$("#write").click(function(){
			window.location.href="./${board}Write.${board}";
		});
		
		/* 
		$("#backpage").click(function() {
			window.location.href = "../index.jsp"
		}); */

	});
</script>
</head>
<body>
	<%@ include file="../temp/header.jsp" %>
	<section>
		<div>
		<h2><a href="./${board}List.${board}">${board}</a></h2>
		</div>
	
	
		<table class="list_table">
			<thead>
				<tr>
					<th id="num" scope="col">NO.</th>
					<th id="subject" scope="col">SUBJECT</th>
					<c:if test="${member.id eq 'admin'}">
						<th id="id" scope="col">ID</th>
					</c:if>
					<th id="date" scope="col">DATE</th>
					<th id="hit" scope="col">HIT</th>
				</tr>
			</thead>
			<c:forEach items="${list}" var="i">
				<tbody>
					<tr>
						<td>${i.num}</td>
						<td id="title"><c:catch>
								<c:forEach begin="1" end="${i.depth}">--</c:forEach>
							</c:catch> <a href="./${board}View.${board}?num=${i.num}">${i.title}</a></td>
						<c:if test="${member.id eq 'admin'}">
							<td>${i.id}</td>
						</c:if>
						<td>${i.reg_date}</td>
						<td>${i.hit}</td>
					</tr>
				</tbody>
			</c:forEach>
		</table>
	

		<div></div>
	
		<div id="div_page">
		
		<c:if test="${member.id eq 'admin'}">
			<button type="button" class="buttonWrite" id="write">글쓰기</button>
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
		</div>
	
		
	<div id="div_search">
			<form name="frm" action="./${board}List.${board}">
				<input type="hidden" name="curPage"> <select name="kind">
					<option class="kind" value="title">TITLE</option>
					<option class="kind" value="contents">CONTENTS</option>
					<option class="kind" value="title" value="contents">TITLE + CONTENTS</option>
				</select> 
				<input type="text" name="search" value="${make.search}">
				<button class="button">Search</button>
			</form>
		</div>

		

		<!-- <button type="button" class="btn" id="backpage">BackPage</button> -->
</section>
<%@ include file="../temp/footer.jsp" %>

</body>
</html>