<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="<%=request.getContextPath()%>/css/store/posHeader.css" rel="stylesheet">
<nav id="posheader">
<ul>
<li><a href="./posList.pos?store=${store}">poslist</a></li>
<li><a href="./posbook.pos?store=${store}">예약목록</a></li>
<li><a href="./posIndex.pos?store=${store}">posIndex</a></li>
</ul>
</nav>