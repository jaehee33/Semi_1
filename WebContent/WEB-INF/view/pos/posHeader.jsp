<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <link href="<%=request.getContextPath()%>/css/store/posHeader.css" rel="stylesheet">

<div id="posheader">
    <ul class="menu">
      <li class="menu__item">
        <a href="./posIndex.pos?store=${store}" class="menu__link hover13" data-hover-label="PosIndex"><span class="menu__label hover13__label">PosIndex</span></a>
      </li> 
      <li class="menu__item">
        <a href="./posList.pos?store=${store}" class="menu__link hover13" data-hover-label="PosList"><span class="menu__label hover13__label">PosList</span></a>
      </li> 
      <li class="menu__item">
        <a href="./posbook.pos?store=${store}" class="menu__link hover13" data-hover-label="BookList"><span class="menu__label hover13__label">BookList</span></a>
      </li> 
    </ul>
</div>