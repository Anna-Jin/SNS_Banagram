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
 		<a href="#"><img src="/image/main_full.png" alt="main_icon" class="nav-icon"></a>
 		<button><img src="/image/post.png" alt="main_icon" class="nav-icon create-post-btn"></button>
 		<a href="#"><img src="/image/like-black.png" alt="main_icon" class="nav-icon"></a>
 		<c:if test="${not empty userName}">
 			<a href="#"><img src="/image/user.png" alt="main_icon" class="nav-icon"></a>
 		</c:if>	
 	</div>
</div>


<jsp:include page="../post/post_modal.jsp" />
