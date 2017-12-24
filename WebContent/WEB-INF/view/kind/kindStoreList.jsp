<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/store/storeheader.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="../dist/css/swiper.min.css">
<script type="text/javascript">
$(function(){
	$.get("../store/storeIndex.store?id=${store.id}",function(index){
		$("#storeheader").html(index);
	});
});
</script>
<style type="text/css">
 body {
      background: #eee;
      font-family: Helvetica Neue, Helvetica, Arial, sans-serif;
      font-size: 14px;
      color:#000;
      margin: 0;
      padding: 0;
    }
    .swiper-container {
      width: 100%;
      height: 300px;
      margin: 20px auto;
    }
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      background: #fff;

      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    .append-buttons {
      text-align: center;
      margin-top: 20px;
    }
    .append-buttons a {
      display: inline-block;
      border: 1px solid #007aff;
      color: #007aff;
      text-decoration: none;
      padding: 4px 10px;
      border-radius: 4px;
      margin: 0 10px;
      font-size: 13px;
    }
</style>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<section id="main">
<div id="storeheader"></div>
<div id="storeView">
<div class="swiper-container">
<div class="swiper-wrapper"></div>

<div class="swiper-pagination"></div>

<div class="swiper-button-next"></div>
<div class="swiper-button-prev"></div>
</div>
<script src="../dist/js/swiper.min.js"></script>

<script>
    var swiper = new Swiper('.swiper-container', {
      slidesPerView: 3,
      centeredSlides: true,
      spaceBetween: 30,
      pagination: {
        el: '.swiper-pagination',
        type: 'fraction',
      },
      navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
      virtual: {
        slides: (function () {
          var slides = [];
          for (var i = 0; i < 600; i += 1) {
            slides.push('Slide ' + (i + 1));
          }
          return slides;
        }()),
      },
    });
});
  </script>
<div id="style">
	<c:forEach items="${kindlist}" var="k">
		<div id="kindlist">
		<c:forEach items="${filelist}" var="f">
		<c:if test="${k.num eq f.num}">
		<img src="../upload/${f.fname}">
		</c:if>
		</c:forEach>
			<p>${k.style}(${k.kind})</p>
			<p>${k.price}</p>
			<p><a href="../use/useWrite.use?store=${store.store}&style=${k.kind}&price=${k.price}">예약</a></p>
		</div>
	</c:forEach>
</div>
</div>
</section>
</body>
</html>