<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%-- 글을 쓴 사용자와 로그인 사용자가 일치할 때만 삭제 가능 --%>    
	<div class="modal fade del-modal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content del-modal-content">
				<div class="h-100 d-flex flex-column align-items-center">
					<div id="del-box" class="h-50 w-100 d-flex align-items-center justify-content-center">
						<button type="button" class="del-post del-box w-100 h-100 d-block del-font-style text-danger">
							삭제하기
						</button>
					</div>
					<div class="h-50 w-100 d-flex align-items-center">
						<button type="button" class="del-box w-100 h-100 d-block cancel-btn del-font-style">
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
	
	// 모달창 안에 있는 삭제하기 버튼 클릭
	$('.del-modal .del-post').on('click', function() {
		// 주입한 postId 가져오기
		let postId = $('.del-modal').data('post-id');
		
		// 삭제 AJAX
		$.ajax({
			type: "DELETE"
			, url: "/post/delete"
			, data: {"postId": postId}
			, success: function(data) {
				if (data.result == 'success') {
					location.reload(); // 새로고침
				}
			}
			, error: function(e) {
				if (data.result == 'error') {
					alert(errorMessage);
				}
			}
		});
	});
	
});
</script>
