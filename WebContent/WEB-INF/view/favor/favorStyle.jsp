<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>semi hair shop</title>
<style type="text/css">

select {
	height: 26px;
}

.container {
	height: 600px;
	weight: 800px;
}

#box{
	height: 75%;
	background-color: #fff;
	padding: 30px;
	margin-top: 30px;
}

.style{
	float: left;
	padding-right: 10px;
	
}

h1{
	margin-top: 10px;
	text-align: center;
	color: #5f4b8b;
	padding: 10px;
	font-size: xx-large;
}

h6{
	text-align: center;
	margin-bottom: 60px;
}
</style>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div class="container">
			<div id="box">
				<h1>스타일 즐겨찾기</h1>
				<h6>즐겨찾기한 스타일을 한 눈에 볼 수 있습니다</h6>
				<c:forEach items="${list}" var="i">
				<div class="style">
					<c:forEach items="${files}" var="j">
						<c:if test="${i.num eq j.num}">
							<a href="../kind/kindView.kind?num=${i.num}&style=${i.style}"><img
								src="../upload/${j.fname}" width="200" height="250"></a>
						</c:if>
					</c:forEach>
					<br>
					<p class="text-center">
						<a href="../kind/kindView.kind?num=${i.num}&style=${i.style}"><strong>${i.style}</strong><br></a>
						<a href="../store/storeView.store?id=${i.store_id}"><strong>${i.store}</strong></a>
					</p>
				</div>
				</c:forEach>
			</div>
		</div>

	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>