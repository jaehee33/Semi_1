<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="<%=request.getContextPath()%>/css/join.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		var btn = document.getElementById("overlap");
		btn.addEventListener("click", function() {
			var id = document.frm.id.value;
			window.open("./memberIdCheck.member?id="+id, "", "top=200, left=300, width=400, height=300");
		});
		
		var pw = document.getElementById("pw");
		var pw2 = document.getElementById("pw2");
		var pwResult=false;
		pw.addEventListener("blur", function() {
			var pwcheck2 = document.getElementById("pwcheck2");
			if (pw.value != pw2.value) {
				pwcheck2.innerHTML = "비밀번호가 다릅니다."
				pwcheck2.style.color="red";
			}	
			pw2.addEventListener("blur", function(){
			if(pw.value == pw2.value){
				pwcheck2.innerHTML = "사용가능한 비밀번호 입니다."
				pwcheck2.style.color="green";
			}else{
				pwcheck2.innerHTML = "비밀번호가 다릅니다."
				pwcheck2.style.color="red";
				pwResult=false;
			}
			});
		});

		var result = true;
		var result2 = true;
		var check=document.getElementById("check");
		check.addEventListener("click", function() {
			var idCheck = document.frm.idCheck.value;
			var n = document.getElementsByClassName("n");
			for (var i = 0; i < n.length; i++) {
				if (n[i].value == "") {
					result = false;
				}
			}
			if (n[0].value != n[1].value) {
				result2 = false;
			}

			if (result && result2 && idCheck=="1") {
				document.frm.submit();
			} else {
				alert("모두 입력하세요");
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
	<h1>JOIN US</h1>

	<form name="frm" action="./memberJoin.member" method="post">
		<input type="hidden" name="idCheck" value="0">
		<table>
			<tr>
				<th><a>*</a>아이디:</th>
				<td><input type="text" name="id" id="id" placeholder="ID" class="box">
					<input type="button" value="중복확인" class="btn" id="overlap"></td>
			</tr>
			
			<tr>
				<th><a>*</a>비밀번호:</th>
				<td><input type="password" name="pw" id="pw" class="n box" placeholder="Password"></td>
			</tr>
			
			<tr>
				<th><a>*</a>비밀번호 확인:</th>
				<td><input type="password" name="pw" id="pw2" class="n box"><span id="pwcheck2"></span></td>
			</tr>
			
			<tr>
				<th><a>*</a>이름:</th>
				<td><input type="text" name="name" class="box"></td>
			</tr>
			
			<tr>
				<th><a>*</a>생일:</th>
				<td><input type="date" name="birth" class="box"></td>
			</tr>
			
			<tr>
				<th><a>*</a>연락처:</th>
				<td><input type="text" name="phone" class="box"></td>
			</tr>
			
			<tr>
				<th><a>*</a></th> 
				<td>고객용 <input type="radio" name=job id="j1" value="B" checked="checked">
				가맹점용 <input type="radio" name=job id="j2" value="S"></td>
			</tr>


		</table>

		<p>
			<input type="button" value="가입하기" id="check" class="btn"> <a
				href="../index.jsp"><input type="button" value="돌아가기"></a>
		</p>
	</form>
</body>
</html>






