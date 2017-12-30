<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<section id="main">
<div id="storeView">
<form action="storeUpdate.store" method="post" enctype="multipart/form-data">
<input type="hidden" name="id" value="${store.id}" >
<p>StoreName : <input type="text" name="store" value="${store.store}" readonly="readonly"></p>
<p>Area : <input type="text" name="area" value="${store.area}" readonly="readonly"></p>
<p>StoreTel : <input type="text" name="storetel" value="${store.storetel}"></p>
<p>Holiday : <input type="text" name="holiday" value="${store.holiday}"></p>
<p>file : <input type="file" name="file"></p>
<button>Write</button>
</form>
</div>
</section>
</body>
</html>
