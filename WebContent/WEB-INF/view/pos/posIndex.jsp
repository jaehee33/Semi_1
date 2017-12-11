<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$.get("./posList.pos?store=${store}", function(data) {
		$("#list").html(data);
	});
});
</script>
<title>Insert title here</title>
</head>
<body>
<div id="list"></div>
<a href="posInsert.pos?store=${store}">posInsert</a>
</body>
</html>