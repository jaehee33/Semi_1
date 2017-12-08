<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	.container{
		width: 30%;
	}
	table {
    	border: 1px solid black;
    	border-collapse: collapse;
	}
	th {
    	text-align: right;
	}
</style>
</head>
<body>
	<form action="" method="post" class="container">
		<h3>예약하기</h3>
		<div class="form-group">
				<table>
					<tbody>
						<tr>
							<td rowspan="5">예약메뉴</td>
						</tr>
						<tr>
							<th>pokemon</th>
						</tr>
						<tr>
							<th>컷트</th>
						</tr>
						<tr>
							<th>15000</th>
						</tr>
						<tr>
							<th>15000</th>
						</tr>
					</tbody>
				</table>
			<label for="sel1">시간 선택</label>
			<select class="form-control" id="sel1">
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
	</form>
</body>
</html>