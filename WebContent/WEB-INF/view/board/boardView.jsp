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
	<h3>CONTENTS: ${view.contents}</h4>
	
	<button type="button" onclick="${board}Delete.${board}?num=${view.num}">Delete</button>
	<button type="button" onclick="${board}Update.${board}?num=${view.num}">Update</button>
	<button><a href="${board}List.${board}?num=${view.num}">BackPage</a></button>
</body>
</html>