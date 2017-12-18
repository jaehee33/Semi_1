<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
 	$(function(){
 		$(".btn").click(function(){
 			var favor=$(this).attr("class");
 			if(favor=="btn btn-default"){
 				$(this).attr("class","btn btn-danger");
 			}else {
 				$(this).attr("class","btn btn-default");
 			}
 		});
 	});
</script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<table>
		<c:forEach items="${kindlist}" var="k">
			<tr>
				<c:forEach items="${filelist}" var="f">
					<c:if test="${k.num eq f.num}">
						<td><img src="../upload/${f.fname}"></td>
					</c:if>
				</c:forEach>
			</tr>
			<tr>
				<td><h3><a href="./kindView.kind?num=${k.num}">${k.style}</a></h3></td>
				<c:if test="${not empty member}">
					<td><button type="button" class="btn btn-default" id="btn">♡</button></td>
				</c:if>
			</tr>
			<tr>
				<c:forEach items="${storelist}" var="s">
					<c:if test="${k.store eq s.store}">
						<td>${k.store}</td>
						<div id="favorInsert">
						
						</div>
					</c:if>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
</body>
</html>