<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="<%=request.getContextPath()%>/css/favor/favor.css" rel="stylesheet">
<title>semi hair shop</title>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div class="container">
			<div id="box">
				<h1>가게 즐겨찾기</h1>
				<p id="info1">즐겨찾기한 가게를 한 눈에 볼 수 있습니다</p>
				
				<c:forEach items="${list}" var="i">
					<div class="style">
						<c:forEach items="${files}" var="j">
							<c:if test="${i.store eq j.store}">
								<a href="../store/storeView.store?id=${i.store_id}"><img src="../upload/${j.fname}" width="200" height="250" onclick="onClick(this)" class="photo w3-hover-opacity"></a>
							</c:if>
						</c:forEach>
						<br>
						<p class="text-center">
							<a id="storename" href="../store/storeView.store?id=${i.store_id}">${i.store}</a>
						</p>
					</div>
				</c:forEach>
			</div>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>