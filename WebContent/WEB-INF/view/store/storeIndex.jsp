<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<div id="storeName">

	<h5 class="font">store</h5>
	<h3 class="font">${store.store}</h3>
	</div>

	<ul id="storeMenu">
	<li class="menuli"><a href="../kind/kindCList.kind?id=${store.id}">STYLE</a></li>
	<li class="menuli"><a href="<%=request.getContextPath()%>/store/storeView.store?id=${store.id}">INFO</a></li>
	<li class="menuli"><a href="../score/scoreList.score?id=${store.id}&store=${store.store}">REVIEW</a></li>
	</ul>
