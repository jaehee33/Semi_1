<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="<%=request.getContextPath()%>/css/dd.css" rel="stylesheet">
<title>Insert title here</title>
<script type="text/javascript">
$(function(){
//<!-- =====================마이페이지============================= -->
	$(".hover").mouseleave(
			  function () {
			    $(this).removeClass("hover");
			  }
			);
//<!-- =====================마이페이지============================= -->
//<!-- =====================버블버블============================= -->
function initparticles() {
	   bubbles();
	   hearts();
	   lines();
	   confetti();
	   fire();
	   sunbeams();
	}

	/*The measurements are ... whack (so to say), for more general text usage I would generate different sized particles for the size of text; consider this pen a POC*/

	function bubbles() {
	   $.each($(".particletext.bubbles"), function(){
	      var bubblecount = ($(this).width()/50)*10;
	      for(var i = 0; i <= bubblecount; i++) {
	         var size = ($.rnd(40,80)/10);
	         $(this).append('<span class="particle" style="top:' + $.rnd(20,80) + '%; left:' + $.rnd(0,95) + '%;width:' + size + 'px; height:' + size + 'px;animation-delay: ' + ($.rnd(0,30)/10) + 's;"></span>');
	      }
	   });
	}

	function hearts() {
	   $.each($(".particletext.hearts"), function(){
	      var heartcount = ($(this).width()/50)*5;
	      for(var i = 0; i <= heartcount; i++) {
	         var size = ($.rnd(60,120)/10);
	         $(this).append('<span class="particle" style="top:' + $.rnd(20,80) + '%; left:' + $.rnd(0,95) + '%;width:' + size + 'px; height:' + size + 'px;animation-delay: ' + ($.rnd(0,30)/10) + 's;"></span>');
	      }
	   });
	}

	function lines() {
	   $.each($(".particletext.lines"), function(){
	      var linecount = ($(this).width()/50)*10;
	      for(var i = 0; i <= linecount; i++) {
	         $(this).append('<span class="particle" style="top:' + $.rnd(-30,30) + '%; left:' + $.rnd(-10,110) + '%;width:' + $.rnd(1,3) + 'px; height:' + $.rnd(20,80) + '%;animation-delay: -' + ($.rnd(0,30)/10) + 's;"></span>');
	      }
	   });
	}

	function confetti() {
	   $.each($(".particletext.confetti"), function(){
	      var confetticount = ($(this).width()/50)*10;
	      for(var i = 0; i <= confetticount; i++) {
	         $(this).append('<span class="particle c' + $.rnd(1,2) + '" style="top:' + $.rnd(10,50) + '%; left:' + $.rnd(0,100) + '%;width:' + $.rnd(6,8) + 'px; height:' + $.rnd(3,4) + 'px;animation-delay: ' + ($.rnd(0,30)/10) + 's;"></span>');
	      }
	   });
	}

	function fire() {
	   $.each($(".particletext.fire"), function(){
	      var firecount = ($(this).width()/50)*20;
	      for(var i = 0; i <= firecount; i++) {
	         var size = $.rnd(8,12);
	         $(this).append('<span class="particle" style="top:' + $.rnd(40,70) + '%; left:' + $.rnd(-10,100) + '%;width:' + size + 'px; height:' + size + 'px;animation-delay: ' + ($.rnd(0,20)/10) + 's;"></span>');
	      }
	   });
	}

	function sunbeams() {
	   $.each($(".particletext.sunbeams"), function(){
	      var linecount = ($(this).width()/50)*10;
	      for(var i = 0; i <= linecount; i++) {
	         $(this).append('<span class="particle" style="top:' + $.rnd(-50,00) + '%; left:' + $.rnd(0,100) + '%;width:' + $.rnd(1,3) + 'px; height:' + $.rnd(80,160) + '%;animation-delay: -' + ($.rnd(0,30)/10) + 's;"></span>');
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
//<!-- =====================버블버블============================= -->
</script>
<!-- =====================마이페이지============================= -->
<figure class="snip1432">
  <img src="https://s3-us-west-2.amazonaws.com/s.cdpn.io/331810/sample45.jpg" alt="sample36" />
  <figcaption>
    <div>
      <h3>In teaching others</h3>
      <h3>We teach ourselves</h3>
    </div>
    <div>
      <h2>Ingredia Nutrisha</h2>
    </div>
  </figcaption>
  <a href="#"></a>
</figure>
<!-- =====================마이페이지============================= -->
<!-- =====================어바웃============================= -->
<section class="head">
		<a href="" data-bf="10 Stunning" data-af="with scss">for your <br> sustainable <br> growth</a>
	</section>
<!-- =====================어바웃============================= -->
<!-- =====================버블버블============================= -->
<div class="textcontainer">
   <span class="particletext bubbles">Bubbles</span>
</div>

<div class="textcontainer">
   <span class="particletext confetti">Confetti</span>
</div>

<div class="textcontainer">
   <span class="particletext hearts">Hearts</span>
</div>

<div class="textcontainer">
   <span class="particletext fire">Fire</span>
</div>


<div class="textcontainer">
   <span class="particletext lines">Lines</span>
</div>
<!-- =====================버블버블============================= -->

</body>
</html>