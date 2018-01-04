<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>SemiHairShop</title>
<link rel="stylesheet" 	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {		
		if(${styleDTO == null}){
			$.get("../style/styleInsert.style?num=${kind.num}&style=${kind.style}&price=${kind.price}&store=${kind.store}", function(data) {
				$("#favor").html(data);
			});
		}
		
		if(${styleDTO != null}) {
			$.get("../style/styleDelete.style?num=${kind.num}&style=${kind.style}", function(data) {
				$("#favor").html(data);
			});
		}
		
		$("#favor").on("click", "#btn", function() {
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
<link href="<%=request.getContextPath()%>/css/kind/kindView.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div class="view_wrap">
			<article class="view_product">
				<header class="header">
					<div class="photo">
						<img src="../upload/${file.fname}">
					</div>
					<div id="Contents">
						<div id="info">
							<h3>Style</h3>
							<h1>${kind.style}</h1>
							<p>
								<img src="<%=request.getContextPath()%>/img/store/scissors.png"
									style="width: 16px; height: 16px;"> <b>매장명</b> <br>${kind.store}
							</p>
							<p>
								<img src="<%=request.getContextPath()%>/img/store/scissors.png"
									style="width: 16px; height: 16px;"> <b>가격</b> <br>${kind.price}
							</p>
							<br>
							<c:if test="${not empty member}">
								<div id="favor"></div>
							</c:if>
						</div>
					</div>
					<div class="buy">
						<a
							href="../use/useWrite.use?store=${kind.store}&style=${kind.style}&price=${kind.price}"
							target="_self">예약하기</a>
					</div>
				</header>
			</article>
		</div>
	</section>

	<%@ include file="../temp/footer.jsp"%>
</body>
</html>