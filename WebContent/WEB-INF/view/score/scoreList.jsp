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
				<option class="kind" value="all">��ü</option>
				<option class="kind" value="pick">�ȸ޴�</option>
				<option class="kind" value="cut">ĿƮ</option>
				<option class="kind" value="perm">��</option>
				<option class="kind" value="clinic">Ŭ����</option>
				<option class="kind" value="styling">��Ÿ�ϸ�</option>
			</select> 
		</form>
	</div>
	
	
	
	
	






</body>
</html>