<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script type="text/javascript">
window.onload=function(){
	var btn=document.getElementById("btn");
var id=document.frm.id.value;
	btn.addEventListener("click", function() {
		window.opener.document.frm.id.value=${m2.id};
		window.opener.document.frm.idCheck.value="1";
		window.self.close();
	});
	
}
</script>
</head>
<body>
	<h1>ID Check</h1>
	<form action="memberIdCheck.member" method="post" name="frm">
		<input type="text" name="id" value="<%=request.getParameter("id") %>">
		<button>중복확인</button>
		<h3>${check}</h3>
		
	</form>
	
	<c:if test="${check eq true}">
	<button id="btn"  class="btn btn-link" >사용하기</button>
	</c:if>


</body>
</html>