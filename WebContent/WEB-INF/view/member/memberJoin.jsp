<%@page import="com.iu.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<title>Insert title here</title>
<script language="javascript">
window.onload = function(){
	document.getElementById('input_id').addEventListener('blur', idChecker); 
	document.getElementById('input_pw').addEventListener('blur', pwChecker);
	document.getElementById('input_pw2').addEventListener('blur', pwChecker);
	
	var joinCheck = document.getElementById('join');
	joinCheck.disabled = true;
	joinCheck.style.background = "black";
	joinCheck.style.color = "white";
	};
	var request = new XMLHttpRequest();
	var idFlag = false;
	var pwFlag = false;
	
	function idChecker(){
		var inputId = document.getElementById('input_id').value;
		if(inputId != ''){
			var url = 'memberJoin.member';
			request.open('POST', url,true);
			request.onreadystatechange = callback;
			request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
			request.send('id= '+inputId);
		}else if(inputId == '' || inputId == 'undifined'){
			var resultStr = "아이디를 입력해주세요.";
			document.getElementById('id_checker').innerHTML = resultStr;
			idFlag = false;
			joinChecker();
		}
	}
	
	function pwChecker(){
		var pw = document.getElementById('input_pw').value;
		var pw2 = document.getElementById('input_pw2').value;
		var resultStr = '';
		if(pw != '' && pw2 != ''){
			if(pw == pw2){
				resultStr = '<span id="reslt_true">비밀번호가 일치합니다.</span>';
				document.getElementById('pw_checker').innerHTML = resultStr;
				pwFlag = true;
				joinChecker();
			}else{
				resultStr = '<span id="reslt_false">비밀번호가 틀렸습니다.</span>';
				document.getElementById('pw_checker').innerHTML = resultStr;
				pwFlag = false;
				joinChecker();
			}
		}
		if(pw == '' || pw == 'undifined' || pw2 == '' || pw2 == 'undifined'){
			resultStr = '비밀번호를 입력해주세요.';
			document.getElementById('pw_checker').innerHTML = resultStr;
			pwFlag = false;
			joinChecker();
		}
	}
	function joinChecker(){
		var joinCheck = document.getElementById('join');
		if(idFlag == true && pwFlag == true){
			joinCheck.disable = false;
			joinCheck.style.background = "black";
			joinCheck.style.color = "white";
		}else{
			joinCheck.disable = false;
			joinCheck.style.background = "red";
			joinCheck.style.color = "blue";
		}
	}

</script>

</head>
<body>
<h1>join</h1>
<form name="frm" action="./memberJoin.member" method="post">
<input type="hidden" name="confirm_id" value="x">
<p>ID: <input type="text" name="id" id="input_id">
<span id="id_checker">아이디를 입력해주세요.</span></p>
<p>PW: <input type="password" name="pw" id="input_pw">
PW확인: <input type="password" name="pw" id="input_pw2">
</p>
<p>NAME: <input type="text" name="name"></p>
<p>BIRTH: <input type="date" name="birth"></p>
<p>PHONE: <input type="text" name="phone"></p>
<p>
Customer<input type="radio" name=job id="j1" value="B" checked="checked">
Store<input type="radio" name=job id="j2" value="S"></p>
<p><input type="submit" value="Join" id="check">
<a href="../index.jsp"><input type="button" value="돌아가기"></a>
</p>
</form>
</body>
</html>






