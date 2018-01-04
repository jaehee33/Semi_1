<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="http://lab.alexcican.com/set_cookies/cookie.js" type="text/javascript"> </script> 
<script type="text/javascript">
$(function(){
	 var login_id=$.cookie("login_id");
	var login_pw=$.cookie("login_pw");
	
	if(login_id!=undefined && login_pw!=undefined){
		$("#input1").val(login_id);
		$("#psw").val(login_pw);
		$("#remember_id").prop("checked",true);
	}
	
	$("#remember_id").click(function(){
		if($(this).is(":checked")){
			if(!confirm("공용 PC에서 로그인 정보를 저장할 경우, 다른 사용자에게 정보가 노출될 위험이 있습니다. 그래도 저장 하시겠습니까?")){
				$("#remember_id").prop("checked",false);
			}
		}
	});
	
	$(".login").click(function(){
		
		if($("#remember_id").is(":checked")){
			$.cookie('login_id',$("#input1").val(),{
				"expires":1,
				"secure":false
			});
			$.cookie('login_pw',$("#psw").val(),{
				"expires":1,
			});
		}else{
			$.removeCookie("login_id");
			$.removeCookie("login_pw");
		}
		
		$("#frm").submit();
		
	});
	
});
</script>
</head>
<body>



 <!------------------------------------------------------------------------------login Modal --------------------------------------------------------------------------->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content login_form">
        <div class="modal-header1" style="padding:35px 50px;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <div id="logo"><img alt="" src="${pageContext.request.contextPath}/img/logo1.png"></div>
          <span id="login_title">로그인</span>
        </div>
        
        <div class="modal-body1" style="padding:40px 50px;">
          <form id="frm" name="frm" role="form" action="${pageContext.request.contextPath}/member/login_modal.member" method="POST">
            <div class="form-group">
              <label for="usrname"><span id="login_text" class="glyphicon glyphicon-user"></span><span  id="login_text" > ID</span></label>
              <input name="id" id="input1" type="text" class="form-control" id="usrname" placeholder="아이디를 입력해주세요.">
            </div>
            
            <div class="form-group">
              <label for="psw"><span id="login_text" class="glyphicon glyphicon-lock"></span><span  id="login_text" > PW</span></label>
              <input name="pw" type="password" class="form-control" id="psw" placeholder="비밀번호를 입력해주세요.">
            </div>
            
            <div class="checkbox">
              <label><input type="checkbox" id="remember_id" name="remember_id" value="" checked>아이디 저장</label>
            </div>
            
              <button type="submit" class="btn_login btn btn-block login"><span class="glyphicon glyphicon-off"></span><span  id="login_text" > Login</span></button>
          </form>
          
          <div id="kakao">
          <a id="kakao-login-btn"></a>
			<script type='text/javascript'>
			    // 사용할 앱의 JavaScript 키를 설정해 주세요.
			    Kakao.init('21bcdd7a871f7000d6082dab87c02c5d');
			    // 카카오 로그인 버튼을 생성합니다.
			    Kakao.Auth.createLoginButton({
			      	container: '#kakao-login-btn',
			      	success: function(authObj) {
			      		Kakao.API.request({
			      			url:'/v1/user/me',
			      			success:function(res){
			      				alert(res.properties.nickname+'님 카카오톡 로그인 완료.');
								/* request.setAttribute("nick", res.properties.nick); */
			      				location.href="../togather/member/kakao.member?nick="+res.properties.nickname;
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
          
        </div>
        
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger btn-default pull-left" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> Cancel</button>
          <p>회원이 아니신가요? <a id="a">회원가입</a></p>
			
          <p>  <button class="modal_in_btn" id="id_search" data-dismiss="modal">아이디 찾기</button></p>
          <p>　　　　　　<button class="modal_in_btn" id="pw_search" data-dismiss="modal">비밀번호 찾기</button></p>
        </div>
      </div>
      
    </div>
  </div> 

</body>
</html>