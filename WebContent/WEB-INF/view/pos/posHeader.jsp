<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="<%=request.getContextPath()%>/css/store/posHeader.css" rel="stylesheet">
<div id="posheader">
    <ul class="menu">
      <li class="menu__item">
        <a href="./posIndex.pos?store=${store}" class="menu__link hover13" data-hover-label="INDEX"><span class="menu__label hover13__label">INDEX</span></a>
      </li> 
      <li class="menu__item">
        <a href="./posList.pos?store=${store}" class="menu__link hover13" data-hover-label="LIST"><span class="menu__label hover13__label">LIST</span></a>
      </li> 
      <li class="menu__item">
        <a href="./posbook.pos?store=${store}" class="menu__link hover13" data-hover-label="BOOKLIST"><span class="menu__label hover13__label">BOOKLIST</span></a>
      </li> 
    </ul>
</div>