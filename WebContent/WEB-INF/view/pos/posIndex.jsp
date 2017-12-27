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
	var total=0;
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
		$("#frm").prepend('<p id="ins'+i+'"><input type="text" name="store" value="${store}" readonly="readonly"><select name="kind" class="g"><option value="other">기타</option><c:forEach items="${kindlist}" var="a" varStatus="j"><option value="${a.kind}" title="price${j.index}" class="op">${a.kind}</option></c:forEach></select><c:forEach items="${kindlist}" var="b" varStatus="i"><input type="hidden" id="price${i.index}" value="${b.price}" class="e"></c:forEach><input type="number" name="pos_import" class="imoney" id="i'+i+'"><input type="hidden" name="expend" value="0" id="price"><span id="'+i+'" class="O">X</span></p>')
	i++;
	});
	
	$("#insert").on("click",".O",function(){
		var i=$(this).attr("id");
		total=total-Number($("#i"+i).val());
		$("#ins"+i).remove();
		$("#instotal").html(total);
		i--;
	});
	
	if(i<0){
		i=0;
	}
	
	
/* 	$("#insert").on("blur",".etotal",function(){
		$(".etotal").each(function(){
			total=total-Number($(this).val());
		});
		$("#instotal").html(total+"-");
		if(total>0){
			total=0;
		}
	});
	 */
	
	var j=0;
	$("#expend").click(function(){
		$("#frm").prepend('<p id="exp'+j+'"><input type="text" name="store" value="${store}" readonly="readonly"><input type="text" name="kind"><input type="number" name="expend" id="price" class="etotal imoney"><input type="hidden" name="pos_import" id="price" value="0"><span id="'+j+'" class="X">X</span></p>');
	j++;
	});
	
	$("#insert").on("click",".X",function(){
		var j=$(this).attr("id");
		$("#exp"+j).remove();
		j--;
	});
	if(j<0){
		j=0;
	}
	
	
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
	
	$("#insert").on("blur",".imoney",function(){
		if(total>0){
			total=0;
		}
		$(".imoney").each(function(){
			total=total+Number($(this).val());
		});
		$(".etotal").each(function(){
			alert(total);
			
			total=total-$(this).val()*2;
		alert(total);
		});
		$("#instotal").html(total);
	
	});
	
	$("#insert").on("click","#btn",function(){
		document.frm.submit();
	});
	
});
</script>
<title>Insert title here</title>
</head>
<body>
<section id="main">
<%@ include file="../temp/header.jsp" %>
<%@ include file="./posHeader.jsp" %>
<div id="total"></div><input type="button" id="totalbtn" value="total">
<div id="insert"></div>
<div id="insertTotal"><p>Total :</p><p id="instotal"></p></div>
<input type="hidden" value="item +" id="itemplus" class="hide">
<input type="button" id="import" value="insert">
<input type="hidden" id="expend" class="hide" value="expend">
</section>
</body>
</html>