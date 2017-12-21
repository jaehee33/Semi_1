<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>아이디 중복체크</title>
<link href="<%=request.getContextPath()%>/css/member/idCheck.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
window.onload=function(){
	var btn=document.getElementById("btn");
	btn.addEventListener("click", function() {
		window.opener.document.frm.id.value='${id}';
		window.opener.document.frm.idCheck.value="1";
		window.self.close();
	});
	
}
</script>
</head>
<body>
	<h1>아이디 중복확인</h1>
	<form action="memberIdCheck.member" name="frm">
		<input type="text" name="id" class="box" value="${id}">
		<button>중복확인</button>
	</form>
	
	<%boolean ch=true;%>
	<c:if test="${id eq ''}">
		<h3>사용 불가능한 ID 입니다.</h3>
	<%ch=false; %>
	</c:if>
	<%if(ch){ %>
	<c:if test="${check eq true}">
		<h3>${message}</h3>
	<button id="btn"  class="btn btn-link" >사용하기</button>
	</c:if>
	<c:if test="${check eq false}">
		<h3>${message}</h3>
	</c:if>
	<%}%>


</body>
</html>