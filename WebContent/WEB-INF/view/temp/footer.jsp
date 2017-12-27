<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="<%=request.getContextPath()%>/css/footer.css" rel="stylesheet">
<!--  footer 시작 -->
<footer>
	<div id="ftop">
		<div id="flogo">
			<a href="<%=request.getContextPath()%>/index.jsp"> <img
				width="100px" height="80px"
				src="<%=request.getContextPath()%>/img/logo/logo_white.png">
			</a>
		</div>

		<div id="f_menu">
			<ul>
				<li class="list"><a href="<%=request.getContextPath()%>/index.jsp">HOME</a></li>
				<li class="list"><a href="<%=request.getContextPath()%>/about.jsp">ABOUT</a></li>
				<li class="list"><a href="<%=request.getContextPath()%>/store/storeList.store">STORE</a></li>
				<li class="list"><a href="<%=request.getContextPath()%>/notice/noticeList.notice">공지사항</a></li>
			</ul>
			<div id="address">
				<br> 서울시 강남구 청담동 문현금융로 111 국제금융센터
				<br> Contact: 1577-6600 (평일 09:00 - 18:00 / 공휴일휴무) 대표전화: 02-519-1500 이메일:semi@ksd.or.kr
			</div>
			<div id="copy">copyright @ 2017 All Rights Reserved.</div>
		</div>
		<div id="side">
			<select id="select">
				<option>Semi store</option>
				<option>Semi facebook</option>
				<option>Semi instagram</option>
			</select>
		</div>
	</div>
</footer>
<!--  footer 끝 -->