<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<style type="text/css">
body,h1,h2,h3,h4,h5,h6 {font-family: "Karma", sans-serif}
.w3-bar-block .w3-bar-item {padding:20px}
</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.photo{
	weight: 270px;
	height: 400px;
}
</style>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="">

		<!-- !PAGE CONTENT! -->
		<div class="w3-main w3-content w3-padding" style="max-width: 1200px; margin-top: 100px">			
			<div class="w3-row-padding w3-padding-16 w3-center" id="food">
				<c:forEach items="${kindlist}" var="k" varStatus="status">
					<div class="w3-quarter">
						<c:forEach items="${filelist}" var="f">
							<c:if test="${k.num eq f.num}">
								<img class="photo" src="../upload/${f.fname}"
									style="width: 100%">
							</c:if>
						</c:forEach>

						<h3><a href="./kindView.kind?num=${k.num}&style=${k.style}">${k.style}</a></h3>

						<c:forEach items="${storelist}" var="s">
							<c:if test="${k.store eq s.store}">
									<h4>${k.store}</h4>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>
			</div>
			<!-- Pagination -->
			<div class="w3-center w3-padding-32">
				<div class="w3-bar">
					<a href="#" class="w3-bar-item w3-button w3-hover-black">«</a>
					<a href="#" class="w3-bar-item w3-black w3-button">1</a> 
					<a href="#" class="w3-bar-item w3-button w3-hover-black">2</a>
					<a href="#" class="w3-bar-item w3-button w3-hover-black">»</a>
				</div>
			</div>
		</div>
	</section>
	
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>