<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
<h1>join</h1>
<form action="./memberJoin.member" method="post">
<p>ID: <input type="text" name="id"></p>
<p>PW: <input type="password" name="pw"></p>
<p>NAME: <input type="text" name="name"></p>
<p>BIRTH: <input type="date" name="birth"></p>
<p>PHONE: <input type="text" name="phone"></p>
<p>
Customer<input type="radio" name=job id="j1" value="B" checked="checked">
Store<input type="radio" name=job id="j2" value="S"></p>
<button>Join</button>
</form>
</body>
</html>






