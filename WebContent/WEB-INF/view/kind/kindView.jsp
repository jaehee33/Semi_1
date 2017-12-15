<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<table>
			<%-- <tr>
				<c:forEach items="${filelist}" var="f">
					<c:if test="${k.num eq f.num}">
						<td><img src="../upload/${f.fname}"></td>
					</c:if>
				</c:forEach>
			</tr> --%>
			<tr>
				<td><h3>${kind.kind}</h3></td>
				<td>${kind.price}</td>
				<%-- <c:forEach items="${storelist}" var="s">
					<c:if test="${k.store eq s.store}">
						<td>${k.store}</td>
						<td><a href="../use/useWrite.use?store=${s.store}&style=${k.kind}&price=${k.price}">예약</a></td>
						<td><a href="../member/memberStyle.member">저장</a></td>
					</c:if>
				</c:forEach>
 --%>
			</tr>

	</table>
</body>
</html>