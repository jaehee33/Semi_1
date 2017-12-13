<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Calendar cal=Calendar.getInstance();
	int year=cal.get(Calendar.YEAR);
	int month=cal.get(Calendar.MONTH);
	int date=cal.get(Calendar.DATE);
	int hour=cal.get(Calendar.HOUR_OF_DAY);
	int min=cal.get(Calendar.MINUTE);
	
	cal.set(year, month, date, hour, min);
	int day=cal.get(Calendar.DAY_OF_WEEK);
	int end=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	
	request.setAttribute("year", year); //년
	request.setAttribute("month", month+1); //월
	request.setAttribute("date", date); //일
	request.setAttribute("day", day); 
	request.setAttribute("end", end); //해당 월에 끝나는 날짜
	request.setAttribute("hour", hour);
	request.setAttribute("min", min);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style type="text/css">
.all{
		margin-top: 25px;
	}

#calendar {
    width:100%;
}

#calendar ul {
    padding-bottom: 25px;
}

#calendar li {
    display: block;
    float: left;
    width:14.342%;
    padding: 5px;
    margin-right: -1px;
}

#calendar ul.weekdays li {
    text-align: center;
    border: none;
    font-size: 13px;
    color: #918EDB;
}

#calendar .days li:hover .date {
    background: #918EDB;
    color:#fff;
}

#calendar .date {
    text-align: center;
    color: gray;
}

.container{
	width: 50%;
}	
table {
	width: 100%;
   	border: 1px solid black; 
}	
#reserve_title {
	color: gray;
	padding-left: 15px;
	padding-top: 15px;
}
.info {
   	text-align: right;
	padding-right: 15px;
	font-size: large;
	font-weight: bold;    	
}	
#price{
	color: #918EDB;
	text-align: right;
	padding-right: 15px;
	padding-bottom: 15px;
}	
#time_title{
	color: gray;
}
#bookdate{
	margin-top: 25px;
}
</style>
</head>
<body>
	<form action="./useWrite.use" method="post" class="container">
		<h3>예약하기</h3>
		<div class="form-group">
			<div id="calendar-wrap">
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
							<c:forEach begin="0" end="${day}" var="i">
								<li></li>
							</c:forEach>
						<c:forEach begin="1" end="${end}" var="i">
							<li class="day">
								<div class="date" id="day${i}">${i}</div>
							</li>
						</c:forEach>
					</ul>
				</div> <!-- calendar 끝 -->
			</div> <!-- calendar-wrap 끝 -->
			
			<!-- 선택한 날짜 나오게 하는것 -->
			<div id="bookdate">
				<input type="hidden" id="bk_date" value="${year}${month}${date}"> 
				${year}년 ${month}월 ${date}일 
			</div>

			<div class="all">
				<table>
					<thead>
						<tr>
							<td id="reserve_title" colspan="2">예약메뉴</td>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td rowspan="3"></td>
							<td class="info" id="store">${store}</td>
						</tr>
						<tr>
							<td class="info" id="style">${style}</td>
						</tr>
						<tr>
							<td id="price">${price}</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="all">
				<label id="time_title" for="sel1">시간 선택</label>
				<select class="form-control" id="sel1">
					<option>예약할 시간을 선택해주세요</option>
						<c:forEach begin="${hour+2}" end="18" var="i">
							<option>${i}:00</option>	
							<option>${i}:30</option>				
						</c:forEach>
				</select>
			</div>
			
			<div>
				<h3>총 결제금액 : ${price}</h3><button>예약하기</button>
			</div>
			
		</div>
	</form>
</body>
</html>