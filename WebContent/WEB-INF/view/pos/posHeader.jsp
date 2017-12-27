<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
$(function(){
$("#totalbtn").click(function(){
	$.get("./posTotal.pos?store=${store}",function(total){
		$("#total").html(total);
	});
});
});
</script>
<div id="total"></div><input type="button" id="totalbtn" value="total">
<a href="./posList.pos?store=${store}">poslist</a>
<a href="./posbook.pos?store=${store}">예약목록</a>
<a href="./posIndex.pos?store=${store}">posInsert</a>
