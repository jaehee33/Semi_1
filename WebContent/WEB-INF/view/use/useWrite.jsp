<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>semi hair shop</title>
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript">
	$(function(){
		$("#time").click(function(){
			$(this).attr("selected", true, function(){
				$("#tbody").append();
			});
		});

		$("#finish").click(function(){
			var IMP=window.IMP;
			IMP.init(imp78791768);

			IMP.request_pay({
			    pg : 'uplus', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '${style}',
			    amount : ${price},
			    buyer_name : '${member.name}',
			    buyer_tel : '${member.phone}',
			    m_redirect_url : '<%=request.getContextPath()%>/WEB-INF/view/use/usePay.use'
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
			        msg += '고유ID : ' + rsp.imp_uid;
			        msg += '상점 거래ID : ' + rsp.merchant_uid;
			        msg += '결제 금액 : ' + rsp.paid_amount;
			        msg += '카드 승인번호 : ' + rsp.apply_num;
			    } else {
			        var msg = '결제에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;
			    }
			    alert(msg);
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
						<table>
							<tr>
								<th>일</th>
								<th>월</th>
								<th>화</th>
								<th>수</th>
								<th>목</th>
								<th>금</th>
								<th>토</th>
							</tr>
							<tr class="days">
								<c:forEach begin="1" end="${week-1}" var="i">
									<td></td>
								</c:forEach>
								<c:forEach begin="1" end="${end}" var="i">
									<td class="day">
										<c:if test="${date==i}">
											<div id="today">${i}</div>
										</c:if> <c:if test="${date != i}">
											<div class="date" id="day${i}">${i}</div>
										</c:if>
									</td>
								</c:forEach>
							</tr>
						</table>
					</div>
					<!-- calendar 끝 -->

					<!-- 선택한 날짜 나오게 하는것 -->
					<div id="bk_date" class="wrap">
						<input type="hidden" value="${year}-${month}-${date}">
						${year}년${month}월${date}일
					</div>

					<!-- 시간선택 -->
					<div class="wrap">
						<label class="title" for="sel1">시간 선택</label> <select
							class="form-control" id="time" name="time">
							<option onselect="false">예약할 시간을 선택해주세요</option>
							<c:forEach begin="${hour+1}" end="22" var="i">
								<option class="select_time" value="${i}:00">${i}:00</option>
								<option class="select_time" value="${i}:30">${i}:30</option>
							</c:forEach>
						</select>
					</div>

					<!-- 쿠폰선택 -->
					<div class="wrap">
						<label class="title" for="sel1">할인 쿠폰</label> <select
							class="form-control" id="coupon" name="coupon">
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