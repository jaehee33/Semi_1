<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	//star rating
	var starRating = function() {
		var $star = $(".star-input"), $result = $star.find("output>b");
		$(document).on("focusin", ".star-input>.input", function() {
			$(this).addClass("focus");
		}).on("focusout", ".star-input>.input", function() {
			var $this = $(this);
			setTimeout(function() {
				if ($this.find(":focus").length === 0) {
					$this.removeClass("focus");
				}
			}, 100);
		}).on("change", ".star-input :radio", function() {
			$result.text($(this).next().text());
		}).on("mouseover", ".star-input label", function() {
			$result.text($(this).text());
		}).on("mouseleave", ".star-input>.input", function() {
			var $checked = $star.find(":checked");
			if ($checked.length === 0) {
				$result.text("0");
			} else {
				$result.text($checked.next().text());
			}
		});
	};
	starRating();

	
	$(function() {
		var kind = '${make.kind}';
		$(".kind").each(function() {
			if ($(this).val() == kind) {
				$(this).attr("selected", true);
			}
		});

		$(".list").click(function() {
			var cur = $(this).attr("title");
			document.frm.curPage.value = cur;
			document.frm.submit();
		});
	});
</script>
<link rel="stylesheet" href="/Semi_1/css/scoreStar.css">
</head>
<body>
	<h1>${board}</h1>
	<div>
		<form name="frm" action="./${board}List.${board}">
			<input type="hidden" name="curPage"> <select name="kind">
				<option class="kind" value="all">All</option>
				<option class="kind" value="pick">PICK</option>
				<option class="kind" value="cut">CUT</option>
				<option class="kind" value="perm">PERM</option>
				<option class="kind" value="clinic">CLINIC</option>
				<option class="kind" value="styling">STYLE</option>
			</select>
		</form>
	</div>

	<table>
		<h3>한줄평()</h3>
		<tr>
			<td>ID: ${member.id}</td>
			<td><span class="star-input"> <span class="input"> <input
			type="radio" name="star-input" id="p1" value="1"><label
			for="p1">0.5</label> <input type="radio" name="star-input" id="p2"
			value="2"><label for="p2">1</label> <input type="radio"
			name="star-input" id="p3" value="3"><label for="p3">1.5</label>
			<input type="radio" name="star-input" id="p4" value="4"><label
			for="p4">2</label> <input type="radio" name="star-input" id="p5"
			value="5"><label for="p5">2.5</label> <input type="radio"
			name="star-input" id="p6" value="6"><label for="p6">3</label>
			<input type="radio" name="star-input" id="p7" value="7"><label
			for="p7">3.5</label> <input type="radio" name="star-input" id="p8"
			value="8"><label for="p8">4</label> <input type="radio"
			name="star-input" id="p9" value="9"><label for="p9">4.5</label>
			<input type="radio" name="star-input" id="p10" value="10"><label
			for="p10">5</label>
			</span> <output for="star-input">
			<b>0</b>점</output>
			</span></td>
			
			<td><textarea rows="" cols="" name="contents">${view.contents}</textarea></td>
			<td><c:if test="${not empty member}">
					<button>Submit</button>
				</c:if></td>

		</tr>



	</table>




	<c:if test="${page.curBlock gt 1}">
		<input type="button" class="list" title="${page.startNum-1}"
			value="[이전]">
	</c:if>

	<c:forEach begin="${page.startNum}" end="${page.lastNum}" var="i">
		<input type="button" class="list" title="${i}" value="${i}">
	</c:forEach>

	<c:if test="${page.curBlock lt page.totalBlock}">
		<input type="button" class="list" title="${page.lastNum+1}"
			value="[다음]">
	</c:if>

	<a href="../index.jsp">BackPage</a>
</body>
</html>