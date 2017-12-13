<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	Calendar cal=Calendar.getInstance();
	int year=cal.get(Calendar.YEAR);
	int month=cal.get(Calendar.MONTH)+1;
	int date=cal.get(Calendar.DATE);
	int hour=cal.get(Calendar.HOUR);
	int min=cal.get(Calendar.MINUTE);
	
	cal.set(year, month, date);
	System.out.println(year+"년");
	System.out.println(month+"월");
	System.out.println(date+"일");
	int day=cal.get(Calendar.DAY_OF_WEEK);
	String Day=null;
	 switch (day) {  
	   case 1 : Day = "일"; break;
	   case 2 :Day = "월"; break;
	   case 3 :Day = "화"; break;
	   case 4 :Day = "수"; break;
	   case 5 :Day = "목";  break;
	   case 6 :Day = "금"; break;
	   case 7 : Day = "토";  
	  }

	System.out.println(Day+"요일");
	
	request.setAttribute("year", year);
	request.setAttribute("month", month);
	request.setAttribute("date", date);
	request.setAttribute("Day", Day);
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
</style>
</head>
<body>
	<form action="" method="post" class="container">
		<h3>예약하기</h3>
		<div class="form-group">
			<div id="calendar-wrap">
				<div id="calendar">
						<ul class="weekdays">
						<c:forEach items="">
							<li>${Day}</li>
						</c:forEach>
						</ul>
						<ul class="days">
					<c:forEach begin="0" end="13" var="i">
							<li class="day">
								<div class="date">${date+i}</div>
							</li>
					</c:forEach>
						</ul>
				</div> <!-- calendar 끝 -->
			</div> <!-- calendar-wrap 끝 -->
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
							<td class="info">pokemon</td>
						</tr>
						<tr>
							<td class="info">컷트</td>
						</tr>
						<tr>
							<td id="price">15000</td>
						</tr>
					</tbody>
				</table>
			</div>

			<div class="all">
				<label id="time_title" for="sel1">시간 선택</label>
				<select class="form-control" id="sel1">
					<option>예약할 시간을 선택해주세요</option>
					<option>11:00</option>
				</select>
			</div>
		</div>
	</form>
</body>
</html>