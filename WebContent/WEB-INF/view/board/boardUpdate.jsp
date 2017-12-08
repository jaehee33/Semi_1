<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Update ${board}</h1>
	<form action="./${board}Update.${board}" method="post">
		<input type="hidden" name="num" value="${view.num}">
		<input type="text" name="writer" readonly="readonly" value="${view.writer}">
		<input type="text" name="title" value="${view.title}">
		<textarea rows="" cols="" name="contents">${view.contents}</textarea>
		<button>Update</button>
	</form>	
</body>
</html>