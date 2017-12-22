<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.get('../style/styleInsert.style?num=${kind.num}&style=${kind.style}&price=${kind.price}&store=${kind.store}&page="view"', function(data) {
			$("#favor").html(data);
		});
		$("#favor").on("click", "#btn", function() {
			var favor = $(this).attr("class");
			document.frm.submit();
			if (favor == "btn btn-default") {
				$("#btn").attr("class", "btn btn-danger");
			} else {
				$("#btn").attr("class", "btn btn-default");
			}
		});
	});
</script>
<style type="text/css">
#font {
	font-weight: bold;
}
</style>
<link href="<%=request.getContextPath()%>/css/kind/kindView.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div class="view_wrap">
			<article class="view_product">
				<header class="header">
					<div class="photo">
						<img src="../upload/${file.fname}">
						<p class="date">
							<strong>매장명 </strong> ${kind.store} <strong>가격</strong>
							${kind.price }
						</p>
						<div id=favor></div>

					</div>
					<div class="buy">
						<a href="../use/useWrite.use?store=${kind.store}&style=${kind.style}&price=${kind.price}" target="_self">예약하기</a>
					</div>
				</header>
			</article>
		</div>

		<article class="view_flavor consist">
			<h2>추천 스타일</h2>
			<div class="list_product">
				<ul class="list">
					<c:forEach items="${list}" var="i">
						<li><a href="./kindView.kind?num=${i.num}&style=${i.style}">${i.style}<img src="../upload/${file.fname}"></a></li>
					</c:forEach>
				</ul>
			</div>
		</article>
	</section>
</body>
</html>