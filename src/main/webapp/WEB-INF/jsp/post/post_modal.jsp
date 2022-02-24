<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="modal">
	<div class="modal_content">
		<div class="title">
			<div class="h-100 d-flex justify-content-end align-items-center">
				<div class="title-box">
					<div class="title-font">새 게시물 만들기</div>
				</div>
				<a href="#" class="submit-btn">공유하기</a>
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
						<img alt="profile" src="/images/profile-img1.jpeg"
							class="profile-img">
					</div>
					<div class="d-flex justify-content-between w-100">
						<div>
							<div class="text-style-15-bold">포스팅한 사용자 아이디</div>
						</div>
					</div>
				</div>
				<textarea class="text-content" placeholder="내용을 입력해주세요"></textarea>
			</div>
		</div>
	</div>
</div>


<script>
		$(document).ready(function(e) {
			// 모달창 켜고 끄기
			$(".create-post-btn").on('click', function() {
				$(".modal").fadeIn();
			});
			

			/* $(".modal").on('click', function(e) {
				if (!$(e.target).hasClass('.modal_content')) {
					$(".modal").fadeOut();
				}
			}); */
			
			
			// 파일버튼 클릭하면 파일 추가하고 이름 띄우기
			$('.image-btn').on('click', function() {
				$('#file').click();
			});
			
			$('#file').on('change', function(e) {
				let fileName = e.target.files[0].name;
				
				// 확장자 유효성 확인
				let extension = fileName.split('.');
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
				 
				 $("#fileName").text(fileName);
			});
			
			// 글 내용 포스팅
			$('#save-btn').on('click', function(e) {
				let fileName = e.target.files[0].name;
				if (fileName == '') {
					alert('사진을 업로드해주세요');
					return;
				}
				
				// 파일이 업로드 된 경우, 확장자 체크
				let file = $('#file').val();
				if (file != '') {
					let ext = file.split('.')
				}
			});

			
		});
	</script>