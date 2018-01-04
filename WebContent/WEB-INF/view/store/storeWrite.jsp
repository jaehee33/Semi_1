<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/store/storeWrite.css"
	rel="stylesheet">
<title>SemiHairShop - StoreWrite</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() {
		var check = false;
		$("#but").click(
				function() {
					check = true;
					var store = document.frm.store.value;
					window.open("../map/map.jsp?area=" + store, "",
							"top=300, left=500, width=700, height=400");
				});
		$("#btn").click(function() {
			var result = true;
			$(".emp").each(function() {
				if ($(this).val() == "") {
					result = false;
				}
			});
			if (result && check) {
				document.frm.submit();
			} else {
				alert("모든 항목을 입력해주세요.");
			}
		});

	});
</script>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div id="storeView">
			<h1>Store Sign up</h1>
			<p id="info1">세미헤어샵을 이용하기 위해 본인의 가맹점 정보를 입력해주세요.</p>
			<form action="storeWrite.store" method="post" name="frm"
				enctype="multipart/form-data">
				<table id="semistore">
					<tr id="start">
						<td class="first"> StoreName</td>
						<td><input type="text" class="emp" name="store"
							placeholder="검색어를 입력해주세요"> <input type="button"
							name="but" id="but" value="search"></td>
					</tr>
					<tr>
						<td class="first"> Area</td>
						<td><input type="text" class="emp" name="area"
							value="검색버튼을 눌러주세요" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="first"> Store Tel</td>
						<td><input type="text" class="emp" name="storetel"></td>
					</tr>
					<tr>
						<td class="first"> Holiday</td>
						<td><input type="text" class="emp" name="holiday"></td>
					</tr>
					<tr>
						<td class="first"> Store image</td>
						<td><input type="file" name="file" class="emp" id="file"></td>
					</tr>
				</table>
				<input type="button" name="btn" id="btn" value="SUBMIT">
			</form>
		</div>
	</section>
</body>
</html>