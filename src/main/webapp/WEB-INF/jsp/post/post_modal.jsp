<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="modal fade post-modal">
  <div class="modal-dialog modal-lg modal-dialog-centered">
	<div class="modal-content post-modal-content">
		<div class="title">
			<div class="h-100 d-flex justify-content-end align-items-center">
				<div class="title-box d-flex justify-content-center">
					<div class="title-font">새 게시물 만들기</div>
				</div>
				<button type="button" class="submit-btn">공유하기</button>
			</div>
		</div>
		<div class="creat-content-box d-flex">
			<%-- 사진 업로드 버튼 --%>
			<div class="col-8 d-flex flex-column justify-content-center align-items-center">
				<button type="button" id="save-btn" class="image-btn">사진 업로드</button>
				<input type="file" id="file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
				<div id="fileName"></div>
			</div>
			

			<%-- 글쓰기 화면 --%>
			<div class="col-4 p-3">
				<div class="post-box d-flex align-items-center mb-4">
					<div class="profile-img-box">
						<c:choose>
							<c:when test="${not empty user.profileImageUrl}">
								<img alt="profile" src="/image/profile-img1.jpeg" class="profile-img">
							</c:when>
							<c:otherwise>
								<img alt="profile" src="/image/user.png" class="profile-img">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="ml-3 d-flex justify-content-between">
						<div>
							<div class="text-style-15-bold">${userLoginId}</div>
						</div>
					</div>
				</div>
				<textarea class="text-content" placeholder="내용을 입력해주세요"></textarea>
			</div>
		</div>
	</div>
 </div>
</div>


<script>
		$(document).ready(function(e) {

			
			// 파일버튼 클릭하면 파일 추가하고 이름 띄우기
			$('.image-btn').on('click', function() {
				$('#file').click();
			});
			
			$('#file').on('change', function(e) {
				let file = e.target.files[0].name;
				
				
				// 확장자 유효성 확인
				let extension = file.split('.');
				if (extension.length < 2 || 
				 	(extension[extension.length - 1] != 'gif' 
				 	&& extension[extension.length - 1] != 'png' 
				 	&& extension[extension.length - 1] != 'jpg'
				 	&& extension[extension.length - 1] != 'jpeg')) {
				 	
				 	alert("이미지 파일만 업로드 할 수 있습니다.");
				 	$(this).val(""); // 이미 올라간 것을 확인한 것이기 때문에 비워주어야 한다.
				 	$('#fileName').text(''); // 파일 이름도 비운다.
				 	return;
				 }
				 
				 $("#fileName").text(file);
			});
			
			// 글 내용 포스팅
			$('.submit-btn').on('click', function(e) {
				
				
				let file = $('#file').val();
				// 파일 업로드 유효성 체크
				if (file == '') {
					alert('사진을 업로드해주세요');
					return;
				}
				
				let fileName = $('#fileName').val();
				// 파일이 업로드 된 경우, 확장자 체크
				if (fileName != '') {
					let ext = file.split('.').pop().toLowerCase();
					if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
						alert('jpg, jpeg, png, gif 파일만 업로드 할 수 있습니다.');
						$('#file').val(''); // 파일을 비운다
						return;
					}
				}
				
			//file은 무조건 form형태로 보내야한다.
			let formData = new FormData();
			formData.append("file", $('#file')[0].files[0]);
			formData.append("content", $('.text-content').val());
			
			$.ajax({
				type: "POST"
				, url: "/post/write"
				, data: formData
				, enctype: "multipart/form-data"   	// 파일 업로드를 위한 필수 설정
				, processData: false   				// 파일 업로드를 위한 필수 설정
				, contentType: "application/x-www-form-urlencoded; charset=UTF-8"
				, success: function(data) {
					if (data.result == 'success') {
						location.href = "/timeline"
					} else {
						alert(data.errorMessage);
					}
				}
				, error: function(e) {
					alert("메모 저장에 실패했습니다. 관리자에게 문의해주세요.");
				}
			});
			});
			
			
		});
	</script>