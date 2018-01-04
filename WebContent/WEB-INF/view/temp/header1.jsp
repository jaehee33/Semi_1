<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<%=request.getContextPath()%>/css/header1.css" rel="stylesheet">
<%-- <link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"> --%>
<header id="myPage" data-spy="scroll" data-target=".navbar" data-offset="50">
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <div id="logo">
      <a href="<%=request.getContextPath()%>/index.jsp"><img src="<%=request.getContextPath()%>/img/logo/2w.png" style="width:180px;, height:24px;"></a>
      </div>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
  <!-- ============================================================================================= -->
        <li><a href="<%=request.getContextPath()%>/about.jsp">ABOUT</a></li>
  <!-- ============================================================================================= -->
        <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="<%=request.getContextPath()%>/store/storeList.store">STORE
        <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<%=request.getContextPath()%>/store/storeList.store">STORE</a></li>
            <li><a href="<%=request.getContextPath()%>/search/locationSearch.search">내주변</a></li>
          </ul>
        </li>
  <!-- ============================================================================================= -->
        <li><a href="<%=request.getContextPath()%>/kind/kindFList.kind">STYLE</a></li>
        <li><a href="<%=request.getContextPath()%>/coupon/couponList.coupon">EVENT</a></li>
  <!-- ============================================================================================== -->
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">NOTICE
          <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="<%=request.getContextPath()%>/notice/noticeList.notice">공지사항</a></li>
            <li><a href="<%=request.getContextPath()%>/faq/faqList.faq">FAQ</a></li>
          </ul>
        </li>
  <!-- ============================================================================================== -->
 		<c:if test="${empty member}">
 		 <li><a href="<%=request.getContextPath()%>/member/memberJoin.member">Join</a></li>
 		 <li><a href="<%=request.getContextPath()%>/member/memberLogin.member">Login</a></li>
 		 </c:if>
			<c:if test="${not empty member}">
				<li><a href="<%=request.getContextPath()%>/member/kakaoLogout.member">Logout</a></li>
				<li><a href="<%=request.getContextPath()%>/member/memberMyPage.member">MyPage</a></li>
			</c:if>
			<c:if test="${member.job eq 'B'}">
				<li><a href="<%=request.getContextPath()%>/use/useList.use">예약/취소</a></li>
			</c:if>
      </ul>
    </div>
  </div>
</nav>
</header>>


