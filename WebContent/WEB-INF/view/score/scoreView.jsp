<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
 $(function(){
	$("#delete").click(function(){
		window.location.href="${board}Delete.${board}?num=${view.num}";
	}); 
	$("#update").click(function(){
		window.location.href="${board}Update.${board}?num=${view.num}"
	});
	$("#backpage").click(function(){
		window.location.href="${board}List.${board}?num=${View.num}"
	});		
	 
 });
</script>
</head>
<body>
<h1>${board} View</h1>
	<h3>NUM : </h3>
	<h4>${view.num}</h4>
	<h3>TITLE : </h3>
	<h4>${view.title}</h4>
	<h3>CONTENTS: </h3>
	<h4>${view.contents}</h4>
	<h3>HIT: </h3>
	<h4>${view.hit}</h4>
	
	<c:if test="${member.id eq 'admin'}">
	<button id="delete" type="button" >Delete</button>
	</c:if>
	<c:if test="${member.id}">
	<button id="update"type="button">Update</button>
	</c:if>
	<button id="backpage">BackPage</button>
</body>
</html>