<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<div class="sign-up-box d-flex justify-content-center mb-4">
	<div class="sign-up d-flex flex-column justify-content-around mt-3">
		<div class="d-flex justify-content-center">	
			<img alt="banagram" src="/images/banagram_logo.png" class="mt-3">
		</div>
		<div>
			<div>	
			<input type="text" id="email" class="form-control area registration-input-style mb-2" placeholder="이메일 주소">
			</div>
			<div>
			<input type="text" id="name" class="form-control area registration-input-style mb-2" placeholder="성명">
			</div>
			<div>
			<input type="text" id="id" class="form-control area registration-input-style mb-2" placeholder="사용자 이름">
			</div>
			<div>
			<input type="password" id="password" class="form-control area registration-input-style" placeholder="비밀번호">
			</div>
		</div>
		<div>	
			<button type="button" class="btn registration-btn btn-block mb-3" disabled>가입</button>
		</div>	
	</div>
</div>

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