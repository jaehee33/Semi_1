 <%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Calendar cal=Calendar.getInstance();
	int y=cal.get(Calendar.YEAR);
	int m=cal.get(Calendar.MONTH)+1;
	int d=cal.get(Calendar.DATE);
	
	cal.set(y,m,d);
	int startday=cal.getMinimum(Calendar.DAY_OF_MONTH);
	out.println("시작일 : " + startday);
	int endday=cal.getActualMaximum(Calendar.DAY_OF_MONTH);
	out.println("종료일 : " + endday);
	int startweek=cal.get(Calendar.DAY_OF_WEEK);
	out.println("시작 요일 : " + startweek);
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

#calendar .other-month {
    background: #f5f5f5;
    color: #666;
}
#calendar .other-date {
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
						<li>일</li>
						<li>월</li>
						<li>화</li>
						<li>수</li>
						<li>목</li>
						<li>금</li>
						<li>토</li>
					</ul>

					<!-- Days from previous month -->

					<ul class="days">
						<li class="day other-month">
							<div class="other-date">27</div>
						</li>
						<li class="day other-month">
							<div class="other-date">28</div>
						</li>
						<li class="day other-month">
							<div class="other-date">29</div>
						</li>
						<li class="day other-month">
							<div class="other-date">30</div>
						</li>
						<li class="day other-month">
							<div class="other-date">31</div>
						</li>

						<!-- Days in current month -->

						<li class="day">
							<div class="date">1</div>
						</li>
						<li class="day">
							<div class="date">2</div>
						</li>
					</ul>

					<!-- Row #2 -->

					<ul class="days">
						<li class="day">
							<div class="date">3</div>
						</li>
						<li class="day">
							<div class="date">4</div>
						</li>
						<li class="day">
							<div class="date">5</div>
						</li>
						<li class="day">
							<div class="date">6</div>
						</li>
						<li class="day">
							<div class="date">7</div>
						</li>
						<li class="day">
							<div class="date">8</div>
						</li>
						<li class="day">
							<div class="date">9</div>
						</li>
					</ul>

					<!-- Row #3 -->

					<ul class="days">
						<li class="day">
							<div class="date">10</div>
						</li>
						<li class="day">
							<div class="date">11</div>
						</li>
						<li class="day">
							<div class="date">12</div>
						</li>
						<li class="day">
							<div class="date">13</div>
						</li>
						<li class="day">
							<div class="date">14</div>
						</li>
						<li class="day">
							<div class="date">15</div>
						</li>
						<li class="day">
							<div class="date">16</div>
						</li>
					</ul>

					<!-- Row #4 -->

					<ul class="days">
						<li class="day">
							<div class="date">17</div>
						</li>
						<li class="day">
							<div class="date">18</div>
						</li>
						<li class="day">
							<div class="date">19</div>
						</li>
						<li class="day">
							<div class="date">20</div>
						</li>
						<li class="day">
							<div class="date">21</div>
						</li>
						<li class="day">
							<div class="date">22</div>
						</li>
						<li class="day">
							<div class="date">23</div>
						</li>
					</ul>

					<!-- Row #5 -->

					<ul class="days">
						<li class="day">
							<div class="date">24</div>
						</li>
						<li class="day">
							<div class="date">25</div>
						</li>
						<li class="day">
							<div class="date">26</div>
						</li>
						<li class="day">
							<div class="date">27</div>
						</li>
						<li class="day">
							<div class="date">28</div>
						</li>
						<li class="day">
							<div class="date">29</div>
						</li>
						<li class="day">
							<div class="date">30</div>
						</li>
					</ul>

					<!-- Row #6 -->

					<ul class="days">
						<li class="day">
							<div class="date">31</div>
						</li>
						<li class="day other-month">
							<div class="other-date">1</div> <!-- Next Month -->
						</li>
						<li class="day other-month">
							<div class="other-date">2</div>
						</li>
						<li class="day other-month">
							<div class="other-date">3</div>
						</li>
						<li class="day other-month">
							<div class="date">4</div>
						</li>
						<li class="day other-month">
							<div class="other-date">5</div>
						</li>
						<li class="day other-month">
							<div class="other-date">6</div>
						</li>
					</ul>

				</div>
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
				<label id="time_title" for="sel1">시간 선택</label> <select
					class="form-control" id="sel1">
					<option>11:00</option>
					<option>11:30</option>
					<option>12:00</option>
					<option>12:30</option>
					<option>13:00</option>
					<option>13:30</option>
					<option>14:00</option>
					<option>14:30</option>
					<option>15:00</option>
					<option>15:30</option>
					<option>16:00</option>
					<option>16:30</option>
					<option>17:00</option>
					<option>17:30</option>
					<option>18:00</option>
					<option>18:30</option>
				</select>
			</div>
		</div>
	</form>
</body>
</html>