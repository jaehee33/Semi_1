<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>${board} View</h1>
	<h3>NUM : ${view.num}</h3>
	<h3>TITLE : ${view.title}</h3>
	
	
	<a href="${board}Delete.${board}?num=${view.num}">Delete</a>
	<a href="${board}Update.${board}?num=${view.num}">update</a>
</body>
</html>