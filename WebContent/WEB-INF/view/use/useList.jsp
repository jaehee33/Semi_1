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
<link href="<%=request.getContextPath()%>/css/use/useList.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div class="container">
			<h3>예약/취소내역</h3>
			<div>
				<form name="frm" action="./useList.use">
					<input type="hidden" name="curPage"> <select name="kind">
						<option class="kind" value="store">store</option>
						<option class="kind" value="style">style</option>
						<option class="kind" value="price">price</option>
					</select> <input type="text" name="search" value="${make.search }">
					<button>search</button>
				</form>
			</div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>예약번호</th>
						<th>가게명</th>
						<th>예약일</th>
						<th>예약시간</th>
						<th>예약메뉴</th>
						<th>가격</th>
						<th>현재상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="b">
						<tr>
							<td>${b.num}</td>
							<td><a href="./useView.use?num=${b.num}">${b.store}</a></td>
							<td>${b.bk_date}</td>
							<td>${b.time}</td>
							<td>${b.style}</td>
							<td>${b.price}</td>
							<td>${b.state}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="page">
				<c:if test="${page.curBlock > 1 }">
					<input type="button" class="list" title="${page.startNum-1}" value="<<">
				</c:if>
				<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
					<input type="button" class="list" title="${i}" value="${i }">
				</c:forEach>
				<c:if test="${page.curBlock < page.totalBlock}">
					<input type="button" class="list" title="${page.lastNum+1}" value=">>">
				</c:if>
				<div id="mypage">
					<a href="../member/memberMyPage.member">마이페이지로 돌아가기</a>
				</div>
			</div>
		</div>
	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>