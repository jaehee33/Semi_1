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
		$.get("kindList.kind", function(data){
			$("#main").prepend(data);
		});
		
	});
	$("#plus").click(function(){
		$("#main").append('<div><form action="kindinsert.kind">KIND : <input type="text" placeholder="종류를 입력해주세요">PRICE : <input type="number" placeholder="가격을 입력해주세요"><button id="btn">insert</button></form></div>');
	});
});

</script>
</head>
<body>
<section id="main">
<button id="plus">+</button>
<button id="btn">List</button>
<div>
<form action="kindInsert.kind" method="post">
KIND : <input type="text" name="kind" placeholder="종류를 입력해주세요">
PRICE : <input type="number" name="price" placeholder="가격을 입력해주세요">
<button>insert</button>
</form>
</div>
</section>
</body>
</html>