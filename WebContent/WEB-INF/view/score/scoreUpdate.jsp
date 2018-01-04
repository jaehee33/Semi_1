<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Update ${score}</h1>
	<form action="./${score}Update.${score}" method="post">
		<input type="hidden" name="num" value="${view.num}">
		<h3>ID: </h3><input type="text" name="id" readonly="readonly" value="${view.id}">
		<h3>TITLE: </h3><input type="text" name="title" value="${view.title}">
		<h3>CONTENTS: </h3><textarea rows="" cols="" name="contents">${view.contents}</textarea>
		<button>Update</button>
	</form>	
</body>
</html>