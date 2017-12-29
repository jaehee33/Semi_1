<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="<%=request.getContextPath()%>/css/store/posInsert.css" rel="stylesheet">

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
	
	var o=0;
	var i=0;
	$("#itemplus").click(function(){
		$("#frm").prepend('<p class="insertt" id="ins'+i+'"><input type="text" class="storename" name="store" value="${store}" readonly="readonly"><select title="'+i+'" name="kind" class="g kind"><option value="other">기타</option><c:forEach items="${kindlist}" var="a" varStatus="j"><option value="${a.style}" title="price${j.index}" id="'+i+'" class="op">${a.style}</option></c:forEach></select><c:forEach items="${kindlist}" var="b" varStatus="i"><input type="hidden" id="price${i.index}" value="${b.price}" class="e"></c:forEach><input type="number" name="pos_import" class="imoney insertmoney" id="i'+i+'"><input type="hidden" name="expend" value="0" id="price"><span id="'+i+'" class="O" style="color: red;"> X</span></p>')
	i++;
		o++;
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
		$("#frm").prepend('<p class="insertt" id="exp'+j+'"><input type="text" class="storename" name="store" value="${store}" readonly="readonly"><input type="text" class="kind" name="kind"><input type="number" name="expend" id="price" class="etotal imoney insertmoney"><input type="hidden" name="pos_import" id="price" value="0"><span id="'+j+'" class="X" style="color: red;"> X</span></p>');
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
		$(".op",this).each(function(){
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
			total=total-$(this).val()*2;
		});
		$("#instotal").html(total);
	
	});
	
	$("#insert").on("click","#btn",function(){
		var result=true;
		$(".imoney").each(function(){
			alert($(this).val());
			alert(result);
			if($(this).val() == ""){
				result=false;
			}
		});
		
		if(result==true){
		document.frm.submit();
		}else{
			alert("가격을 모두 입력해주세요");
		}
		
	});
	
});

</script>
<title>Insert title here</title>
</head>
<body>
<section id="main">
<%@ include file="../temp/header.jsp" %>
<div id="posBackground">
<%@ include file="./posHeader.jsp" %>

<div id="postitle"><ul><li class="storename">가게명</li><li class="kind">종류</li><li class="imoney" value="0">가격</li></ul></div>
<div id="insert"></div>

<div id="insertTotal"><span>Total : </span><span id="instotal"></span></div>
<div id="total"></div>
<input type="button" id="totalbtn" value="total" class="btn2">
<input type="hidden" value="import" id="itemplus" class="hide btn2" >
<input type="hidden" id="expend" class="hide btn2" value="expend">
<div>
<div id="import">START</div>
</div>
</div>
</section>
</body>
</html>