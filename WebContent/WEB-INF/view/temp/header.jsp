<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<%=request.getContextPath()%>/css/header.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

$(function(){
  $(".dropdown").hover(            
    function() {
      $('.dropdown-menu', this).stop( true, true ).fadeIn("fast");
      $(this).toggleClass('open');
      $('b', this).toggleClass("caret caret-up");                
    },
    function() {
      $('.dropdown-menu', this).stop( true, true ).fadeOut("fast");
      $(this).toggleClass('open');
      $('b', this).toggleClass("caret caret-up");                
    });
});


</script>

 <nav class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">SEMI HAIR</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      
      
      <ul class="nav navbar-nav navbar-right">
          <li class="active"><a href="<%=request.getContextPath()%>/about.jsp">ABOUT</a></li>
        <li class="dropdown">
          <a href="<%=request.getContextPath()%>/store/storeList.store" class="dropdown-toggle" data-toggle="dropdown">STORE<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="<%=request.getContextPath()%>/store/storeList.store">STORE</a></li>
            <li><a href="<%=request.getContextPath()%>/search/locationSearch.search">내주변</a></li>
          </ul>
        </li>
        <li><a href="<%=request.getContextPath()%>/kind/kindFList.kind">STYLE</a></li>

        <li><a href="<%=request.getContextPath()%>/coupon/couponList.coupon">EVENT</a></li>
        <li class="dropdown">
          <a href="<%=request.getContextPath()%>/notice/noticeList.notice" class="dropdown-toggle" data-toggle="dropdown">NOTICE<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="<%=request.getContextPath()%>/notice/noticeList.notice">공지사항</a></li>
            <li><a href="<%=request.getContextPath()%>/faq/faqList.faq">FAQ</a></li>
          </ul>
        </li>
       
        
       
        
        
      </ul>
    </div><!-- /.navbar-collapse -->
      </div><!-- /.container-collapse -->
  </nav>
<%-- 	<div id="hdtop">
		<div id="logo">
			<a href="<%=request.getContextPath()%>/index.jsp"> <img src="<%=request.getContextPath()%>/img/logo/logo230.png">
			</a>
			<!-- <p>SEMI HAIR</p> -->
		</div>

		<div id="menu">
	
			<a class="dropbtn text" href="<%=request.getContextPath()%>/about.jsp">ABOUT</a>
			<div class="dropdown">
				<a class="dropbtn text" href="<%=request.getContextPath()%>/store/storeList.store">STORE</a>
				<div class="dropdown-content">
					<a href="<%=request.getContextPath()%>/store/storeList.store">STORE</a>
					<a href="<%=request.getContextPath()%>/search/locationSearch.search">내주변</a>
				</div>
			</div>
			
			<a class="dropbtn text" href="<%=request.getContextPath()%>/kind/kindFList.kind">STYLE</a>
			<a class="dropbtn text" href="<%=request.getContextPath()%>/coupon/couponList.coupon">EVENT</a>
			<div class="dropdown">
				<a class="dropbtn text" href="<%=request.getContextPath()%>/notice/noticeList.notice">NOTICE</a>
				<div class="dropdown-content">
					<a href="<%=request.getContextPath()%>/notice/noticeList.notice">공지사항</a>
					<a href="<%=request.getContextPath()%>/faq/faqList.faq">FAQ</a>
				</div>
			</div>
			
		</div>
		
		<div id="member">
			<c:if test="${empty member}">
				<a href="<%=request.getContextPath()%>/member/memberJoin.member">Join</a>
				<a href="<%=request.getContextPath()%>/member/memberLogin.member">Login</a>
			</c:if>
			<c:if test="${not empty member}">
				<a href="<%=request.getContextPath()%>/member/memberLogout.member">Logout</a>
				<a href="<%=request.getContextPath()%>/member/memberMyPage.member">MyPage</a>
			</c:if>
			<c:if test="${member.job eq 'B'}">
				<a href="<%=request.getContextPath()%>/use/useList.use">예약/취소</a>
			</c:if>
		</div>
		
	</div>
 --%>

