<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/store/storeheader.css" rel="stylesheet">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$.get("../store/storeIndex.store?id=${store.id}",function(index){
		$("#storeheader").html(index);
	});
});
</script>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<section id="main">
<div id="storeheader"></div>
<table>
	<tr>
		<td>kind</td>
		<td>price</td>
	</tr>
	<c:forEach items="${kindlist}" var="k">
		<tr>
		<c:forEach items="${filelist}" var="f">
		<c:if test="${k.num eq f.num}">
		<td><img src="../upload/${f.fname}"></td>
		</c:if>
		</c:forEach>
			<td>${k.kind}</td>
			<td>${k.price}</td>
			<td><a href="../use/useWrite.use?store=${store.store}&style=${k.kind}&price=${k.price}">예약</a></td>
		</tr>
	</c:forEach>
</table>
</section>
</body>
</html>