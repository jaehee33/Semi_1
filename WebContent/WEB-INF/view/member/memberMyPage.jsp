<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="<%=request.getContextPath()%>/css/member/mypage.css"
	rel="stylesheet">
<title>마이페이지</title>
</head>
<script type="text/javascript">
	$(function() {

		//<!-- =====================마이페이지============================= -->
		$(".hover").mouseleave(function() {
			$(this).removeClass("hover");
		});
		//<!-- =====================마이페이지============================= -->
	});
	function myFunction() {
		var txt;
		if (confirm("정말 탈퇴하시겠습니까?") == true) {
			window.location
					.assign("http://localhost/Semi_1/member/memberDelete.member")
		} else {
			window.location
					.assign("http://localhost/Semi_1/member/memberMyPage.member")
		}

	}
</script>

<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="">
		<div id="hd">

		<img src="<%=request.getContextPath()%>/img/member/hd2.png" style="width:100%; height:339px;">

			<div id="home">
				<p>
					<a href="../index.jsp"><img
						src="<%=request.getContextPath()%>/img/member/home.png"
						style="width: 15px; height: 15px;"></a> <span><a
						href="./memberMyPage.member">> 마이페이지</a></span>
				</p>
			</div>
			<h2>나의 상세 정보</h2>
			<h4>SEMI HAIR 이용 현황 및 즐겨찾기 서비스를 확인해보세요.</h4>

		</div>
		<div id="info">
			<ul>
				<li><h4>${m2.name}
						<span><c:if test="${m2.job eq 'B' }"> [고객]<span
									class="acc"> 님 접속중<img
									src="<%=request.getContextPath()%>/img/member/access.png"
									style="width: 15px; height: 15px;"></span>
							</c:if> <c:if test="${m2.job eq 'S' }"> [가맹주]<span class="acc">
									님 접속중<img
									src="<%=request.getContextPath()%>/img/member/access.png"
									style="width: 15px; height: 15px;">
								</span>
							</c:if></span>
					</h4></li>

				<li><h4>연락처: ${m2.phone}</h4></li>
				<a href="./memberUpdate2.member?id=${sessionScope.member.id}"> <img
					src="<%=request.getContextPath()%>/img/member/modify4.png"
					style="width: 32px; height: 32px;"></a>

				<c:if test="${empty m2.job}">
					<span><p>*카카오 로그인시 예약을 원하시면 정보수정을 해주세요.*</p></span>
				</c:if>

				<c:if test="${empty coupon}">
					<p>coupon X</p>
				</c:if>
				<c:if test="${not empty coupon}">
					<p id="coupon">
						coupon :
						<c:forEach items="${coupon}" var="i">
				${i.coupon}
				</c:forEach>
					</p>
				</c:if>
			</ul>
		</div>
		<!-- =====================box1============================= -->
		<article>
			<div class="mid">
				<div id="box1" class="box">
					<figure class="snip1432">
						<img
							src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample21.jpg"
							alt="sample36" />
						<figcaption>
							<div>
								<h3>Click Favorites</h3>
								<h3>To view style marked</h3>
							</div>
							<div>
								<h2>Style Favorites</h2>
							</div>
						</figcaption>
						<a href="../style/styleList.style"></a>
					</figure>
				</div>
				<!-- =====================box1============================= -->
				<!-- =====================box2============================= -->
				<div id="box2" class="box">
					<figure class="snip1432">
						<img
							src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample45.jpg"
							alt="sample36" />
						<figcaption>
							<div>
								<h3>Click Favorites</h3>
								<h3>To view store marked</h3>
							</div>
							<div>
								<h2>Store Favorites</h2>
							</div>
						</figcaption>
						<a href="../favor/favorList.favor"></a>
					</figure>
				</div>
				<!-- =====================box2============================= -->
				<!-- =====================box3============================= -->
				<div id="box3" class="box">
					<figure class="snip1432">
						<img
							src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample78.jpg"
							alt="sample36" />
						<c:if test="${sessionScope.member.job eq 'B'}">
							<figcaption>
								<div>
									<h3>Booking</h3>
									<h3>Make a reservation</h3>
								</div>
								<div>
									<h2>예약/취소</h2>
								</div>
							</figcaption>
							<a href="../use/useList.use"></a>
						</c:if>
						<c:if test="${sessionScope.member.job eq 'S'}">
							<c:if test="${empty store}">
								<figcaption>
									<div>
										<h3>Add Franchisee</h3>
										<h3>Register for Franchisee</h3>
									</div>
									<div>
										<h2>가맹점 등록</h2>
									</div>
								</figcaption>
								<a href="../store/storeWrite.store"></a>
							</c:if>
							<c:if test="${not empty store}">
								<figcaption>
									<div>
										<h3>Franchisee</h3>
										<h3>Franchisee Management</h3>
									</div>
									<div>
										<h2>가맹점관리</h2>
									</div>
								</figcaption>
								<a href="../store/storeView.store?id=${sessionScope.member.id}"></a>
							</c:if>
						</c:if>
					</figure>
				</div>
			</div>
			<!-- =====================box3============================= -->
			<div id="del">
				<button id="button" onclick="myFunction()">회원탈퇴</button>
			</div>

		</article>





	</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>