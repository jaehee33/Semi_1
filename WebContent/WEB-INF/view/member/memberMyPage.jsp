<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="<%=request.getContextPath()%>/css/member/mypage.css" rel="stylesheet">
<title>마이페이지</title>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
	<section id="main">

		<h2>나의 상세 정보</h2>

<div id="content">
	<div class="col" id="col1">
		<div class="box" id="box1">
			<img src="<%=request.getContextPath()%>/img/member/img_avatar1.png">
			<ul>
				<li><h4>${m2.name} 
				<span><c:if test="${m2.job eq 'B' }"> [고객] </c:if><c:if test="${m2.job eq 'S' }"> [가맹주]</c:if></span>
				</h4></li>
				<li><h4>${m2.birth}</h4></li>
				<li><h4>${m2.phone}</h4></li>
			</ul>
		</div>
		<div class="box" id="box3">
			<p><a href="../style/styleList.style">스타일즐겨찾기보기</a></p> 
		</div>
		<div class="box" id="box5">
		<p><a href="./memberUpdate.member?id=${m2.id}">정보수정</a></p>
		</div>
		<div id="box7">
		<p><a href="../index.jsp">처음으로</a></p>
		</div>
	</div>
		
	<div class="col" id="col2">
		<div class="box" id="box2">
			<c:if test="${sessionScope.member.job eq 'B'}">
				<p><a href="../use/useList.use">예약/취소</a></p>
			</c:if>
			<c:if test="${sessionScope.member.job eq 'S'}">
			<c:if test="${empty store}">
				<p><a href="../store/storeWrite.store">가맹점 등록하기</a></p>
			</c:if>
			<c:if test="${not empty store}">
				<p><a href="../store/storeView.store?id=${sessionScope.member.id}">가맹점관리</a></p>
			</c:if>
		</c:if>
		</div>
		<div class="box" id="box4">
			<p><a href="../favor/favorList.favor">가게 즐겨찾기보기</a></p>
		</div>
		<div class="box" id="box6">
			<p><a href="./memberDelete.member">회원탈퇴</a></p>
		</div>

	</div>
</div>

</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>