<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="/Semi_1/css/coupon/couponInsert.css" rel="stylesheet">
</head>
<body>
<%@ include file="../temp/header.jsp"%>
<section>
<form action="couponInsert.coupon" method="POST">
이름: <input type="text" name="coupon">
할인율: <input type="number" name="count">%
<button>저장</button>
</form>
</section>
<%@ include file="../temp/footer.jsp" %>
</body>
</html>