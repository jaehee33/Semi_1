<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SemiHairShop - PosList</title>
<style type="text/css">
#first{
font-weight: bold;
font-size: 15px;
}
td a{
text-decoration: none;
}

td a:hover{
color: red;
text-decoration: none;
}
.pageing{
	border: none;
	background-color: white;
	color: #5F4B8B;
	width: 30px;
	height: 30px;
	border-radius: 50px;
}

.pageing:hover{
	background-color: #E1E1E1;
}

#pagination{
	width: 300px;
	margin:10px auto;
	text-align: center;
}

</style>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
     <script type="text/javascript">
	$(function(){
		
			$.get("./posTotal.pos?store=${store}",function(total){
				$("#total").html(total);
			});
		$(".list").click(function(){
			var cur = $(this).attr("title");
			document.frm.curPage.value=cur;
			document.frm.submit();
		});
		var curPage=Number(${curPage});
		$(".btn_now").each(function(){
			if(Number($(this).attr("title"))==curPage){
				$(this).css("background-color","#5F4B8B");
				$(this).css("color","white");
			}
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
<section id="main">
<div id="posBackground">
<%@ include file="./posHeader.jsp" %>
<div>
		<form name="frm" action="./posList.pos">
			<input type="hidden" name="curPage">
			<input type="hidden" name="store" value="${store}">
		</form>
	</div>
	<p id="total"></p>
<table class="table table-hover">
		<tr id="first">
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
			<c:if test="${a.state eq null}">
			<td><a href="posDelete.pos?num=${a.num}&store=${a.store}">X</a></td>
			</c:if>
		</tr>
		</c:forEach>
	</table>
	<div id="pagination">
	<c:if test="${page.curBlock gt 1}">
	<input type="button" value="[이전]" title="${page.startNum-1}" class="list pageing">
	</c:if>
	<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
	<input type="button" value="${i}" title="${i}" class="list btn_now pageing">
	</c:forEach>
	<c:if test="${page.curBlock lt page.totalBlock}">
	<input type="button" value="[다음]" title="${page.lastNum+1}" class="list pageing">
	</c:if>
	</div>
	</div>
	</section>
</body>
</html>