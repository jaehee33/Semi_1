<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/member/update.css" rel="stylesheet">
<title>가입정보수정</title>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="">
		<h1>회원정보 수정</h1>
		<h5>회원님의 소중한 정보를 안전하게 관리하세요.</h5>

		<form action="memberUpdate2.member" method="post">
			<input type="hidden" name="id" value="${m2.id}">

		<h2>기본정보</h2>
			<table id="jointable">
				<tr>
					<th>비밀번호:</th>
					<td><input type="password" name="pw" value="${m2.pw}" class="n box" placeholder=" Password"></td>
				</tr>
				<tr>
					<th>이름:</th>
					<td><input type="text" name="name" value="${m2.name}" class="n box"></td>
				</tr>
				<tr>
					<th>생년월일:</th>
					<td><input type="date" name="birth" value="${m2.birth}" class="n box"></td>
				</tr>
				<tr>
					<th>휴대전화:</th>
					<td><input type="text" name="phone" value="${m2.phone}" class="n box"></td>
				</tr>
			<tr>
				<th>회원구분:</th> 
				<td>고객용 <input type="radio" name=job id="j1" value="B" checked="checked">
				가맹점용 <input type="radio" name=job id="j2" value="S"></td>
			</tr>
			</table>
			<div id="btntotal">
			<button class="btn" id="cancel"><a href="./memberMyPage.member">취소</a></button>
			<button class="btn" id="modify">수정</button>
			</div>
		</form>
<div id="ysl">
		<div class="info">
				<dl>
					<dt>자주찾는 질문</dt>
					<dd>
					<br>
						<p>
							SEMI HAIR에 관한 궁금하신 사항을 확인하세요. 
							<br>질문에 빠르고 정확한 답변을 제공합니다.</p>
					</dd>
				</dl> 
			<a href="<%=request.getContextPath()%>/faq/faqList.faq">
			</a>
		</div>
		<span>
		<div class="info" id="info2">
				<dl>
					<dt>1:1 상담 (대표전화: 1588-2580)</dt>
					<dd>
					<br>
						<p>
							평일: 다음 날 답변 완료
							<br>토·일 공휴일: 휴일 이후 답변 완료
						</p>
					</dd>
				</dl>
		</div>
		</span>
		</div>
	</section>
<%@ include file="../temp/footer.jsp"%>
</body>
</html>