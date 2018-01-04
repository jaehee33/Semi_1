<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/store/storeView.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/store/storeheader.css" rel="stylesheet">
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ae88eb2c4820eb8b91b58f0cfc8ea570&libraries=services"></script>
<script>
	$(function() {
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			mapOption = {
				center : new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
				level : 3 // 지도의 확대 레벨
			};

		// 지도를 생성합니다    
		var map = new daum.maps.Map(mapContainer, mapOption);

		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new daum.maps.services.Geocoder();

		// 주소로 좌표를 검색합니다
		geocoder.addressSearch('${store.area}', function(result, status) {

			// 정상적으로 검색이 완료됐으면 
			if (status === daum.maps.services.Status.OK) {

				var coords = new daum.maps.LatLng(result[0].y, result[0].x);

				// 결과값으로 받은 위치를 마커로 표시합니다
				var marker = new daum.maps.Marker({
					map : map,
					position : coords
				});

				// 인포윈도우로 장소에 대한 설명을 표시합니다
				var infowindow = new daum.maps.InfoWindow({
					content : '<div style="width:150px;text-align:center;padding:6px 0;">${store.store}</div>'
				});
				infowindow.open(map, marker);

				// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				map.setCenter(coords);
			}
		});
		
		//==================즐겨찾기======================
		if(${favorDTO == null}){
			$.get('../favor/favorInsert.favor?store_id=${store.id}&store=${store.store}', function(data) {
				$("#favor").html(data);
			});
		}
		
		if(${favorDTO != null}){
			$.get('../favor/favorDelete.favor?store_id=${store.id}', function(data) {
				$("#favor").html(data);
			});
		}
		
		$("#favor").on("click", "#btn", function() {
			var favor = $(this).attr("class");
			document.frm.submit();
			if (favor == "off") {
				$("#btn").attr("class", "on");
			} else {
				$("#btn").attr("class", "off");
			}
		});
		//즐겨찾기 끝
		
		
		$("#pos").click(function(){
			location.href="../pos/posIndex.pos?store=${store.store}";
		});
		
		$("#kind").click(function(){
			location.href="../kind/kindIndex.kind?id=${store.id}";
		});
		
		$("#delete").click(function(){
			location.href="./storeDelete.store?id=${store.id}";
		});
		$("#update").click(function(){
			location.href="./storeUpdate.store?id=${store.id}";
		});
		$.get("./storeIndex.store?id=${store.id}",function(index){
			$("#storeheader").html(index);
		});
		
	});
</script>
<title>SemiHairShop - StoreView</title>
</head>
<body>
	<%@ include file="../temp/header.jsp"%>
	<section id="main">
		<div id="storeheader"></div>
		<div id="storeView">
			<div id="img">
				<c:forEach items="${filelist}" var="f">
					<c:if test="${store.store eq f.store}">
						<div id="imgg">
							<img id="mainimg" src="../upload/${f.fname}">
						</div>
					</c:if>
				</c:forEach>
				<div id="storeContents">
					<div id="info">
						<h3>StoreName</h3>
						<h1>${store.store}</h1>
						<p>
							<img src="<%=request.getContextPath()%>/img/store/scissors.png"
								style="width: 16px; height: 16px;"><b>Owner</b> <br>${store.id}</p>
						<p>
							<img src="<%=request.getContextPath()%>/img/store/scissors.png"
								style="width: 16px; height: 16px;"><b>Holiday</b> <br>${store.holiday}</p>
						<p>
							<img src="<%=request.getContextPath()%>/img/store/scissors.png"
								style="width: 16px; height: 16px;"><b>area</b> <br>${store.area}</p>
						<p>
							<img src="<%=request.getContextPath()%>/img/store/scissors.png"
								style="width: 16px; height: 16px;"><b>storetel</b> <br>${store.storetel}</p>
						<br>
						<c:if test="${not empty member}">
							<div id="favor"></div>
						</c:if>
						<c:if test="${sessionScope.member.id eq store.id}">
							<div id="ownerMenu">
								OwnerMenu
								<div class="toggle" id="delete">delete</div>
								<div class="toggle" id="update">update</div>

								<div class="toggle" id="pos">pos</div>
								<div class="toggle" id="kind">kind</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<div id="mapArea">

				<h1>
					<img src="<%=request.getContextPath()%>/img/store/scissors.png"
						style="width: 16px; height: 16px;">STORE AREA
				</h1>
				<div id="map" style="width: 100%; height: 500px;"></div>
			</div>


		</div>
	</section>
</body>
</html>