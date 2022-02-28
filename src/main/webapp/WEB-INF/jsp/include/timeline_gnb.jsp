<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
    
<div class="nav-box container d-flex justify-content-between">
	<div class="logo-box col-4">
		<img src="/image/banagram_logo.png" alt="banagram" class="logo">
 	</div>
 	<div class="search-box h-100 d-flex align-items-center col-4">
 		<input type="text" id="search" class="form-control" placeholder="검색">
 	</div>
 	<div class="icon-box">
 		<%-- 타임라인 버튼 --%>
 		<div class="h-100 d-flex align-items-center mr-3">
 			<a href="/timeline"><img src="/image/main_full.png" alt="main_icon" class="nav-icon"></a>
 		</div>
 		<%-- 글쓰기 버튼 --%>
 		<div class="h-100 d-flex align-items-center mr-3">
		<button type="button" class="create-post-btn" data-toggle="modal" data-target=".post-modal">
			<img src="/image/post.png" alt="main_icon" class="nav-icon create-post-btn">
		</button>
		</div>
		<%-- 알림 확인 버튼 --%>
		<div class="h-100 d-flex align-items-center mr-3">
 		<a href="#"><img src="/image/like-off.png" alt="main_icon" class="nav-icon"></a>
 		</div>
 		<%-- 프로필 버튼 --%>
 		<div class="h-100 d-flex align-items-center mr-3">
	 		<c:if test="${not empty userName}">
	 			<c:choose>
	 				<c:when test="${not empty profileImageUrl}">
	 					<%-- 프로필 이미지가 있으면 해당 이미지 띄우기 --%>
	 					<a href="#" tabindex="0" data-bs-toggle="popover" data-trigger="focus" data-popover-content="#a1" data-placement="bottom">
	 						<img src="/image/user.png" alt="main_icon" class="nav-icon">
	 					</a>
	 				</c:when>
	 				<c:otherwise>
						<button class="dropdown-toggle" type="button"
							id="dropdownMenuButton1" data-bs-toggle="dropdown"
							aria-expanded="false">
							<img src="/image/user.png" alt="main_icon" class="nav-icon">
						</button>
						<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
							<li><a class="dropdown-item hr" href="#">프로필</a></li>
							<li><a class="dropdown-item text-danger" href="/user/logout">로그아웃</a></li>
						</ul>
						
	 				</c:otherwise>	
	 			</c:choose>
	 		</c:if>	
 		</div>
 	</div>
</div>


<jsp:include page="../post/post_modal.jsp" />

<script>
	$(document).ready(function() {
		
		// 메뉴의 프로필 이미지 클릭하면 드롭다운 노출
		$(".dropdown-toggle").dropdown();
		
	});
</script>