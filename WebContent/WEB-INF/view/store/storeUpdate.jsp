<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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
			<form action="storeUpdate.store" name="frm" method="post"
				enctype="multipart/form-data">
				<input type="hidden" name="id" value="${store.id}">
				<p>
					StoreName : <input type="text" class="emp" name="store"
						value="${store.store}" readonly="readonly">
				</p>
				<p>
					Area : <input type="text" name="area" class="emp"
						value="${store.area}" readonly="readonly">
				</p>
				<p>
					StoreTel : <input type="text" class="emp" name="storetel"
						value="${store.storetel}">
				</p>
				<p>
					Holiday : <input type="text" class="emp" name="holiday"
						value="${store.holiday}">
				</p>
				<p>
					file : <input type="file" class="emp" name="file">
				</p>
				<input type="button" name="btn" id="btn" value="write">
			</form>
		</div>
	</section>
</body>
</html>
