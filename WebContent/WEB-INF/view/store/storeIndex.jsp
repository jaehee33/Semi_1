<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<%=request.getContextPath()%>/css/store/storeheader.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<div id="storeheader">
	<c:forEach items="${filelist}" var="f">
		<c:if test="${store.store eq f.store}">
			<img src="../upload/${f.fname}" width="100px" height="70px">
		</c:if>
	</c:forEach>
	<div id="storeName">
	<h4 class="font">store</h4>
	<h1 class="font">${store.store}</h1>
	</div>
	<ul id="storeMenu">
	<li class="menuli"><a href="../kind/kindCList.kind?id=${store.id}">STYLE</a></li>
	<li class="menuli"><a href="./storeView.store?id=${store.id}">INFORMATION</a></li>
	<li class="menuli"><a href="../score/scoreList.score">REVIEW</a></li>
	</ul>
	</div>
