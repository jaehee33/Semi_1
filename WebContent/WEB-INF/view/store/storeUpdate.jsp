<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="storeUpdate.store" method="post">
<input type="hidden" name="id" value="${store.id}">
<p>StoreName : <input type="text" name="store" value="${store.store}"></p>
<p>Area : <input type="text" name="area" value="${store.area}"></p>
<p>StoreTel : <input type="text" name="storetel" value="${store.storetel}"></p>
<p>Holiday <input type="text" name="holiday" value="${store.holiday}"></p>
<button>Write</button>
</form>
</body>
</html>