<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="memberUpdate.member" method="post">
<input type="hidden" name="id" value="${m2.id}">
<p>MemberName : <input type="text" name="name" value="${m2.name}"></p>
<p>Birth : <input type="date" name="birth" value="${m2.birth}"></p>
<p>Phone : <input type="text" name="phone" value="${m2.phone}"></p>
<p><button>수정</button>
<a href="./memberMyPage.member">취소</a>
</p>
</form>
</body>
</html>