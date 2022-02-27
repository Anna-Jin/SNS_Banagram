<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<div class="modal fade del-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content del-modal-content">
			<div class="h-100 d-flex flex-column align-items-center">
				<div id="del-box" class="h-50 w-100 d-flex align-items-center justify-content-center">
					<button type="button" id="del-btn" class="del-box w-100 h-100 del-font-style text-danger">
						삭제하기
					</button>
				</div>
				<div class="h-50 w-100 d-flex align-items-center">
					<button type="button" class="del-box w-100 h-100 cancel-btn del-font-style">
						취소
					</button>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
$(document).ready(function() {
	// 취소 버튼 누르면 모달창 닫기
	$('.cancel-btn').on('click', function(e) {
		$('.modal').modal('hide');
	});
	
	$('#del-btn').on('click', function() {
		
	});
	
});
</script>
