<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<ul id="kindoo">
	<c:forEach items="${kindlist}" var="k">
		<li>
			<c:forEach items="${filelist}" var="f">
				<c:if test="${k.num eq f.num}">
					<p><img src="../upload/${f.fname}" style="width: 150px; height: 200px;"></p>
				</c:if>
			</c:forEach>
			<p id="sty">${k.style}</p>
			<p id="pri">${k.price}</p>
			<p id="X"><a id="oo" href="kindDelete.kind?num=${k.num}">삭제</a></p>
			</li>
	</c:forEach>
		</ul>

