<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${board}</title>
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
		
		$(".list_button").click(function() {
			var cur = $(this).attr("title");
			document.frm.curPage.value = cur;
			document.frm.submit();
		});
		
		$("#write").click(function(){
			window.location.href="./${board}Write.${board}";
		});
		

		var curPage=Number(${curPage});		
		$(".button_now").each(function(){
			if(Number($(this).attr("title"))==curPage){
				$(this).css("background-color","Gainsboro");
			}
		});
		
		
		$(".g").each(function(){
			var num=$(this).attr("title");
			$("#title"+num).click(function(){
				$("#contents_view"+num).slideToggle("slow");
				
			});
		});
		
		/* 
		$("#backpage").click(function() {
			window.location.href = "../index.jsp"
		}); */

});
</script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section>
		<div>
			<h1>${board}(${count})</h1>
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
			<tbody>
				<c:forEach items="${list}" var="i" varStatus="j">
					<tr>
						<td>${i.num}</td>
						<td id="title${j.index}" class="g" title="${j.index}"><c:catch>
								<c:forEach begin="1" end="${i.depth}">--</c:forEach>
							</c:catch>
							<p class="table_title">${i.title}<!-- <img class="img_up" src="/Semi_1/img/board/up_arrow.png"><img class="img_down" src="/Semi_1/img/board/down_arrow.png"> -->
							</p>

							<div id="contents_view${j.index}" class="div_view">
								<p class="toggle_contents">${i.contents}
								<div class="div_deletebutton">
								<c:if test="${member.id eq 'admin'}">
									<a class="buttona" href="${board}Delete.${board}?num=${i.num}">DELETE</a>
									<a class="buttona" href="${board}Update.${board}?num=${i.num}">UPDATE</a>
								</c:if>
								</div>
								</p>
							</div></td>
						<c:if test="${member.id eq 'admin'}">
							<td>${i.id}</td>
						</c:if>
						<td>${i.reg_date}</td>
						<td>${i.hit}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<div id="div_page">
			<c:if test="${member.id eq 'admin'}">
				<button type="button" class="buttonWrite" id="write">글쓰기</button>
			</c:if>




			<c:if test="${not empty make}">
				<input type="button" class="list_button" title="${page.startNum}"
					value="<<">
			</c:if>

			<c:if test="${not empty make}">
				<c:choose>
					<c:when test="${page.curBlock gt 1}">
						<input type="button" class="list_button"
							title="${page.curBlock-1}" value="<">
					</c:when>
					<c:otherwise>
						<input type="button" class="list_button" title="${page.curBlock}"
							value="<">
					</c:otherwise>
				</c:choose>
			</c:if>

			<%-- 	
		<c:if test="${page.curBlock gt 1}">
			<input type="button" class="list" title="${page.startNum-1}"
				value="[이전]">
		</c:if> --%>

			<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
				<input type="button" class="list_button button_now" title="${i}"
					value="${i}">
			</c:forEach>

			<%-- 	<c:if test="${page.curBlock lt page.totalBlock}">
			<input type="button" class="list" title="${page.lastNum+1}"
				value="[다음]">
		</c:if> --%>


			<c:if test="${not empty make}">
				<input type="button" class="list_button" title="${page.curBlock+1}"
					value=">">
			</c:if>

			<c:if test="${not empty make}">
				<input type="button" class="list_button" title="${page.lastNum}"
					value=">>">
			</c:if>
		</div>


		<div id="div_search">
			<form name="frm" action="./${board}List.${board}">
				<input type="hidden" name="curPage"> <select name="kind">
					<option class="kind" value="title">TITLE</option>
					<option class="kind" value="contents">CONTENTS</option>
					<option class="kind" value="title" value="contents">TITLE + CONTENTS</option>
				</select> <input type="text" name="search" value="${make.search}">
				<button class="button">Search</button>
			</form>
		</div>



		<!-- <button type="button" class="btn" id="backpage">BackPage</button> -->
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>