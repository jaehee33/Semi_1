<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/member/update.css" rel="stylesheet">
<title>가입정보수정</title>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
	<section id="main">
		<h2>정보 수정</h2>
		<form action="memberUpdate.member" method="post">
			<div id="content">
				<input type="hidden" name="id" value="${m2.id}">
				<p>pw: <input type="text" name="pw" value="${m2.pw}"></p>
				<p>MemberName : <input type="text" name="name" value="${m2.name}"></p>
				<p>Birth : <input type="date" name="birth" value="${m2.birth}"></p>
				<p>Phone : <input type="text" name="phone" value="${m2.phone}"></p>
				<button>수정</button>
				<p>
					<a href="./memberMyPage.member">취소</a>
				</p>
			</div>
		</form>
	</section>
</body>
</html>