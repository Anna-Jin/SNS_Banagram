<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="profile-view">
	<div id="profile-header" class="d-flex justify-content-center">
		<div class="d-flex justify-content-center w-100">
			<%-- 프로필 이미지 --%>
			<div class="col-5 d-flex justify-content-center align-items-center">
				<c:choose>
					<c:when test="${not empty profile.user.profileImageUrl}">
						<img alt="profile" src="${profile.user.profileImageUrl}"
							class="profile-header-img">
					</c:when>
					<c:otherwise>
						<img alt="profile" src="/image/user.png" class="profile-header-img">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="col-7 p-0 d-flex flex-column justify-content-center">
				<%-- 프로필 id와 프로필 편집 --%>
				<div id="profile-header-id" class="d-flex mb-3">
					<div class="d-flex align-items-center">
						<div class="profile-header-id mr-4">${profile.user.loginId}</div>
						<c:choose>
							<c:when test="${profile.user.id eq userId}">
								<div>
									<a href="/user/profile/edit" type="button" class="profile-header-edit-btn">프로필 편집</a>
								</div>
							</c:when>
							<c:otherwise>
								<div>
									<button type="button" class="follow-btn btn btn-primary" data-follow-user-id="${profile.user.id}">팔로우</button>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

				<%-- 게시물수, 팔로워, 팔로잉 --%>
				<div id="profile-header-count" class="d-flex align-items-center mb-3">
					<div class="d-flex align-items-center mr-3">
						<div class="mr-2">게시물</div>
						<div class="font-weight-bold">${profile.countPost}</div>
					</div>
					<div class="d-flex align-items-center mr-3">
						<div class="mr-2">팔로워</div>
						<div class="font-weight-bold">${profile.countFollower}</div>
					</div>
					<div class="d-flex align-items-center">
						<div class="mr-2">팔로잉</div>
						<div class="font-weight-bold">${profile.countFollow}</div>
					</div>
				</div>

				<%-- 자기소개 --%>
				<div id="profile-header-intro" class="d-flex flex-column justify-content-center">
					<div>
						<div class="font-weight-bold">${profile.user.name}</div>
					</div>
					<div>
						<c:choose>
							<c:when test="${not empty profile.user.introduce}">
								<div>${profile.user.introduce}</div>
							</c:when>
							<c:otherwise>
								<div>소개글을 입력해주세요</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div id="profile-nav" class="d-flex justify-content-center">
		<div id="profile-nav-content" class="d-flex align-items-center">
			<img src="/image/chess-board.png" width="10">
			<div class="ml-2">게시물</div>
		</div>
	</div>
	<div id="profile-body" class="d-flex flex-wrap justify-content-between">
		<%-- 게시물 개수만큼 반복 --%>
		<c:forEach items="${profile.postList}" var="post">
		<div>
			<img class="profile-body-content" src="${post.imagePath}" width="292">
		</div>
		</c:forEach>
	</div>
</div>

<script>
 $(document).ready(function() {
	 
	 // 팔로우
	 $('.follow-btn').on('click', function() {
		 let followUserId = $(this).data('follow-user-id');
		 
		 $.ajax({
			url: "/follow"
			, data: {"followUserId": followUserId}
		 	, success: function(data) {
		 		if (data.result == 'success') {
		 			location.reload(true);
		 		} else {
		 			alert(data.errorMessage);
		 		}
		 	}
		 });
	 });
	 
 });
</script>