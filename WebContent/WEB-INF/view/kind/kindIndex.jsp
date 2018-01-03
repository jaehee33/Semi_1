<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/store/storeheader.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../slider/slick/slick.css">
<link rel="stylesheet" type="text/css"
	href="../slider/slick/slick-theme.css">
<link rel="stylesheet" href="../css/kind/kindstoreListflugin.css">
<link href="<%=request.getContextPath()%>/css/kind/kindindex.css" rel="stylesheet">
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
			$("#frm").prepend('<p id="o'+i+'"> '+i+' STYLE : <input type="text" placeholder="종류를 입력해주세요" name="style">PRICE : <input type="number" name="price" placeholder="가격을 입력해주세요"><select name="gender"><option value="W">Woman</option><option value="M">Man</option></select><select name="kind"><option value="펌">펌</option><option value="염색">염색</option><option value="컷">컷</option><option value="매직">매직</option><option value="기타">기타</option></select><input type="file" name="f'+i+'"></p>');
		i++;
		});
		$.get("../store/storeIndex.store?id=${storeid}",function(index){
			$("#storeheader").html(index);
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
html, body {
	margin: 0;
	padding: 0;
}

* {
	box-sizing: border-box;
}

.slider {
	width: 80%;
	margin: 100px auto;
}

.slick-slide {
	margin: 0px 20px;
}

.slick-slide img {
	width: 100%;
}

.slick-slide img:hover {
	width: 100%;
	border: 5px solid #5F4B8B;
}

.slick-prev:before, .slick-next:before {
	color: black;
}

.slick-slide {
	transition: all ease-in-out .3s;
	opacity: .2;
}

.slick-active {
	opacity: .5;
}

.slick-current {
	opacity: 1;
}
</style>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
	<section id="main">
	<div id="storeheader"></div>
	<div id="storeView">
		<button id="plus">+</button>
		<button id="btn">List 새로고침</button>
		<input type="hidden" class="form" id="formplus" value="item +">
		<input type="hidden" class="form" value="item -" id="formdelete">
		<div id="kindlist">
		
		</div>
		<script src="https://code.jquery.com/jquery-2.2.0.min.js"
			type="text/javascript"></script>
		<script src="../slider/slick/slick.js" type="text/javascript"
			charset="utf-8"></script>
		<script type="text/javascript">
			$(document).on('ready', function() {
				$(".vertical-center-4").slick({
					dots : true,
					vertical : true,
					centerMode : true,
					slidesToShow : 4,
					slidesToScroll : 2
				});
				$(".vertical-center-3").slick({
					dots : true,
					vertical : true,
					centerMode : true,
					slidesToShow : 3,
					slidesToScroll : 3
				});
				$(".vertical-center-2").slick({
					dots : true,
					vertical : true,
					centerMode : true,
					slidesToShow : 2,
					slidesToScroll : 2
				});
				$(".vertical-center").slick({
					dots : true,
					vertical : true,
					centerMode : true,
				});
				$(".vertical").slick({
					dots : true,
					vertical : true,
					slidesToShow : 3,
					slidesToScroll : 3
				});
				$(".regular").slick({
					dots : true,
					infinite : true,
					slidesToShow : 3,
					slidesToScroll : 3
				});
				$(".center").slick({
					dots : true,
					infinite : true,
					centerMode : true,
					slidesToShow : 5,
					slidesToScroll : 3
				});
				$(".variable").slick({
					dots : true,
					infinite : true,
					variableWidth : true
				});
				$(".lazy").slick({
					lazyLoad : 'ondemand', // ondemand progressive anticipated
					infinite : true
				});
			});
		</script>
		<div id="kindinsert">
			
		</div>
		</div>
	</section>
</body>
</html>