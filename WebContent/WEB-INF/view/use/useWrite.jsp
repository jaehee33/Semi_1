<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Calendar cal=Calendar.getInstance();
	int year=cal.get(Calendar.YEAR);
	int month=cal.get(Calendar.MONTH)+1;
	int date=cal.get(Calendar.DATE);
	int hour=cal.get(Calendar.HOUR_OF_DAY);
	int min=cal.get(Calendar.MINUTE);
	
	cal.set(year, month-1, 1);
	int start=1;
	int end=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	int week=cal.get(Calendar.DAY_OF_WEEK);
	
	request.setAttribute("year", year); //년
	request.setAttribute("month", month); //월
	request.setAttribute("date", date);
	request.setAttribute("start", start); 
	request.setAttribute("end", end); //해당 월에 끝나는 날짜
	request.setAttribute("week",week);
	request.setAttribute("hour", hour);
	request.setAttribute("min", min);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>semi hair shop</title>
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#time").click(function(){
			$(this).attr("selected", true, function(){
				$("#tbody").append();
			});
			
		});
	});
</script>
<link href="<%=request.getContextPath()%>/css/use/useWrite.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<form action="./useWrite.use?store=${store}&style=${style}&price=${price}" method="post" class="container">
			<h3>예약하기</h3>
			<div class="form-group">
				<div class="rsv_l">
					<div id="calendar">
						<ul class="weekdays">
							<li>일</li>
							<li>월</li>
							<li>화</li>
							<li>수</li>
							<li>목</li>
							<li>금</li>
							<li>토</li>
						</ul>
						<ul class="days">
							<c:forEach begin="1" end="${week-1}" var="i">
								<li></li>
							</c:forEach>
							<c:forEach begin="1" end="${end}" var="i">
								<c:if test="${date==i}">
									<li class="day">
										<div id="today">${i}</div>
									</li>
								</c:if>
								<c:if test="${date != i}">
									<li class="day">
										<div class="date" id="day&${i}">${i}</div>
									</li>
								</c:if>
							</c:forEach>
						</ul>
						<br>
					</div>
					<!-- calendar 끝 -->

					<!-- 선택한 날짜 나오게 하는것 -->
					<div id="bk_date" class="wrap">
						<hr>${year}년${month}월 ${date}일
						<hr>
					</div>

					<!-- 시간선택 -->
					<div class="wrap">
						<label class="title" for="sel1">시간 선택</label>
						<select class="form-control" id="time" name="time">
							<option onselect="false" >예약할 시간을 선택해주세요</option>
							<c:forEach begin="${hour+1}" end="22" var="i">
								<option class="select_time" value="${i}:00">${i}:00</option>
								<option class="select_time" value="${i}:30">${i}:30</option>
							</c:forEach>
						</select>
					</div>

					<!-- 쿠폰선택 -->
					<div class="wrap">
						<label class="title" for="sel1">할인 쿠폰</label>
						<select class="form-control" id="coupon" name="coupon">
							<option>쿠폰을 선택해주세요</option>
							<c:forEach items="${list}" var="i">
								<option class="select_coupon" value="${i.coupon}">${i.coupon}</option>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="rsv_r">
					<table id="confirm_table">
						<thead>
							<tr>
								<td id="reserve_title" colspan="2">예약메뉴</td>
							</tr>
						</thead>
						<tbody id="tbody">
						<tr>
	<td rowspan="3"></td>
	<td class="info">${store}</td>
</tr>
<tr>
	<td class="info">${style}</td>
</tr>
<tr>
	<td id="price">${price}</td>
</tr>
						</tbody>
					</table>

					<h3>총 결제금액 : ${price}원</h3>
					 <button class="btn btn-default wrap" id="finish">예약하기</button>
				</div>


			</div>
		</form>
	</section>
</body>
</html>