<%@page import="com.iu.store.StoreDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/store/storeList.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/particleEffects.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>SemiHairShop - StoreList</title>
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
		
		var curPage=Number(${curPage});
		$(".btn_now").each(function(){
			if(Number($(this).attr("title"))==curPage){
				$(this).css("background-color","#5F4B8B");
				$(this).css("color","white");
			}
		});
		function initparticles() {
			   lines();
			}
		function lines() {
			   $.each($(".particletext.lines"), function(){
			      var linecount = ($(this).width()/50)*10;
			      for(var i = 0; i <= linecount; i++) {
			         $(this).append('<span class="particle" style="top:' + $.rnd(-30,30) + '%; left:' + $.rnd(-10,110) + '%;width:' + $.rnd(1,3) + 'px; height:' + $.rnd(20,80) + '%;animation-delay: -' + ($.rnd(0,30)/10) + 's;"></span>');
			      }
			   });
			}
		jQuery.rnd = function(m,n) {
		      m = parseInt(m);
		      n = parseInt(n);
		      return Math.floor( Math.random() * (n - m + 1) ) + m;
		}

		initparticles();
		
	});
	
</script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<section id="main">
<div id="list">
<div class="textcontainer">
   <span class="particletext lines">Store List</span>
</div>
<div id="search">
		<form name="frm" action="./storeList.store">
			<input type="hidden" name="curPage">
			<input type="text" name="search" value="${make.search}" placeholder="Search...">
			<button><img id="icon" src="../img/store/magnifying-glass.png" style="height: 15px; width: 15px;"></button>
		</form>
	</div>
<table class="table table-hover">
	<tr id="first">
		<td>store</td>
		<td>location</td>
	</tr>
	<c:forEach items="${requestScope.storelist}" var="s">
		<tr>
			<td><a href="./storeView.store?id=${s.id}">${s.store}</a></td>
			<td>${s.area}</td>
		</tr>
	</c:forEach>
</table>
<div id="pagination">
<c:if test="${page.curBlock gt 1}">
	<input type="button" value="<" title="${page.startNum-1}" class="list pageing">
	</c:if>
	<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
	<input type="button" value="${i}" title="${i}" class="list btn_now pageing">
	</c:forEach>
	<c:if test="${page.curBlock lt page.totalBlock}">
	<input type="button" value=">" title="${page.lastNum+1}" class="list pageing">
	</c:if>
	</div>
	</div>
	</section>
	<%@ include file="../temp/footer.jsp" %>
</body>
</html>