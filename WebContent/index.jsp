<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<%-- <link href="<%=request.getContextPath()%>/css/main.css" rel="stylesheet"> --%>
<link href="<%=request.getContextPath()%>/css/about/index.css" rel="stylesheet">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>SEMI HAIR</title>
<script type="text/javascript">
$(function(){
	
var vid = document.getElementById("bgvid");
var pauseButton = document.querySelector("#polina button");

if (window.matchMedia('(prefers-reduced-motion)').matches) {
    vid.removeAttribute("autoplay");
    vid.pause();
    pauseButton.innerHTML = "Paused";
}

function vidFade() {
  vid.classList.add("stopfade");
}

vid.addEventListener('ended', function()
{
// only functional if "loop" is removed 
vid.pause();
// to capture IE10
vidFade();
}); 


pauseButton.addEventListener("click", function() {
  vid.classList.toggle("stopfade");
  if (vid.paused) {
    vid.play();
    pauseButton.innerHTML = "Pause";
  } else {
    vid.pause();
    pauseButton.innerHTML = "Paused";
  }
})

});

</script>
</head>
<body>
<%@ include file="WEB-INF/view/temp/header1.jsp" %>

<div id="ho">
<img alt="" src="<%=request.getContextPath()%>/img/logo/2.png">
</div>
<video poster="https://s3-us-west-2.amazonaws.com/s.cdpn.io/4273/polina.jpg" id="bgvid" playsinline autoplay muted loop>
  <!-- WCAG general accessibility recommendation is that media such as background video play through only once. Loop turned on for the purposes of illustration; if removed, the end of the video will fade in the same way created by pressing the "Pause" button  -->
<source src="http://thenewcode.com/assets/videos/polina.webm" type="video/webm">
<source src="http://thenewcode.com/assets/videos/polina.mp4" type="video/mp4">
</video>
<div id="polina">
<h1>SemiHair</h1>
<p>filmed by Alexander Wagner 2011
<p><a href="<%=request.getContextPath()%>/about.jsp">our history</a>
<p>SemiHair is the first and original shop of multifunctional hair, through years of research the designer Susanna Gioia has
developed dozens of hair web-site form, original and exclusive, representing an avanguard in this new way of looking at the</p> 
<p>web-site. SemiHair is produced by the designer family "Confezioni Gioia" which includes thirty years experience in the
field of contract manufacturing.</p>
<button id="pause">Pause</button>
</div>

</body>
</html>

