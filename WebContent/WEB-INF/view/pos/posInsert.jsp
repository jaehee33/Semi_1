<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="posInsert.pos" method="post">
<input type="text" name="store" value="${sname}" readonly="readonly">
<input type="number" name="total">
<button>버튼</button>
</form>
</body>
</html>