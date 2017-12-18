<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html><script type="text/javascript">
	
	$(function() {
		// star rating
		var starRating = function(){
		  var $star = $(".star-input"),
		      $result = $star.find("output>b");
		  $(document)
		    .on("focusin", ".star-input>.input", function(){
		    $(this).addClass("focus");
		  })
		    .on("focusout", ".star-input>.input", function(){
		    var $this = $(this);
		    setTimeout(function(){
		      if($this.find(":focus").length === 0){
		        $this.removeClass("focus");
		      }
		    }, 100);
		  })
		    .on("change", ".star-input :radio", function(){
		    $result.text($(this).next().text());
		  })
		    .on("mouseover", ".star-input label", function(){
		    $result.text($(this).text());
		  })
		    .on("mouseleave", ".star-input>.input", function(){
		    var $checked = $star.find(":checked");
		    if($checked.length === 0){
		      $result.text("0");
		    } else {
		      $result.text($checked.next().text());
		    }
		  });
		};
		starRating();
	

		
	});
</script>


<form action="./scoreWrite.score" method="post">
				<p>ID : ${member.id} <input type="hidden" name="id" value="${member.id}"></p>
				<span class="star-input"> <span class="input">
							<input type="radio" name="star-input" id="p1" value="0.5"><label
							for="p1">0.5</label> <input type="radio" name="star-input"
							id="p2" value="1.0"><label for="p2">1.0</label> <input
							type="radio" name="star-input" id="p3" value="1.5"><label
							for="p3">1.5</label> <input type="radio" name="star-input"
							id="p4" value="2.0"><label for="p4">2.0</label> <input
							type="radio" name="star-input" id="p5" value="2.5"><label
							for="p5">2.5</label> <input type="radio" name="star-input"
							id="p6" value="3.0"><label for="p6">3.0</label> <input
							type="radio" name="star-input" id="p7" value="3.5"><label
							for="p7">3.5</label> <input type="radio" name="star-input"
							id="p8" value="4.0"><label for="p8">4.0</label> <input
							type="radio" name="star-input" id="p9" value="4.5"><label
							for="p9">4.5</label> <input type="radio" name="star-input"
							id="p10" value="5.0"><label for="p10">5.0</label>
					</span> <output for="star-input">
							<b>0</b>점
						</output>
				</span>

				<textarea rows="" cols="" name="contents">${view.contents}</textarea>
				<c:if test="${not empty member}">
						<button id="btn">Submit</button>
					</c:if>
		</form>