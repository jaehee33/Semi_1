<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SemiHairShop</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Karma">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link href="<%=request.getContextPath()%>/css/kind/kindList.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="">
		<!-- !PAGE CONTENT! -->
		<div class="w3-main w3-content w3-padding" style="max-width: 1200px; margin-top: 100px">
			<hr>
			<div class="dropdown">
				<button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
					스타일 선택 <span class="caret"></span>
				</button>
				<ul class="dropdown-menu">
					<li class="dropdown-header">여자스타일</li>
					<li><a href="./kindFList.kind?kind=컷&gender=W" class="style">커트</a></li>
					<li><a href="./kindFList.kind?kind=펌&gender=W" class="style">펌</a></li>
					<li><a href="./kindFList.kind?kind=염색&gender=W" class="style">염색</a></li>
					<li class="divider"></li>
					<li class="dropdown-header">남자스타일</li>
					<li><a href="./kindFList.kind?kind=컷&gender=M" class="style">커트</a></li>
					<li><a href="./kindFList.kind?kind=펌&gender=M" class="style">펌</a></li>
					<li><a href="./kindFList.kind?kind=염색&gender=M" class="style">염색</a></li>
				</ul>
			</div>
			<hr>
			<div class="w3-row-padding w3-padding-16 w3-center" id="food">
				<c:if test="${kind == null}">
					<c:forEach items="${kindlist}" var="k" varStatus="status">
					<div class="w3-quarter">
						<c:forEach items="${filelist}" var="f">
							<c:if test="${k.num eq f.num}">
								<a href="./kindView.kind?num=${k.num}&style=${k.style}">
									<img src="../upload/${f.fname}" onclick="onClick(this)" class="photo w3-hover-opacity" style="width: 100%">
								</a>
							</c:if>
						</c:forEach>
						<h4>
							<a href="./kindView.kind?num=${k.num}&style=${k.style}" class="style">${k.style}</a>
						</h4>
					</div>
				</c:forEach>
				</c:if>
				<c:if test="${kind != null}">
					<c:forEach items="${kindarr}" var="k" varStatus="status">
					<div class="w3-quarter">
						<c:forEach items="${filelist}" var="f">
							<c:if test="${k.num eq f.num}">
								<a href="./kindView.kind?num=${k.num}&style=${k.style}">
									<img src="../upload/${f.fname}" onclick="onClick(this)" class="photo w3-hover-opacity" style="width: 100%">
								</a>
							</c:if>
						</c:forEach>
						<h4>
							<a href="./kindView.kind?num=${k.num}&style=${k.style}" class="style">${k.style}</a>
						</h4>
					</div>
				</c:forEach>
				</c:if>
			</div>
		</div>
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>