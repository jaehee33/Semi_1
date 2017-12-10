<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
	$("#btn").click(function(){
		var store=document.frm.store.value;
		window.open("../map/map.jsp?area="+store, "", "top=300, left=500, width=700, height=400");
	});
	var check=true;
	$("#sub").click(function(){
		if($("#store").val()==""||$("#area").val()==""||$("#tel").val()==""||$("#holiday").val()==""){
			check=false;
		}
		if(!check){
			alert("모든 항목을 입력해주세요");
		}else{
			document.frm.submit();
			
		}
	});
});
</script>
</head>
<body>
<form action="storeWrite.store" method="post" name="frm">
<p>StoreName : <input type="text" name="store" id="store" placeholder="검색어를 입력해주세요"><input type="button" name="btn" id="btn" value="search"></p>
<p>Area : <input type="text" name="area" id="area" value="검색버튼을 눌러주세요" readonly="readonly"></p>
<p>StoreTel : <input type="text" name="storetel" id="tel"></p>
<p>Holiday <input type="text" name="holiday" id="holiday"></p>
<input type="button" id="sub" name="sub" value="write">
</form>
</body>
</html>