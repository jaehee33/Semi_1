<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$("#savebutton").click(
				function() {
					$("#frm").submit();
				})
		});
	</script>
</head>
<body>
	<form id="frm" action="./${board}Write.${board}" method="post"
		enctype="multipart/form-data">
		<p>
			ID : ${member.id} <input type="hidden" name="id" value="${member.id}">
		</p>
		<p>
			TITLE: <input type="text" name="title">
		</p>
		<p>
			CONTEXT:
			<textarea rows="" cols="" name="contents" id="contents"></textarea>
		</p>
		<p>
			<input type="button" value="글쓰기" id="savebutton">
		</p>
	</form>

</body>
</html>