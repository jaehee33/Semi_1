<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<title>semi hair shop</title>
<style type="text/css">
.photo{
	height: 250px;
}
</style>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div class="container">
			<h1>스타일 즐겨찾기</h1>
			<table class="table table-hover">
				<c:forEach items="${list}" var="i">
					<tr>
						<td  rowspan="3"><c:forEach items="${files}" var="j">
								<c:if test="${i.num eq j.num}">
									<td><img class="photo" src="../upload/${j.fname}"></td>
								</c:if>
							</c:forEach>
						</td>
					</tr>
					<tr>
						<th>${i.store}</th>
					</tr>
					<tr>
						<th>${i.style}</th>
					</tr>
				</c:forEach>
			</table>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>