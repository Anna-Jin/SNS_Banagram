<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="edit-profile-view">
	<div id="edit-profile">
		<div id="edit-profile-box">
			<%-- 프로필 사진 변경 --%>
			<div class="d-flex align-items-center">
				<div>
					<div class="edit-profile-img">
						<c:choose>
							<c:when test="${not empty profile.user.profileImageUrl}">
								<img id="profile-img" alt="profile" src="${profile.user.profileImageUrl}"
									width="50">
							</c:when>
							<c:otherwise>
								<img id="profile-img" alt="profile" src="/image/user.png" width="50">
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div>
					<div class="font-size-20">${profile.user.loginId}</div>
					<div>
						<button type="button" id="edit-profile-img-btn" class="font-size-14 text-primary">프로필 사진 바꾸기</button>
						<input type="file" id="profile-file" class="d-none" accept=".gif, .jpg, .png, .jpeg">
					</div>
				</div>
			</div>
			<div class="d-flex flex-column justify-content-around h-75">
				<%-- 유저 이름 변경 (name) --%>
				<div class="d-flex align-items-center">
					<label for="name" class="col-4 mr-2 font-weight-bold">이름</label> <input
						type="text" id="name" name="name" class="form-control"
						value="${profile.user.name}">
				</div>
				<%-- 유저 아이디 변경 (loginId) --%>
				<div class="d-flex align-items-center">
					<label for="loginId" class="col-4 mr-2 font-weight-bold">사용자
						이름</label> <input type="text" id="loginId" name="loginId"
						class="form-control" value="${profile.user.loginId}">
				</div>
				<%-- 자기소개 변경 (introduce) --%>
				<div class="d-flex align-items-center">
					<label for="introduce" class="col-4 mr-2 font-weight-bold">소개</label>
					<textarea id="introduce" name="introduce" class="form-control"
						placeholder="소개글을 입력해주세요.">${profile.user.introduce}</textarea>
				</div>
				<%-- 이메일 변경 (email) --%>
				<div class="d-flex align-items-center">
					<label for="email" class="col-4 mr-2 font-weight-bold">이메일</label>
					<input type="text" id="email" name="email" class="form-control"
						value="${profile.user.email}">
				</div>
				<%-- 제출 버튼 --%>
				<div class="ml-3">
					<button type="button" class="btn btn-primary" id="edit-profile-btn">제출</button>
				</div>
			</div>
		</div>
	</div>
</div>


<script>
$(document).ready(function() {
	// 프로필 사진 바꾸기 버튼 클릭
	$('#edit-profile-img-btn').on('click', function() {
		$('#profile-file').click();
	});
	
	$('#profile-file').on('change', function(e) {
		let profileFile = e.target.files[0].name;
		
		// 확장자 유효성 확인
		let extension = profileFile.split('.');
		if (extension.length < 2 || 
		 	(extension[extension.length - 1] != 'gif' 
		 	&& extension[extension.length - 1] != 'png' 
		 	&& extension[extension.length - 1] != 'jpg'
		 	&& extension[extension.length - 1] != 'jpeg')) {
		 	
		 	alert("이미지 파일만 업로드 할 수 있습니다.");
		 	$(this).val(""); // 이미 올라간 것을 확인한 것이기 때문에 비워주어야 한다.
		 	return;
		 }
		
		// 파일 업로드 시 미리보기 이미지를 선택한 이미지로 변경
		setImageFromFile(this, '#profile-img');
		
	});
	
	// 파일 업로드 시 미리보기 이미지를 선택한 이미지로 변경 --> 이거를 위한 함수
	function setImageFromFile(input, expression) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	            $(expression).attr('src', e.target.result);
	        }
	        reader.readAsDataURL(input.files[0]);
	    }
	}
	
	
	// 제출 버튼 클릭하면 유저 정보 수정
	$('#edit-profile-btn').on('click',function() {
		// email, name, loginId 유효성 체크
		let name = $('#name').val().trim();
		if (name == '') {
			alert("이름을 입력해주세요.");
			return;
		}	
		
		let loginId = $('#loginId').val().trim();
		if (loginId == '') {
			alert("사용자 이름을 입력해주세요.");
			return;
		}	
		
		let email = $('#email').val().trim();
		if (email == '') {
			alert("이메일을 입력해주세요.");
			return;
		}
		
		// 파일이 업로드 된 경우, 확장자 체크
		let file = $('#profile-file').val(); // 파일 경로만 가져온다.
		if (file != '') {
			let ext = file.split('.').pop().toLowerCase();  // 파일경로를 .으로 나누고, 확장자가 있는 마지막 문자열을 가져온 후 모두 소문자로 변경			 
			// pop() : stack 자료구조에서 사용하는 함수, 가장 마지막 값을 꺼낸다.
			if ($.inArray(ext, ['jpg', 'jpeg', 'png', 'gif']) == -1) {
				alert('jpg, jpeg, png, gif 파일만 업로드 할 수 있습니다.');
				$('#file').val(''); // 파일을 비운다
				return;
			}
		}
		// 폼태그 객체를 JS에서 만든다. 파일을 업로드하려면 폼태그가 반드시 있어야한다.
		let formData = new FormData();
		
		formData.append('email', email);
		formData.append('name', name);
		formData.append('loginId', loginId);
		formData.append('file', $('#profile-file')[0].files[0]);
		
		let introduce = $('#introduce').val();
		formData.append('introduce', introduce);
		
		// ajax
		$.ajax({
			type: "POST"
			, url: "/user/profile"
			, data: formData
			, enctype: "multipart/form-data" 	// 파일 업로드를 위한 필수 설정
			, processData: false				// 파일 업로드를 위한 필수 설정
			, contentType: false				// 파일 업로드를 위한 필수 설정
			, success: function(data) {
				if (data.result == 'success') {
					location.href = "/user/profile/" + userId
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("프로필 수정에 실패했습니다. 관리자에게 문의하세요.");
			}
		});
	});
});
</script>