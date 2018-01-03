<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<table>
	<tr>
		<td>kind</td>
		<td>price</td>
	</tr>
	<c:forEach items="${kindlist}" var="k">
		<tr>
			<c:forEach items="${filelist}" var="f">
				<c:if test="${k.num eq f.num}">
					<td><img src="../upload/${f.fname}"></td>
				</c:if>
			</c:forEach>
			<td>${k.style}</td>
			<td>${k.price}</td>
			<td id="X"><a href="kindDelete.kind?num=${k.num}">X</a></td>
		</tr>
	</c:forEach>
</table>

<div id="example5" class="slider-pro">
	<c:forEach items="${kindlist}" var="k">
		<div class="sp-slides">
			<div class="sp-slide">
				<c:forEach items="${filelist}" var="f">
					<c:if test="${k.num eq f.num}">
						<img class="sp-image"
							src="../upload/${f.fname}"
							data-src="../upload/${f.fname}"
							data-retina="../upload/${f.fname}" />
					</c:if>
				</c:forEach>
				<div class="sp-caption">${k.style}<br>${k.price}Won<a href="kindDelete.kind?num=${k.num}">X</a></div>
			</div>
		</div>

		<div class="sp-thumbnails">
			<div class="sp-thumbnail">
				<div class="sp-thumbnail-image-container">
					<c:forEach items="${filelist}" var="f">
					<c:if test="${k.num eq f.num}">
						<img class="sp-image"
							src="../upload/${f.fname}"
							data-src="../upload/${f.fname}"
							data-retina="../upload/${f.fname}" />
					</c:if>
				</c:forEach>
				</div>
				<div class="sp-thumbnail-text">
					<div class="sp-thumbnail-title">${k.style}</div>
					<div class="sp-thumbnail-description">${k.price}Won</div>
				</div>
			</div>


		</div>
	</c:forEach>
</div>