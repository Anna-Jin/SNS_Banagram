<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="modal">
	<div class="modal_content" title="클릭하면 창이 닫힙니다.">
		
	</div>
</div>


<script>

$(function(){ 

  $(".create-post-btn").click(function(){
    $(".modal").fadeIn();
  });
  
  $(".modal_content").click(function(){
    $(".modal").fadeOut();
  });
  
});

</script>