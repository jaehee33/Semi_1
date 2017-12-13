<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h1>${board}</h1>
	<div>
		<form name="frm" action="./${board}List.${board}">
			<input type="hidden" name="curPage"> 
			<select name="kind">
				<option class="kind" value="all">전체</option>
				<option class="kind" value="pick">픽메뉴</option>
				<option class="kind" value="cut">커트</option>
				<option class="kind" value="perm">펌</option>
				<option class="kind" value="clinic">클리닉</option>
				<option class="kind" value="styling">스타일링</option>
			</select> 
		</form>
	</div>
	
	
	
	
	






</body>
</html>