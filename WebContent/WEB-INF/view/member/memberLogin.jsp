<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>
<link href="<%=request.getContextPath()%>/css/member/login.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<%	Cookie [] ar=request.getCookies();
String cId="";
for(int i=0;i<ar.length;i++){
	if(ar[i].getName().equals("id")){
		cId=ar[i].getValue();
		break;
	}
} %>
<style type="text/css">
* {
	margin: 0;
	padding: 0;
}
/* #img{
	width: 1920px;
	height: 1080px;
	float: right;
	margin-top: 150px;
	margin-right: 100px;
	background-image: url('/Semi_1/img/member/login_hair2.jpg');
	-webkit-animation-name: hair;
	-webkit-animation-duration: 6s;
	animation-name: hair;
	animation-duration: 6s;
}
@-webkit-keyframes hair{
	from {background-image: url('/Semi_1/img/member/login_hair2.jpg');}
	to {background-image: url('/Semi_1/img/member/login_hair1.jpg');}
}
@keyframes hair{
	from {background-image: url('/Semi_1/img/member/login_hair2.jpg');}
	to {background-image: url('/Semi_1/img/member/login_hair1.jpg');}
} */

</style>

<link href="/Semi_1/css/login.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
<div class="container">
<h1>Login</h1>
<div id="img">
  <form action="./memberLogin.member" method="post">
    <div class="form-group">
      <label for="id">ID:</label>
      <input type="text" class="form-control" id="id" value="<%=cId%>" placeholder="Enter id" name="id">
    </div>
    <div class="form-group">
      <label for="pw">Password:</label>
      <input type="password" class="form-control" id="pw" placeholder="Enter password" name="pw">
    </div>
	 <div class="checkbox">
      <label><input type="checkbox" id="remember" name="remember" value="remember"> Remember me</label>
    </div>
    <p><button type="submit" class="btn btn-default">Login</button></p>
<!---------------------------- 카카오로그인 시작 ---------------------------->
<p>
		<a id="kakao-login-btn"></a>
		<a href="http://developers.kakao.com/logout"></a>
		<script type='text/javascript'>
			//<![CDATA[
			// 사용할 앱의 JavaScript 키를 설정해 주세요.
			Kakao.init('44dc488bb7ee1b14cd2765f0530ea05b');
			// 카카오 로그인 버튼을 생성합니다.
			Kakao.Auth.createLoginButton({
				container : '#kakao-login-btn',
				success : function(authObj) {
				
					alert(JSON.stringify(authObj));
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
			//]]>
		</script>
	</p>
<!----------------------------카카오로그인 끝 ------------------------------->	
  </form>
</div>
</div>
</body>
</html>