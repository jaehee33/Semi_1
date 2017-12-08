<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
	var i = 2;
	$("#btn").click(function(){
		var f='<input type="file" name="f'+i+'">';
		$("#files").append(f);
		i++;
	});
});
</script>
</head>
<body>
<h1>file</h1>

<form id="frm" action="./memberStyle.member" method="post" enctype="multipart/form-data">

<div id="files">
<input type="file" name="f1">
</div>

<input type="button" id="btn" value="다른사진추가">
<p><input type="submit" value="사진올리기" id="savebutton"></p>
</form>

</body>
</html>