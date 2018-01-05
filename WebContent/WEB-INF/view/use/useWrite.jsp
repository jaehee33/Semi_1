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
		
		var total=Number(${price});
		$("#total").html(total);
		
		$(".wrap").on("change","#coupon",function(){
			var title=0;
			total=Number(${price});
			$(".select_coupon",this).each(function(){
				if($(this).prop("selected")){
					title=Number($(this).attr("title"));
				}
			});
			
			total=Number(total-(total*title/100));
			$("#total").html(total);
		});
		
		$("#finish").click(function(){
			var IMP=window.IMP;
			IMP.init("imp78791768");

			IMP.request_pay({
			    pg : 'uplus', // version 1.1.0부터 지원.
			    pay_method : 'card',
			    merchant_uid : 'merchant_' + new Date().getTime(),
			    name : '${style}',
			    amount : ${price},
			    buyer_name : '${member.name}',
			    buyer_tel : '${member.phone}',
			}, function(rsp) {
			    if ( rsp.success ) {
			        var msg = '결제가 완료되었습니다.';
				    document.frm.submit();
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
		<div class="container">
		<div id="box">
		<form name="frm" action="./useWrite.use?store=${store}&style=${style}&price=${price}" method="post" class="container">
			<h1>예약하기</h1>
			<p id="info1">예약과 결제까지 한 번에!</p>
				
			<div class="form-group">
				<div class="rsv_l">
					<!-- 날짜선택 -->
					<div class="wrap">
						<label class="title" for="sel1">날짜 선택</label><br>
						<input type="date" class="form-control" name="bk_date">
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
						<label class="title" for="sel1">할인 쿠폰</label>
						<select class="form-control" id="coupon" name="coupon">
							<option>쿠폰을 선택해주세요</option>
							<c:forEach items="${list}" var="i" varStatus="o">
								<option class="select_coupon" title="${i.discount}" value="${i.coupon}">${i.coupon}</option>
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

					<h3>총 결제금액 :</h3>
					<h3 id="total"></h3>
					<button type="button" id="finish">결제하기</button>
				</div>
			</div>
		</form>
		</div>
		</div>
	</section>
	
	<%@ include file="../temp/footer.jsp"%>
</body>
</html>