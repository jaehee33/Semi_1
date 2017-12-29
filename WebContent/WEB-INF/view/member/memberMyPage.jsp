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
<script type="text/javascript">
$(function(){
	//<!-- =====================마이페이지============================= -->
		$(".hover").mouseleave(
				  function () {
				    $(this).removeClass("hover");
				  }
				);
	//<!-- =====================마이페이지============================= -->
});
</script>

<body>
<%@ include file="../temp/header.jsp" %>
	<section id="">
		<div id="hd">
			<h2>나의 상세 정보</h2>
			<h4>SEMI HAIR 이용 현황 및 즐겨찾기 서비스를 확인해보세요.</h4>
			<div id="info">
			<ul>
				<li><h4>${m2.name}
						<span><c:if test="${m2.job eq 'B' }"> [고객] </c:if>
							<c:if test="${m2.job eq 'S' }"> [가맹주]</c:if></span>
					</h4></li>
				<li><h4>${m2.birth}</h4></li>
				<li><h4>${m2.phone}</h4></li>
			</ul>
			</div>
				<p><a href="./memberUpdate2.member?id=${sessionScope.member.id}">정보수정</a></p>
		</div>
<!-- =====================box1============================= -->
		<article>
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
		</article>
		<!-- =====================box3============================= -->
	

	
		<p><a href="../index.jsp">처음으로</a></p>

			<p><a href="./memberDelete.member">회원탈퇴</a></p>


</section>
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>