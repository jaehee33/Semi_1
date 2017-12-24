<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
			$("#frm").prepend('<p id="o'+i+'"> '+i+' STYLE : <input type="text" placeholder="종류를 입력해주세요" name="style">PRICE : <input type="number" name="price" placeholder="가격을 입력해주세요"><select name="kind"><option value="펌">펌</option><option value="염색">염색</option><option value="컷">컷</option><option value="매직">매직</option><option value="기타">기타</option></select><input type="file" name="f'+i+'"></p>');
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
<%@ include file="../temp/header.jsp" %>
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