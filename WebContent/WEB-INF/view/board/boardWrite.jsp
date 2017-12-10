<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="../SE2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript">
	$(function(){
		var i=2;
		$("#btn").click(function(){
			var f = '<input type="file" name="f'+i+'">';
			$("#files").append(f);
			i++;
		});
		
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "contents",
        sSkinURI: "../SE2/SmartEditor2Skin.html", 
        htParams : {
            bUseToolbar : true,             
            bUseVerticalResizer : true,     
            bUseModeChanger : true, 
        }
    });
     
    $("#savebutton").click(function(){
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
         
        $("#frm").submit();
    })
	});
</script>

</head>
<body>
<form id="frm" action="./${board}Write.${board}" method="post" enctype="multipart/form-data">
		<p>ID: <input type="text" name="id"></p>
		<p>TITLE: <input type="text" name="title"></p>
		<p><textarea rows="" cols="" name="contents" id="contents"></textarea></p>
		<div id="files">
			<input type="file" name="f1">
		</div>
		<input type="button" id="btn" value="Add File">
		<p><input type="button" value="글쓰기" id="savebutton"></p>
	</form>
</body>
</html>