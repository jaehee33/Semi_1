<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.get("./kindList.kind", function(data) {
			$("#kindlist").html(data);
		});
		$("#btn").click(function() {
			$.get("./kindList.kind", function(data) {
				$("#kindlist").html(data);
			});
		});
		
		var i = 1;
		$("#plus").click(function() {
			$(".form").attr("type","button");
			$.get("./kindInsert.kind", function(data) {
				$("#kindinsert").append($("#kindinsert").html(data));
			});
		});
		
		$("#formplus").click(function(){
			$("#frm").prepend('<p id="o'+i+'"> '+i+' KIND : <input type="text" placeholder="종류를 입력해주세요" name="kind">PRICE : <input type="number" name="price" placeholder="가격을 입력해주세요"><input type="file" name="f'+i+'"></p>');
		i++;
		});
		
		$("#formdelete").click(function(){
			$("#o"+i).remove();
			if(i>1){
			i--;
			}
		});
		
	});
</script>
<style type="text/css">
#X{
color: red;
}
</style>
</head>
<body>
	<section id="main">
		<button id="plus">+</button>
		<button id="btn">List 새로고침</button>
		<input type="hidden" class="form" id="formplus" value="item +">
		<input type="hidden" class="form" value="item -" id="formdelete">
		<div id="kindlist">
		
		</div>
		<div id="kindinsert">
			
		</div>
	</section>
</body>
</html>