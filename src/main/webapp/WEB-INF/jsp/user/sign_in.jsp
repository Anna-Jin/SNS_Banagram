<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div>
	<div>
		<div class="login-box d-flex justify-content-center mb-4">
			<div class="login d-flex flex-column justify-content-around mt-3">
				<div class="d-flex justify-content-center">	
					<img alt="banagram" src="/images/banagram_logo.png" class="mt-3">
				</div>
				<div>	
					<input type="text" class="form-control registration-input-style mb-2" placeholder="사용자 이름 또는 이메일 주소">
					<input type="password" class="form-control registration-input-style" placeholder="비밀번호">
				</div>
				<div>	
					<button type="button" class="btn registration-btn btn-block mb-3">로그인</button>
				</div>	
			</div>
		</div>
	</div>
	<div>
		<div class="signup-btn-box mb-4">
			<div class="h-100 d-flex justify-content-center align-items-center">
				<div class="signup-btn">
					<span class="">계정이 없으신가요?</span>
					<a href="/user/signup">가입하기</a>
				</div>
			</div>	
		</div>
	</div>
</div>