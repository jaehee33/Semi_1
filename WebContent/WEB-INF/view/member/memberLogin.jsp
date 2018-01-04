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
  <script type="text/javascript">
$(function(){
	function initparticles() {
	   confetti();
	}
	function confetti() {
	   $.each($(".particletext.confetti"), function(){
	      var confetticount = ($(this).width()/50)*10;
	      for(var i = 0; i <= confetticount; i++) {
	         $(this).append('<span class="particle c' + $.rnd(1,2) + '" style="top:' + $.rnd(10,50) + '%; left:' + $.rnd(0,100) + '%;width:' + $.rnd(6,8) + 'px; height:' + $.rnd(3,4) + 'px;animation-delay: ' + ($.rnd(0,30)/10) + 's;"></span>');
	      }
	   });
	}
	jQuery.rnd = function(m,n) {
	      m = parseInt(m);
	      n = parseInt(n);
	      return Math.floor( Math.random() * (n - m + 1) ) + m;
	}
	initparticles();
});
</script>

<%	Cookie [] ar=request.getCookies();
String cId="";
for(int i=0;i<ar.length;i++){
	if(ar[i].getName().equals("id")){
		cId=ar[i].getValue();
		break;
	}
} %>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section>
		<div class="textcontainer">
   			<span class="particletext confetti">Login</span>
		</div>
			<form action="./memberLogin.member" method="post">
				<div id="content">
				<p>ID</p>
				<p><input type="text" id="id" value="<%=cId%>" placeholder=" Enter id" name="id" class="box"></p> 
				<p>Password</p>
				<p><input type="password" id="pw" placeholder=" Enter password" name="pw" class="box"></p>
				
				<div class="checkbox">
					<p><input type="checkbox" id="remember" name="remember" value="remember"> Remember me</p>
				</div>
				<p><button id="button">Login</button></p>
				</div>
				<!---------------------------- 카카오로그인 시작 ---------------------------->
				<div id="cau">
				<br>
<p>*카카오톡 로그인시 예약을 원하시면 마이페이지에서 정보수정을 해주세요.*</p>
</div>
<div id="kakao">
	<a id="kakao-login-btn"></a>
		<a href="http://developers.kakao.com/logout"></a>
		<script type='text/javascript'>
			//<![CDATA[
			// 사용할 앱의 JavaScript 키를 설정해 주세요.
			Kakao.init('44dc488bb7ee1b14cd2765f0530ea05b');
			// 카카오 로그인 버튼을 생성합니다.
		    Kakao.Auth.createLoginButton({
		      	container: '#kakao-login-btn',
		      	success: function(authObj) {
		      		Kakao.API.request({
		      			url:'/v1/user/me',
		      			success:function(res){
		      				/* alert(res.id+'님 카카오톡 로그인 완료.'); */
							
		      				location.href="./kakao.member?id="+res.id;

		      			},
		      			fail:function(error){
		      				alert(JSON.stringify(error));
		      			}
		      		});
		      	},
		      	fail: function(err){
		      		alert(JSON.stringify(err));
		      	}
		    });
		</script>
</div>
				<!----------------------------카카오로그인 끝 ------------------------------->
			</form>
		</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>