<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<div id="edit-profile-view" class="bg-danger">
	<div id="edit-profile">
		<div>
			<c:choose>
				<c:when test="${not empty user.profileImageUrl}">
					<img alt="profile" src="${user.profileImageUrl}" width="40">
				</c:when>
				<c:otherwise>
					<img alt="profile" src="/image/user.png" width="40">
				</c:otherwise>
			</c:choose>
		</div>
		<div>
			<div>${user.loginId}</div>
			<button type="button" class="text-primary">프로필 사진 바꾸기</button>
		</div>
	</div>
</div>