<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/Semi_1/css/board/write.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
	/* 	var i = 2;
		$("#btn").click(function() {
			var f = '<input type="file" name="f' + i + '">';
			$("#files").append(f);
			i++;
		});

		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "contents",
			sSkinURI : "../SE2/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true,
				bUseVerticalResizer : true,
				bUseModeChanger : true,
			}
		}); */

		$("#savebutton").click(
			function() {
				/* editor_object.getById["contents"].exec(
					"UPDATE_CONTENTS_FIELD", []); */

				$("#frm").submit();
			});
	});
</script>

</head>
<body>
<%@ include file="../temp/header.jsp"%>
	<section>
	<div id="div_h1">
	<h1 id="h1">Posting</h1>
	</div>
	
	<form id="frm" action="./${board}Write.${board}" method="post">
		<div class="frm_p"><div class="p">ID</div><p id="frm_idp">${member.id}<p> <input id="frm_id" type="hidden" name="id" value="${member.id}">
		</div>
		<div class="frm_p"><div class="p">TITLE</div> <input id="frm_title" type="text" name="title"></div>
		<div class="frm_p"><div class="p">CONTEXT</div><textarea id="frm_context" style="resize:none" name="contents" id="contents"></textarea></div>
		<!-- 	<div id="files">
		<input type="file" name="f1">
		</div>
		<input type="button" id="btn" value="Add File"> -->
	<p>
		<input type="button" value="글 등록하기" id="savebutton">
	</p>
	</form>
	
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>