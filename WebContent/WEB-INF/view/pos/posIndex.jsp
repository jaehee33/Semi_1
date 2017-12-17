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
		$(".hide").attr("type","button");
		$.get("./posInsert.pos?store=${store}", function(data) {
			$("#insert").html(data);
		});
	});
	
	
	var i=0;
	$("#itemplus").click(function(){
		$("#frm").prepend('<p id="ins'+i+'"><input type="text" name="store" value="${store}" readonly="readonly"><select name="kind" class="g"><option value="other">기타</option><c:forEach items="${kindlist}" var="a" varStatus="j"><option value="${a.kind}" title="price${j.index}" class="op">${a.kind}</option></c:forEach></select><c:forEach items="${kindlist}" var="b" varStatus="i"><input type="hidden" id="price${i.index}" value="${b.price}" class="e"></c:forEach><input type="number" name="pos_import"><input type="hidden" name="expend" value="0" id="price"></p>')
	i++;
	});
	
	$("#itemdelete").click(function(){
		i--;
		$("#ins"+i).remove();
	});
	
	if(i<0){
		i=0;
	}
	
	var j=0;
	$("#expend").click(function(){
		$("#frm").prepend('<p id="exp'+j+'"><input type="text" name="store" value="${store}" readonly="readonly"><input type="text" name="kind"><input type="number" name="expend" id="price"><input type="hidden" name="pos_import" id="price" value="0"></p>');
	j++;
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
<div id="insert"></div>
<input type="hidden" value="item +" id="itemplus" class="hide">
<input type="hidden" value="item-" id="itemdelete" class="hide">
<input type="button" id="import" value="insert">
<input type="hidden" id="expend" class="hide" value="expend">
</body>
</html>