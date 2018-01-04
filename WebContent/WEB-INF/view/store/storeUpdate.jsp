<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/css/store/storeWrite.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SemiHairShop - StoreUpdate</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<script type="text/javascript">
	$(function() {
		$("#btn").click(function() {
			var result = true;
			$(".emp").each(function() {
				if ($(this).val() == "") {
					result = false;
				}
			});
			if (result) {
				document.frm.submit();
			} else {
				alert("모든 항목을 입력해주세요.");
			}
		});
	});
</script>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div id="storeView">
			<h1>Store Info Update</h1>
			<p id="info1">수정하고싶은 정보를 다시 입력해주세요. (단, 사진은 반드시 새로 업데이트해야 합니다.)</p>
			<form action="storeUpdate.store" method="post" name="frm"
				enctype="multipart/form-data">
				<table id="semistore">
					<tr id="start">
					
						<td class="first">* StoreName</td>
						<td><input type="text" class="emp" name="store"
						value="${store.store}" readonly="readonly"><input type="hidden" name="id" value="${store.id}"></td>
					</tr>
					<tr>
						<td class="first">* Area</td>
						<td><input type="text" name="area" class="emp"
						value="${store.area}" readonly="readonly"></td>
					</tr>
					<tr>
						<td class="first"> Store Tel</td>
						<td><input type="text" class="emp" name="storetel"
						value="${store.storetel}"></td>
					</tr>
					<tr>
						<td class="first"> Holiday</td>
						<td><input type="text" class="emp" name="holiday"
						value="${store.holiday}"></td>
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
