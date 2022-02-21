<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<form id="signUpForm" method="post" action="/user/signup">
	<div class="sign-up-box d-flex justify-content-center mb-4">
		<div class="sign-up d-flex flex-column justify-content-around mt-3">
			<div class="d-flex justify-content-center">	
				<img alt="banagram" src="/images/banagram_logo.png" class="mt-3">
			</div>
			<div>
				<div>	
				<input type="text" id="email" name="email" class="form-control area registration-input-style mb-2" placeholder="이메일 주소">
				</div>
				<div>
				<input type="text" id="name" name="name" class="form-control area registration-input-style mb-2" placeholder="성명">
				</div>
				<div>
				<input type="text" id="id" name="loginId" class="form-control area registration-input-style mb-2" placeholder="사용자 이름">
				</div>
				<div>
				<input type="password" id="password" name="password" class="form-control area registration-input-style" placeholder="비밀번호">
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
				<a href="/user/signin">로그인</a>
			</div>
		</div>	
	</div>
</div>


<script>
$(document).ready(function(e) {
	// mark-up
	
	// area 클래스를 가진 input 태그를 제외한 부분을 클릭하면 이벤트 발 	
	$('html').on('click', function(e) {
		if (!$(e.target).hasClass('area')) {
			
		};
	});
	
	// email에 key가 입력되면 check 클래스를 추가하고
	// email이 비었다면 cross 클래스 추가
	$('#email').keyup(function() {
		$(this).removeClass('cross');
		$(this).addClass('check');
		
		if ($(this).val() == '') {
			$(this).removeClass('check');
			$(this).addClass('cross');
			return;
		}
		
		// 이메일의 도메인 주소에서 . 뒤에 두글자 이상이면 check 클래스 추가
		if ($(this).val().split('@')[1].split('.')[1].length < 2) {
			$(this).removeClass('check');
			$(this).addClass('cross');
			return;
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
	
	
	$('#signUpForm').on('submit', function(e) {
	e.preventDefault(); // submit 중단
		
		// validation check
		let loginId = $('#id').val().trim();
		if (loginId == '') {
			alert("아이디를 입력해주세요");
			return false;
		}
		
		let password = $('#password').val();
		if (password == '') {
			alert("비밀번호를 입력해주세요");
			return false;
		}
		
		let name = $('#name').val().trim();
		if (name == '') {
			alert("이름을 입력해주세요");
			return false;
		}
		
		let email = $('#email').val().trim();
		if (email == '') {
			alert("이메일을 입력해주세요");
			return false;
		}
		
	});
});

</script>