<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>About</title>
<link href="<%=request.getContextPath()%>/css/about/about.css" rel="stylesheet">
<!-- ================== TOP ==================== -->
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script type="text/javascript">
        $(document).ready(function(){
            $(window).scroll(function(){
                if($(this).scrollTop()>0){
                    $('.top').fadeIn();
                } else {
                    $('.top').fadeOut();
                }
            });
            
            $('.top').click(function(){
                $('html,body').animate({scrollTop:0},450);
                return false;                
            });
        });
</script> 
<!-- ================== TOP ==================== -->
</head>
<body>
<%@ include file="WEB-INF/view/temp/header.jsp" %>
<section>
<div id="content">
<div id="company">
<p>COMPANY</p>
</div>
<div id="eng">
<P class="eng">SEMIHAIRSHOP Korea has a workforce of 250 professionals specialized 
in hair services who serve global-minded clients in Korea and across the</p> 
<p class="eng"> world in China, Japan, Southeast Asia, South America, and Europe. 
Learn about the philosophy, corporate identity, and leadership that drive </p>
<p class="eng">our unparalleled integrated hair business marketing solutions below.</P>
<br>
<br>
<br>
<P class="kor">세미헤어샵 코리아는 2017년 현재 총 250여 명의 헤어 전문가로 구성되어 있으며, 
한국을 비롯해 중국, 일본, 동남아, 남미, 유럽 등 글로벌 각국의 고객을 위해 일하고 있습니다.</p> 
<p class="kor">성공적인 비즈니스를 위한 ‘통합 헤어 마케팅 솔루션’을 제공하는 우리의 철학, CI, 그리고 리더십을 소개합니다.</P>
</div>
</div>

<section class="head" id="gold">
<p><a href="">for your <br> sustainable <br> growth</a></p>
</section>
<div id="text">
<p>세미헤어샵은 업계 리더로써 
<br>차별화된 퀄리티의 헤어샵을 제공하며,
<br>헤어컨텐츠 산업의 발전에 앞장섭니다.</p>
</div>
<div id="img">
</div>
</section>
<a href="#" class="top">TOP</a>
<%@ include file="WEB-INF/view/temp/footer.jsp" %>
</body>
</html>

























