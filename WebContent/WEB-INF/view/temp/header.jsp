<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>

<title>Insert title here</title>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
</head>
<body>
<div id="header">
<c:if test="${empty member}">
	<a href="<%=request.getContextPath()%>/member/memberJoin.member">Join</a>
	<a href="<%=request.getContextPath()%>/member/kakaoJoin.member"></a>
	<a href="<%=request.getContextPath()%>/member/memberLogin.member">Login</a>
	<hr>
<!---------------------------- 카카오로그인 시작 ---------------------------->
		<a id="kakao-login-btn"></a>
		<a href="http://developers.kakao.com/logout"></a>
		<script type='text/javascript'>
			//<![CDATA[
			// 사용할 앱의 JavaScript 키를 설정해 주세요.
			Kakao.init('44dc488bb7ee1b14cd2765f0530ea05b');
			// 카카오 로그인 버튼을 생성합니다.
			Kakao.Auth.createLoginButton({
				container : '#kakao-login-btn',
				success : function(authObj) {
					alert(JSON.stringify(authObj));
				},
				fail : function(err) {
					alert(JSON.stringify(err));
				}
			});
			//]]>
		</script>
<!----------------------------카카오로그인 끝 ------------------------------->
		
</c:if>

<c:if test="${not empty member}">
		<a href="<%=request.getContextPath()%>/member/memberLogout.member">Logout</a>
		<a href="<%=request.getContextPath()%>/member/memberMyPage.member">MyPage</a>

		<c:if test="${member.job eq 'B'}">
		<a href="<%=request.getContextPath()%>/use/useList.use">예약/취소</a>
		</c:if>
		<hr>
		<a href="<%=request.getContextPath()%>/search/locationSearch.search">내 주변</a>
		<a href="<%=request.getContextPath()%>/search/styleSearch.search">스타일 찾기</a>
		<a href="<%=request.getContextPath()%>/store/storeList.store">전체 가게</a>
		<a href="<%=request.getContextPath()%>/kind/kindFList.kind">전체 스타일</a>
</c:if>

	<hr>
	<a href="<%=request.getContextPath()%>/notice/noticeList.notice">공지사항</a>
	<a href="<%=request.getContextPath()%>/faq/faqList.faq">자주 묻는 질문</a>
</div>
</body>
</html>