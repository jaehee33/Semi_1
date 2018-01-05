<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/store/storeheader.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/kind/kindindex.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/store/storeheader.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/kind/kindstoreList.css"
	rel="stylesheet">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../slider/slick/slick.css">
<link rel="stylesheet" type="text/css"
	href="../slider/slick/slick-theme.css">
<link rel="stylesheet" href="../css/kind/kindstoreListflugin.css">

<title>SemiHairShop</title>
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
			$(".form").attr("type", "button");
			$.get("./kindInsert.kind", function(data) {
				$("#kindinsert").html(data);
			});
		});

		$("#formplus").click(function() {
			if(i<10){
			$("#frm-item").append('<p id="o' + i + '" class="tt"><input type="text" placeholder="종류를 입력해주세요" class="emptykind style" name="style"><input type="number" class="emptykind price" name="price" placeholder="가격을 입력해주세요"><select name="gender" class="gender"><option value="W">Woman</option><option value="M">Man</option></select><select class="kind" name="kind"><option value="펌">펌</option><option value="염색">염색</option><option value="컷">컷</option><option value="매직">매직</option><option value="기타">기타</option></select><input type="file" class="emptykind file" name="f' + i + '"></p>');
			i++;				
			}else{
				alert("10개까지만 추가 가능합니다.");
			}
		});
		$.get("../store/storeIndex.store?id=${storeid}", function(index) {
			$("#storeheader").html(index);
		});

		$("#formdelete").click(function() {
			$("#o" + i).remove();
			if (i > 1) {
				i--;
			}
		});
		$("#kindinsert").on("click", "#kindbtn", function() {
			var result = true;
			$(".emptykind").each(function() {
				if ($(this).val() == "") {
					result = false;
				}
			});


			if (result) {
				document.frm.submit();
			} else {
				alert("내용을 모두 입력해주세요.");
			}
		});

	});
</script>
<style type="text/css">
#X {
	color: red;
}
</style>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div id="storeheader"></div>
		<div id="storeoiew">
			<div id="listbtnt">
				<input type="button" id="plus" class="plus" value="+"> <input
					type="button" id="btn" class="plus" value="List"> <input
					type="hidden" class="form plus" id="formplus" value="item +">
				<input type="hidden" class="form plus" value="item -"
					id="formdelete">
				<div id="kindinsert"></div>
			</div>
				<div id="kindlist"></div>
		</div>
	</section>
</body>
</html>