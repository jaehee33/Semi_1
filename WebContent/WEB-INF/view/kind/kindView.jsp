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
		$.get('../style/styleInsert.style?num=${kind.num}&style=${kind.style}&price=${kind.price}&store=${kind.store}&page="View"', function(data){
			$("#favor").html(data);
		});	
		$("#btn").click(function(){
			var favor=$(this).attr("class");
			if(favor=="btn btn-default"){
				$(this).attr("class","btn btn-danger");
				
			}else {
				$(this).attr("class","btn btn-default");
			}
		});
	});
</script>
<style type="text/css">
#font{
	font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<table>
			<tr>
				<td><img src="../upload/${file.fname}"></td>
			</tr>
			<tr>
				<td><h3>${kind.style}</h3></td>
				<td id="favor"><td>
			</tr>
			<tr>
				<td>${kind.store}</td>
			</tr>
	</table>
	<hr>
	<table>
			<tr>
				<td id="font" colspan="3">이 스타일 관련 메뉴</td>
			</tr>
			<c:forEach items="${list}" var="i">		
			<tr>	
				<td>${i.style}</td>
				<td>${i.price}</td>
				<td><a href="../use/useWrite.use?store=${i.store}&style=${i.style}&price=${i.price}">예약</a></td>
			</tr>
			</c:forEach>

	</table>
</body>
</html>