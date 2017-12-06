<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<title>Insert title here</title>

</head>
<body>
<h1>file</h1>

<form id="frm" action="./memberStyle.member" method="post" enctype="multipart/form-data">

<div id="files">
<input type="file" name="f1">
</div>

<input type="button" id="btn" value="add file">
<p><input type="submit" value="upload" id="savebutton"></p>
</form>

</body>
</html>