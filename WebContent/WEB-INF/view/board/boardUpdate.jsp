<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${board} 수정</title>
<link rel="stylesheet" href="/Semi_1/css/board/update.css">
</head>
<body>
<%@ include file="../temp/header.jsp"%>
	<section>
	<div id="h1">
	<h1 id="h1_h1">Update ${board}</h1>
	</div>
	<form id="form" action="./${board}Update.${board}" method="post">
		<input type="hidden" name="num" value="${view.num}">
		<div class="frm_section"><h4>ID </h4><input class="input" type="text" name="id" readonly="readonly" value="${view.id}"></div>
		<div class="frm_section"><h4>TITLE </h4><input class="input" type="text" name="title" value="${view.title}"></div>
		<div class="frm_section"><h4>CONTENTS </h4><textarea id="textarea" style="resize:none" class="input" rows="" cols="" name="contents">${view.contents}</textarea></div>
	<button id="button">Update</button>
	</form>	
	
	
</section>

<%@ include file="../temp/footer.jsp"%>

</body>
</html>