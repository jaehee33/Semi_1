<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	var btn=document.getElementById("overlap");
	btn.addEventListener("click", function() {
		var id=document.frm.id.value;
		window.open("memberIdCheck.jsp?id="+id, "", "top=200, left=300, width=400, height=300");
	});
	var result=true;
	var result2=true;
	var check=document.getElementById("check");
	check.addEventListener("click", function() {
		var idCheck=document.frm.idCheck.value;
		var n=document.getElementsByClassName("n");
		for(var i=0; i<n.length; i++){
			if(n[i].value==""){
				result=false;
			}
		}
		if(n[0].value !==n[1].value){
			result2=false;
		}
		if(result && result2 && idCheck=="1"){
		document.frm.submit();
		}else{
			alert("모두 입력 하세요");
		}
	});
	
	var id=document.getElementById("id");
	id.addEventListener("change", function() {
		document.frm.idCheck.value="0";
	});

}
</script>
</head>
<body>
<h1>join</h1>
<form action="./memberJoin.member" method="post">
<input type="hidden" name="idCheck" value="0">
<p>ID: <input type="text" name="id" id="id">
<input type="button" id="overlap" value="중복확인"></p>
<p>PW: <input type="password" name="pw"></p>
<p>NAME: <input type="text" name="name"></p>
<p>BIRTH: <input type="date" name="birth"></p>
<p>PHONE: <input type="text" name="phone"></p>
<p>
Customer<input type="radio" name=job id="j1" value="B" checked="checked">
Store<input type="radio" name=job id="j2" value="S"></p>
<p><input type="button" value="Join" id="check"></p>
</form>
</body>
</html>






