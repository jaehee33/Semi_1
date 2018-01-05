<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SemiHairShop</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {		
		if(${styleDTO == null}){
			$.get("../style/styleInsert.style?num=${kind.num}&style=${kind.style}&price=${kind.price}&store=${kind.store}&store_id=${store.id}", function(data) {
				$(".favor").html(data);
			});
		}
		
		if(${styleDTO != null}) {
			$.get("../style/styleDelete.style?num=${kind.num}&style=${kind.style}", function(data) {
				$(".favor").html(data);
			});
		}
		
		$(".favor").on("click", "#btn", function() {
			var favor = $(this).attr("class");
			document.frm.submit();
			if (favor == "off") {
				$("#btn").attr("class", "on");
			}else {
				$("#btn").attr("class", "off");
			}
		});
		
		
	});
</script>
<link href="<%=request.getContextPath()%>/css/kind/kindView.css"
	rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div class="view_wrap">
			<article class="view_product">
				<header class="header">
					<div class="container">
						<div id="box">
							<div id="imagesize">
								<img src="../upload/${file.fname}" width="450" height="560">
							</div>
							<div id="info">
								<h3 id="h3stylename">
									<img src="<%=request.getContextPath()%>/img/store/scissors.png" style="width: 25px; height: 25px;"> <b>Style</b>
								</h3>
								<h3 id="h3style">${kind.style}</h3>
								<h3 id="h3storename">
									<img src="<%=request.getContextPath()%>/img/store/scissors.png" style="width: 22px; height: 22px;">
									<b>매장명</b>
								</h3>
								<h3 id="h3store">${kind.store}</h3>

								<h3 id="h3pricename">
									<img src="<%=request.getContextPath()%>/img/store/scissors.png" style="width: 22px; height: 22px;">
									<b>가격</b>
								</h3>
								<h3 id="h3price">${kind.price}원</h3>
							</div>
						</div>
						<c:if test="${not empty member}">
							<div class="favor"></div>
						</c:if>
					</div>

					<div class="buy">
						<a href="../use/useWrite.use?store=${kind.store}&style=${kind.style}&price=${kind.price}" target="_self">예약하기</a>
					</div>
				</header>
			</article>
		</div>
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>