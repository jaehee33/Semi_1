<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="<%=request.getContextPath()%>/css/store/storeheader.css" rel="stylesheet">
<link href="<%=request.getContextPath() %>/css/kind/kindstoreList.css" rel="stylesheet">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
<title>Insert title here</title>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="../slider/slick/slick.css">
  <link rel="stylesheet" type="text/css" href="../slider/slick/slick-theme.css">
<script type="text/javascript">
$(function(){
	$.get("../store/storeIndex.store?id=${store.id}",function(index){
		$("#storeheader").html(index);
	});
});
</script>
<script type="text/javascript">
$(function(){
	function initparticles() {
	   confetti();
	}
	function confetti() {
	   $.each($(".particletext.confetti"), function(){
	      var confetticount = ($(this).width()/50)*10;
	      for(var i = 0; i <= confetticount; i++) {
	         $(this).append('<span class="particle c' + $.rnd(1,2) + '" style="top:' + $.rnd(10,50) + '%; left:' + $.rnd(0,100) + '%;width:' + $.rnd(6,8) + 'px; height:' + $.rnd(3,4) + 'px;animation-delay: ' + ($.rnd(0,30)/10) + 's;"></span>');
	      }
	   });
	}
	jQuery.rnd = function(m,n) {
	      m = parseInt(m);
	      n = parseInt(n);
	      return Math.floor( Math.random() * (n - m + 1) ) + m;
	}
	initparticles();
});
</script>
 <style type="text/css">
    html, body {
      margin: 0;
      padding: 0;
    }

    * {
      box-sizing: border-box;
    }

    .slider {
        width: 80%;
        margin: 100px auto;
    }

    .slick-slide {
      margin: 0px 20px;
    }

    .slick-slide img {
      width: 100%;
    }
    
    .slick-slide img:hover {
      width: 100%;
      border: 5px solid #5F4B8B;
    }

    .slick-prev:before,
    .slick-next:before {
      color: black;
    }


    .slick-slide {
      transition: all ease-in-out .3s;
      opacity: .2;
    }
    
    .slick-active {
      opacity: .5;
    }

    .slick-current {
      opacity: 1;
    }
  </style>
</head>
<body>
<%@ include file="../temp/header.jsp" %>
<section id="main">
<div id="storeheader"></div>
<div id="storeView">
<div id="style">
<div class="textcontainer">
   			<span class="particletext confetti"><img src="../img/kind/scissors-of-modern-design.png" style="width: 30px; height: 30px;"> STYLE LIST <img src="../img/kind/scissors-of-modern-design.png" style="width: 30px; height: 30px;"></span>
		</div>
<div id="stylelist">
 <div class="variable slider">
	<c:forEach items="${kindlist}" var="k">
		<div id="kindlist">
		<c:forEach items="${filelist}" var="f">
		<c:if test="${k.num eq f.num}">
		<img src="../upload/${f.fname}" style="width: 370px; height: 450px;">
		</c:if>
		</c:forEach>
			<p>${k.style}(${k.kind})</p>
			<p>${k.price}</p>
			<p><a href="../use/useWrite.use?store=${store.store}&style=${k.kind}&price=${k.price}">예약</a></p>
		</div>
	</c:forEach>
  </div>
</div>
</div>
</div>
  <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
  <script src="../slider/slick/slick.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    $(document).on('ready', function() {
      $(".vertical-center-4").slick({
        dots: true,
        vertical: true,
        centerMode: true,
        slidesToShow: 4,
        slidesToScroll: 2
      });
      $(".vertical-center-3").slick({
        dots: true,
        vertical: true,
        centerMode: true,
        slidesToShow: 3,
        slidesToScroll: 3
      });
      $(".vertical-center-2").slick({
        dots: true,
        vertical: true,
        centerMode: true,
        slidesToShow: 2,
        slidesToScroll: 2
      });
      $(".vertical-center").slick({
        dots: true,
        vertical: true,
        centerMode: true,
      });
      $(".vertical").slick({
        dots: true,
        vertical: true,
        slidesToShow: 3,
        slidesToScroll: 3
      });
      $(".regular").slick({
        dots: true,
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 3
      });
      $(".center").slick({
        dots: true,
        infinite: true,
        centerMode: true,
        slidesToShow: 5,
        slidesToScroll: 3
      });
      $(".variable").slick({
        dots: true,
        infinite: true,
        variableWidth: true
      });
      $(".lazy").slick({
        lazyLoad: 'ondemand', // ondemand progressive anticipated
        infinite: true
      });
    });
</script>
</section>
</body>
</html>