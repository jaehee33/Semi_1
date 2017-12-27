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

<title>Index</title>
</head>
<body>
<%@ include file="WEB-INF/view/temp/header.jsp" %>
<section id="main">

<%-- <div class="container">

  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">

      <div class="item active">
        <img src="<%=request.getContextPath()%>/img/about/1200x700.jpg" alt="Los Angeles" style="width:100%;">
        <div class="carousel-caption">
          <h3>Los Angeles</h3>
          <p>LA is always so much fun!</p>
        </div>
      </div>

      <div class="item">
        <img src="<%=request.getContextPath()%>/img/about/1200x7002.jpg" alt="Chicago" style="width:100%;">
        <div class="carousel-caption">
          <h3>Chicago</h3>
          <p>Thank you, Chicago!</p>
        </div>
      </div>
    
      <div class="item">
        <img src="<%=request.getContextPath()%>/img/about/1200x7003.jpg" alt="New York" style="width:100%;">
        <div class="carousel-caption">
          <h3>New York</h3>
          <p>We love the Big Apple!</p>
        </div>
      </div>
  
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div> --%>	

<div id="sale">
<br>
<br>
<p>Book your hairshop and get your coupon for an extra sale at checkout!!!</p>
<br>
<p><strong>10%OFF</strong>:from $193 to $399</p>
<p>Using code <strong>XMAS10</strong></p>
<br>
<p><strong>20%OFF</strong>:from $193 to $399</p>
<p>Using code <strong>XMAS20</strong></p>
<br>
<p><strong>30%OFF</strong>:from $193 to $399</p>
<p>Using code <strong>XMAS30</strong></p>
<br>
<p><strong>40%OFF</strong>:from $193 to $399</p>
<p>Using code <strong>XMAS40</strong></p>
<br>
<br>
</div>

<div id="ment">
<h2>SemiHair</h2>
<br>
<br>
<p>SemiHair is the first and original shop of multifunctional hair, through years of research the designer Susanna Gioia has</p>
<p>developed dozens of hair web-site form, original and exclusive, representing an avanguard in this new way of looking at the</p> 
<p>web-site. SemiHair is produced by the designer family "Confezioni Gioia" which includes thirty years experience in the </p>
<p>field of contract manufacturing.</p>
</div>

</section>
<%@ include file="WEB-INF/view/temp/footer.jsp" %>
</body>
</html>