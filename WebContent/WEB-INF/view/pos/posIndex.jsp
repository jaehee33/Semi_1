<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
$(function(){
	$("#totalbtn").click(function(){
		$.get("./posTotal.pos?store=${store}",function(total){
			$("#total").html(total);
		});
	});
	
	$("#import").click(function(){
		$("#itemplus").attr("type","button");
		$.get("./posInsert.pos?store=${store}", function(data) {
			$("#insert").html(data);
		});
	});
	
	$("#itemdelete").click(function(){
		$("#insert"+i).remove();
		i--;
	});
	
	var i=0;
	$("#itemplus").click(function(){
		$("#insert").prepend('<p id="insert'+i+'"><input type="text" name="store" value="${store}" readonly="readonly"><select name="kind" class="g"><option value="other">기타</option><c:forEach items="${kindlist}" var="a" varStatus="j"><option value="${a.kind}" title="price${j.index}" class="op">${a.kind}</option></c:forEach></select><c:forEach items="${kindlist}" var="b" varStatus="i"><input type="hidden" id="price${i.index}" value="${b.price}" class="e"></c:forEach><input type="number" name="pos_import" value=""><input type="button" value="btn" id="btn"><button id="itemdelete">X</button></p>')
	i++;
	});
	
	$("#expend").click(function(){
		$.get("./posExpend.pos?store=${store}", function(data) {
			$("#expend2").html(data);
		});
	});
	
	$("#insert").on("change",".g",function(){
		$(".op").each(function(){
			if($(this).prop("selected")){
				var title=$(this).attr("title");
				$(".e").each(function(){
					if($(this).attr("id")==title){
					document.frm.pos_import.value=$(this).attr("value");
					}
				});
			}
		});
	});
	
	$("#insert").on("click","#btn",function(){
		document.frm.submit();
	});
	
});
</script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<div id="total"></div><input type="button" id="totalbtn" value="total">
<a href="./posList.pos?store=${store}">poslist</a>
<a href="./posbook.pos?store=${store}">예약목록</a>
<div id="insert"></div><input type="hidden" value="item +" id="itemplus"><input type="button" id="import" value="import">
<div id="expend2"></div><input type="button" id="expend" value="expend">
</body>
</html>