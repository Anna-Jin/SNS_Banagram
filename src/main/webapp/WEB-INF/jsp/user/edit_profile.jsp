<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<div id="edit-profile-view" class="bg-danger">
		<div id="edit-profile">
			<%-- 프로필 사진 변경 --%>
			<div class="d-flex align-items-center">
				<div>
					<c:choose>
						<c:when test="${not empty profile.user.profileImageUrl}">
							<img alt="profile" src="${profile.user.profileImageUrl}" width="40">
						</c:when>
						<c:otherwise>
							<img alt="profile" src="/image/user.png" width="40">
						</c:otherwise>
					</c:choose>
				</div>
				<div>
					<div>${profile.user.loginId}</div>
					<button type="button" class="text-primary">프로필 사진 바꾸기</button>
				</div>
			</div>
			<%-- 유저 이름 변경 (name) --%>
			<div class="d-flex align-items-center">
				<label for="name">이름</label>
				<input type="text" id="name" name="name" class="form-control" value="${profile.user.name}">
			</div>
			<%-- 유저 아이디 변경 (loginId) --%>
			<div class="d-flex align-items-center">
				<label for="loginId">사용자 이름</label>
				<input type="text" id="loginId" name="loginId" class="form-control" value="${profile.user.loginId}">
			</div>
			<%-- 자기소개 변경 (introduce) --%>
			<div class="d-flex align-items-center">
				<label for="introduce"div>소개</label>
				<c:choose>
					<c:when test="${not empty profile.user.introduce}">
						<textarea>${profile.user.introduce}</textarea>
					</c:when>
					<c:otherwise>
						<textarea id="introduce" name="introduce" class="form-control" placeholder="소개글을 입력해주세요."></textarea>
					</c:otherwise>
				</c:choose>
			</div>
			<%-- 이메일 변경 (email) --%>
			<div class="d-flex align-items-center">
				<label for="email">이메일</label>
				<input type="text" id="email" name="email" class="form-control" value="${profile.user.email}">
			</div>
			<%-- 제출 버튼 --%>
			<button type="button" class="btn btn-primary" id="edit-profile-btn">제출</button>
		</div>
	</div>