<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${kindlist}" var="k" varStatus="status">
	<div class="w3-quarter">
		<c:forEach items="${filelist}" var="f">
			<c:if test="${k.num eq f.num}">
				<a href="./kindView.kind?num=${k.num}&style=${k.style}">
					<img src="../upload/${f.fname}" onclick="onClick(this)" class="photo w3-hover-opacity" style="width: 100%">
				</a>
			</c:if>
		</c:forEach>
		<h4>
			<a href="./kindView.kind?num=${k.num}&style=${k.style}" class="style">${k.style}</a>
		</h4>
	</div>
</c:forEach>