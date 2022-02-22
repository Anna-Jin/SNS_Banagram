<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
	<form id="loginForm" method="post" action="/user/login">
		<div class="login-box d-flex justify-content-center mb-4">
			<div class="login d-flex flex-column justify-content-around mt-3">
				<div class="d-flex justify-content-center">	
					<img alt="banagram" src="/images/banagram_logo.png" class="mt-3">
				</div>
				<div class="mt-4">	
					<input type="text" id="loginId" name="loginId" class="form-control registration-input-style mb-2" placeholder="사용자 이름 또는 이메일 주소">
					<input type="password" id="password" name="password" class="form-control registration-input-style" placeholder="비밀번호">
				</div>
				<div class="d-flex justify-content-center">
					<div class="validation-loginId text-danger d-none">사용자 이름을 입력하세요</div>
					<div class="validation-password text-danger d-none">비밀번호를 입력하세요</div>
				</div>	
				<div>	
					<button type="submit" class="btn registration-btn btn-block mb-3">로그인</button>
				</div>
			</div>
		</div>
	</form>
	<div>
		<div class="signup-btn-box mb-4">
			<div class="h-100 d-flex justify-content-center align-items-center">
				<div class="signup-btn">
					<span class="">계정이 없으신가요?</span>
					<a href="/user/signup-view">가입하기</a>
				</div>
			</div>	
		</div>
	</div>
</div>


<script>
$(document).ready(function() {
	$('#loginForm').on('click', function(e) {
		e.preventDefault();
		
		$('.validation-password').addClass('d-none');
		$('.validation-loginId').addClass('d-none');
		
		// validation
		if ($('#loginId').val() == '') {
			$('.validation-password').addClass('d-none');
			$('.validation-loginId').removeClass('d-none');
			return false;
		}
		
		if ($('#password').val() == '') {
			$('.validation-loginId').addClass('d-none');
			$('.validation-password').removeClass('d-none');
			return false;
		}
		
		// AJAX 호출
		let url = $(this).attr('action');
		let params = $(this).serialize();
		
		$.post(url, params)
		.done(function(data) {
			if (data.result == 'success') {
				location.href = "/timeline";
			} else {
				alert(data.errorMessage);
			}
		});
		
	});
});

</script>