<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		var kind='${make.kind}';
		$(".kind").each(function(){
			if($(this).val()==kind){
				$(this).attr("selected", true);
			}		
		});
	
		$(".list").click(function(){
			var cur = $(this).attr("store");
			document.frm.curPage.value=cur;
			document.frm.submit();
		});
	});
</script>
</head>
<body>
	<div class="container">
		<h3>나의 예약</h3>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>예약번호</th>
					<th>가게명</th>
					<th>이용일</th>
					<th>이용시간</th>
					<th>예약메뉴</th>
					<th>가격</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="b">
					<tr>
						<td>${b.num}</td>
						<td><a href="./bookView.book?num=${b.num}">${b.store}</a></td>
						<td>${b.bk_date}</td>
						<td>${b.time}</td>
						<td>${b.style}</td>
						<td>${b.price}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	<a href="../member/memberMyPage.member">마이페이지로 돌아가기</a>
	</div>
</body>
</html>