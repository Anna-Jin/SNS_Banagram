<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<form id="signUpForm" method="post" action="/user/signup">
	<div class="sign-up-box d-flex justify-content-center mb-4">
		<div class="sign-up d-flex flex-column justify-content-around mt-3">
			<div class="d-flex justify-content-center">	
				<img alt="banagram" src="/image/banagram_logo.png" class="mt-3">
			</div>
			<div>
				<div class="d-flex align-items-center">	
					<input type="text" id="email" name="email" class="form-control email-area registration-input-style mb-2" placeholder="이메일 주소">
					<!-- <button type="button" id="duplication-chk-btn" class="btn mb-2 ml-2">중복확인</button> -->
				</div>
				<div>
					<input type="text" id="name" name="name" class="form-control name-area registration-input-style mb-2" placeholder="성명">
				</div>
				<div>
					<input type="text" id="id" name="loginId" class="form-control loginId-area registration-input-style mb-2" placeholder="사용자 이름">
				</div>
				<div>
					<input type="password" id="password" name="password" class="form-control password-area registration-input-style" placeholder="비밀번호">
				</div>
			</div>
			<div>	
				<button type="submit" class="btn registration-btn btn-block mb-3">가입</button>
			</div>	
		</div>
	</div>
</form>

<div>
	<div class="login-btn-box mb-4">
		<div class="h-100 d-flex justify-content-center align-items-center">
			<div class="login-btn">
				<span>계정이 있으신가요?</span>
				<a href="/user/login-view">로그인</a>
			</div>
		</div>	
	</div>
</div>


<script>
$(document).ready(function(e) {
	
	// email 창 외의 부분을 클릭했을 때, 중복확인	
	$('body').on('click', function(e) {
		if (!$(e.target).hasClass('email-area')) {
			
			let email = $('#email').val().trim();
			
			if (!email.includes('@')) {
				$('#email').removeClass('check');
				$('#email').addClass('cross');
				return;
			};
			
			$.ajax({ // addClass가 input값이 변경되야 실행되는 에러 수정하기
				url: "/user/duplicate-email"
				, data: {"email":email}
				, success: function(data) {
					if (data.result) {
			 			// 중복인 경우 -> 이미 사용 중인 아이디
			 			$('#email').removeClass('check');
						$('#email').addClass('cross');
			 		
					} else if (data.result == false) {
						// 아닌 경우 -> 사용 가능한 아이디
						$('#email').removeClass('cross');
						$('#email').addClass('check');
					}
				}
				, error: function(e) {
					alert("이메일 중복 확인에 실패했습니다. 관리자에게 문의해주세요.")
				}
					
			});
		};
	}); 
	
	// loginId 창 외의 부분을 클릭했을 때, 중복확인
	$('body').on('click', function(e) {
		if (!$(e.target).hasClass('loginId-area')) {
			
			let loginId = $('#id').val().trim();
			
			if (loginId == '') {
				$('#id').removeClass('check');
				$('#id').addClass('cross');
				return;
			}
		
			$.ajax({ 
				url: "/user/duplicate-loginId"
				, data: {"loginId":loginId}
				, success: function(data) {
					if (data.result) {
				 		// 중복인 경우 -> 이미 사용 중인 아이디
						$('#id').addClass('cross');
						} else if (data.result == false) {
						// 아닌 경우 -> 사용 가능한 아이디
							$('#id').addClass('check');
					}
				}
				, error: function(e) {
					alert("아이디 중복 확인에 실패했습니다. 관리자에게 문의해주세요.")
				}
					
			});
		}
	}); 
	
	// name에 key가 입력되면 check 클래스를 추가하고
	// name이 비었다면 cross 클래스 추가
	$('#name').keyup(function() {
		$('#name').addClass('check');
		
		if ($('#name').val() == '') {
			$('#name').removeClass('check');
			return;
		}
	});
	
	// id에 key가 입력되면 check 클래스를 추가하고
	// id가 비었다면 cross 클래스 추가
	$('#id').keyup(function() {
		$('#id').removeClass('cross');
		$('#id').addClass('check');
		
		if ($('#id').val() == '') {
			$('#id').removeClass('check');
			$('#id').addClass('cross');
			return;
		}
	});
	
	// password에 key가 입력되면 check 클래스를 추가하고
	// password가 비었다면 cross 클래스 추가
	$('#password').keyup(function() {
		$('#password').addClass('check');
		
		if ($('#password').val() == '') {
			$('#password').removeClass('check');
			return;
		}
	});
	
	
	
	// 회원가입 버튼 클릭
	$('#signUpForm').on('submit', function(e) {
		e.preventDefault(); // submit 중단
		
		// validation check
		let email = $('#email').val().trim();
		if (email == '') {
			alert("이메일을 입력해주세요");
			return false;
		}
		
		if ($('#email').hasClass('cross')) {
			alert("잘못된 이메일입니다.")
			return false;
		}
		
		let name = $('#name').val().trim();
		if (name == '') {
			alert("이름을 입력해주세요");
			return false;
		}
		
		if ($('#name').hasClass('cross')) {
			return false;
		}
		
		let loginId = $('#id').val().trim();
		if (loginId == '') {
			alert("사용자 이름을 입력해주세요");
			return false;
		}
		
		if ($('#id').hasClass('cross')) {
			return false;
		}
		
		let password = $('#password').val();
		if (password == '') {
			alert("비밀번호를 입력해주세요");
			return false;
		}
		
		if ($('#password').hasClass('cross')) {
			return false;
		}
		
		
		// AJAX로 보내기 
		let url = $(this).attr('action');
		
		let params = $(this).serialize();
		
		$.post(url, params)
		.done(function(data) {
			if (data.result == 'success') {
				alert("가입을 환영합니다. 로그인을 해주세요");
				location.href = "/user/login-view";
			} else {
				alert("회원가입에 실패했습니다. 다시 시도해주세요.")
			}
		});
	});
});

</script>