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


			
			<div style="background: #eee" class="rsv_calendar">
				<div>
					<div id="date-range12" size="40" value=""></div>
					<div id="date-range12-container" style="width: 100%;">
						<div
							class="date-picker-wrapper no-shortcuts  inline-wrapper no-gap two-months"
							unselectable="on" style="user-select: none;">
							<div class="drp_top-bar normal">
								<div class="normal-top">
									<span style="color: #333">기간: </span> <b class="start-day">2017.12.22</b>
									<span class="separator-day">|</span> <b class="end-day">...</b>
									<i class="selected-days" style="display: none;">(<span
										class="selected-days-num">1</span> 일간)
									</i>
								</div>
								<div class="error-top">error</div>
								<div class="default-top">0 일보다 작은 날짜를 선택해 주세요</div>
								<input type="button" class="apply-btn disabled" value="닫기"
									style="display: none;">
							</div>
							<div class="month-wrapper" style="width: 511px;">
								<table class="month1" cellspacing="0" border="0" cellpadding="0">
									<thead>
										<tr class="caption">
											<th style="width: 27px;"><span class="prev">&lt;
											</span></th>
											<th colspan="5" class="month-name">2017.12</th>
											<th style="width: 27px;"></th>
										</tr>
										<tr class="week-name">
											<th>SUN</th>
											<th>MON</th>
											<th>TUE</th>
											<th>WED</th>
											<th>THU</th>
											<th>FRI</th>
											<th>SAT</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><div time="1511695653949" data-tooltip=""
													class="day lastMonth  invalid">26</div></td>
											<td><div time="1511782053949" data-tooltip=""
													class="day lastMonth  invalid">27</div></td>
											<td><div time="1511868453949" data-tooltip=""
													class="day lastMonth  invalid">28</div></td>
											<td><div time="1511954853949" data-tooltip=""
													class="day lastMonth  invalid">29</div></td>
											<td><div time="1512041253949" data-tooltip=""
													class="day lastMonth  invalid">30</div></td>
											<td><div time="1512127653949" data-tooltip=""
													class="day toMonth  invalid">1</div></td>
											<td><div time="1512214053949" data-tooltip=""
													class="day toMonth  invalid">2</div></td>
										</tr>
										<tr>
											<td><div time="1512300453949" data-tooltip=""
													class="day toMonth  invalid">3</div></td>
											<td><div time="1512386853949" data-tooltip=""
													class="day toMonth  invalid">4</div></td>
											<td><div time="1512473253949" data-tooltip=""
													class="day toMonth  invalid">5</div></td>
											<td><div time="1512559653949" data-tooltip=""
													class="day toMonth  invalid">6</div></td>
											<td><div time="1512646053949" data-tooltip=""
													class="day toMonth  invalid">7</div></td>
											<td><div time="1512732453949" data-tooltip=""
													class="day toMonth  invalid">8</div></td>
											<td><div time="1512818853949" data-tooltip=""
													class="day toMonth  invalid">9</div></td>
										</tr>
										<tr>
											<td><div time="1512905253949" data-tooltip=""
													class="day toMonth  invalid">10</div></td>
											<td><div time="1512991653949" data-tooltip=""
													class="day toMonth  invalid">11</div></td>
											<td><div time="1513078053949" data-tooltip=""
													class="day toMonth  invalid">12</div></td>
											<td><div time="1513164453949" data-tooltip=""
													class="day toMonth  invalid">13</div></td>
											<td><div time="1513250853949" data-tooltip=""
													class="day toMonth  invalid">14</div></td>
											<td><div time="1513337253949" data-tooltip=""
													class="day toMonth  invalid">15</div></td>
											<td><div time="1513423653949" data-tooltip=""
													class="day toMonth  invalid">16</div></td>
										</tr>
										<tr>
											<td><div time="1513510053949" data-tooltip=""
													class="day toMonth  invalid">17</div></td>
											<td><div time="1513596453949" data-tooltip=""
													class="day toMonth  invalid">18</div></td>
											<td><div time="1513682853949" data-tooltip=""
													class="day toMonth  invalid">19</div></td>
											<td><div time="1513769253949" data-tooltip=""
													class="day toMonth  invalid">20</div></td>
											<td><div time="1513855653949" data-tooltip=""
													class="day toMonth  invalid real-today">21</div></td>
											<td><div time="1513942053949" data-tooltip=""
													class="day toMonth  valid checked tmp first-date-selected">22</div></td>
											<td><div time="1514028453949" data-tooltip=""
													class="day toMonth  valid tmp">23</div></td>
										</tr>
										<tr>
											<td><div time="1514114853949" data-tooltip=""
													class="day toMonth  valid tmp">24</div></td>
											<td><div time="1514201253949" data-tooltip=""
													class="day toMonth  valid tmp">25</div></td>
											<td><div time="1514287653949" data-tooltip=""
													class="day toMonth  valid tmp">26</div></td>
											<td><div time="1514374053949" data-tooltip=""
													class="day toMonth  valid tmp">27</div></td>
											<td><div time="1514460453949" data-tooltip=""
													class="day toMonth  valid tmp">28</div></td>
											<td><div time="1514546853949" data-tooltip=""
													class="day toMonth  valid tmp">29</div></td>
											<td><div time="1514633253949" data-tooltip=""
													class="day toMonth  valid tmp">30</div></td>
										</tr>
										<tr>
											<td><div time="1514719653949" data-tooltip=""
													class="day toMonth  valid tmp">31</div></td>
											<td><div time="1514806053949" data-tooltip=""
													class="day nextMonth  valid">1</div></td>
											<td><div time="1514892453949" data-tooltip=""
													class="day nextMonth  valid">2</div></td>
											<td><div time="1514978853949" data-tooltip=""
													class="day nextMonth  valid">3</div></td>
											<td><div time="1515065253949" data-tooltip=""
													class="day nextMonth  valid">4</div></td>
											<td><div time="1515151653949" data-tooltip=""
													class="day nextMonth  valid">5</div></td>
											<td><div time="1515238053949" data-tooltip=""
													class="day nextMonth  valid">6</div></td>
										</tr>
									</tbody>
								</table>
								<div class="gap" style="visibility: hidden; height: 263px;">
									<div class="gap-top-mask"></div>
									<div class="gap-bottom-mask"></div>
									<div class="gap-lines">
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
										<div class="gap-line">
											<div class="gap-1"></div>
											<div class="gap-2"></div>
											<div class="gap-3"></div>
										</div>
									</div>
								</div>
								<table class="month2" cellspacing="0" border="0" cellpadding="0">
									<thead>
										<tr class="caption">
											<th style="width: 27px;"></th>
											<th colspan="5" class="month-name">2018.1</th>
											<th style="width: 27px;"><span class="next">&gt;</span>
											</th>
										</tr>
										<tr class="week-name">
											<th>SUN</th>
											<th>MON</th>
											<th>TUE</th>
											<th>WED</th>
											<th>THU</th>
											<th>FRI</th>
											<th>SAT</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><div time="1514719653949" data-tooltip=""
													class="day lastMonth  valid">31</div></td>
											<td><div time="1514806053949" data-tooltip=""
													class="day toMonth  valid tmp">1</div></td>
											<td><div time="1514892453949" data-tooltip=""
													class="day toMonth invalid tmp">2</div></td>
											<td><div time="1514978853949" data-tooltip=""
													class="day toMonth invalid tmp">3</div></td>
											<td><div time="1515065253949" data-tooltip=""
													class="day toMonth invalid tmp">4</div></td>
											<td><div time="1515151653949" data-tooltip=""
													class="day toMonth invalid tmp">5</div></td>
											<td><div time="1515238053949" data-tooltip=""
													class="day toMonth invalid tmp">6</div></td>
										</tr>
										<tr>
											<td><div time="1515324453949" data-tooltip=""
													class="day toMonth invalid tmp">7</div></td>
											<td><div time="1515410853949" data-tooltip=""
													class="day toMonth invalid tmp">8</div></td>
											<td><div time="1515497253949" data-tooltip=""
													class="day toMonth invalid tmp">9</div></td>
											<td><div time="1515583653949" data-tooltip=""
													class="day toMonth invalid tmp">10</div></td>
											<td><div time="1515670053949" data-tooltip=""
													class="day toMonth invalid tmp">11</div></td>
											<td><div time="1515756453949" data-tooltip=""
													class="day toMonth invalid tmp">12</div></td>
											<td><div time="1515842853949" data-tooltip=""
													class="day toMonth invalid tmp">13</div></td>
										</tr>
										<tr>
											<td><div time="1515929253949" data-tooltip=""
													class="day toMonth invalid tmp">14</div></td>
											<td><div time="1516015653949" data-tooltip=""
													class="day toMonth invalid tmp">15</div></td>
											<td><div time="1516102053949" data-tooltip=""
													class="day toMonth invalid tmp">16</div></td>
											<td><div time="1516188453949" data-tooltip=""
													class="day toMonth invalid tmp">17</div></td>
											<td><div time="1516274853949" data-tooltip=""
													class="day toMonth invalid tmp">18</div></td>
											<td><div time="1516361253949" data-tooltip=""
													class="day toMonth invalid tmp">19</div></td>
											<td><div time="1516447653949" data-tooltip=""
													class="day toMonth invalid tmp">20</div></td>
										</tr>
										<tr>
											<td><div time="1516534053949" data-tooltip=""
													class="day toMonth invalid tmp">21</div></td>
											<td><div time="1516620453949" data-tooltip=""
													class="day toMonth invalid tmp">22</div></td>
											<td><div time="1516706853949" data-tooltip=""
													class="day toMonth invalid tmp">23</div></td>
											<td><div time="1516793253949" data-tooltip=""
													class="day toMonth invalid tmp">24</div></td>
											<td><div time="1516879653949" data-tooltip=""
													class="day toMonth invalid tmp">25</div></td>
											<td><div time="1516966053949" data-tooltip=""
													class="day toMonth invalid tmp">26</div></td>
											<td><div time="1517052453949" data-tooltip=""
													class="day toMonth invalid tmp">27</div></td>
										</tr>
										<tr>
											<td><div time="1517138853949" data-tooltip=""
													class="day toMonth invalid tmp">28</div></td>
											<td><div time="1517225253949" data-tooltip=""
													class="day toMonth invalid tmp">29</div></td>
											<td><div time="1517311653949" data-tooltip=""
													class="day toMonth invalid tmp">30</div></td>
											<td><div time="1517398053949" data-tooltip=""
													class="day toMonth invalid tmp">31</div></td>
											<td><div time="1517484453949" data-tooltip=""
													class="day nextMonth  valid">1</div></td>
											<td><div time="1517570853949" data-tooltip=""
													class="day nextMonth  valid">2</div></td>
											<td><div time="1517657253949" data-tooltip=""
													class="day nextMonth  valid">3</div></td>
										</tr>
									</tbody>
								</table>
								<div style="clear: both; height: 0; font-size: 0;"></div>
								<div class="time">
									<div class="time1"></div>
									<div class="time2"></div>
								</div>
								<div style="clear: both; height: 0; font-size: 0;"></div>
							</div>
							<div class="footer"></div>
							<div class="date-range-length-tip"
								style="display: none; visibility: visible; left: 217px; top: 189px;">8
								일간</div>
						</div>
					</div>
				</div>
			</div>




		</form>
	</section>
</body>
</html>