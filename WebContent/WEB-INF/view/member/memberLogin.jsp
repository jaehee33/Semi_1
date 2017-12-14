<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
</style>
<!--   <script type="text/javascript">
  $(document).ready(function(){
	 var userInputId = getCookie("id");
	 $("input[name='id']").val(userInputId);
	 if($("input[name='id']").val() !=""){
	 $('#remember').attr("checked",true);
	 }
	 $("#remember").change(function(){
		if($("#remember").is(":checked")){
			var userInputId = $("input[name='id']").val();
			setCookie("userInputId", userInputId, 7);
		} else{
			deleteCookie("userInputId");
		}
	 });
	 $("input[name='id']").keyup(function(){
		if($("#remember").is(":checked")){
			var userInputId = $("input[name='id']").val();
			setCookie("userInputId", userInputId, 7);
		} 
	 });
  });
  </script> -->

<link href="/Semi_1/css/login.css" rel="stylesheet">
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<div class="container">
<h1>Login</h1>

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
    <button type="submit" class="btn btn-default">Login</button>
  </form>
</div>

</body>
</html>