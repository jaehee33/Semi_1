<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		var xhttp=new XMLHttpRequest();
		
		xhttp.onreadystatechange=function(){
			if(this.readyState==4 && this.status==200){
				$("#main").html("<div>"+this.responseText+"</div>");
			}
		}
		
		xhttp.open("get", "kindListajax.jsp?store="+${store});
		xhttp.send();
		
	});
});

</script>
</head>
<body>
<section id="main">
<div>
<form action="kindinsert.kind">
KIND : <input type="text" placeholder="종류를 입력해주세요">
PRICE : <input type="number" placeholder="가격을 입력해주세요">
<button id="btn">insert</button>
</form>
</div>
</section>
</body>
</html>