<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<section class="content d-flex justify-content-between container">
	<div class="timeline-box">
		<c:forEach items="${contentList}" var="content">
			<div class="post">
				<%-- 포스트 헤더 부분 --%>
				<div class="post-header">
					<%-- 포스트의 프로필사진과 아이디 --%>
					<div class="profile-img-box">
						<%-- 프로필 이미지를 받아와서 프로필 이미지가 없으면 기본 이미지 노출 --%>
						<c:choose>
							<c:when test="${not empty content.user.profileImageUrl}">
								<img alt="profile" src="/image/profile-img1.jpeg" class="profile-img">
							</c:when>
							<c:otherwise>
								<img alt="profile" src="/image/user.png" class="profile-img">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="d-flex justify-content-between w-100">
						<%-- 사용자 아이디 클릭하면 프로필로 이동 --%>
						<div>
							<div class="text-style-15-bold"><a class="userLoginId" href="#">${content.post.userLoginId}</a></div>
						</div>
						<%-- 글 삭제 버튼. 클릭하면 삭제하기 모달 노출 --%>
						<div>
							<button type="button" data-toggle="modal" data-target=".del-modal">
								<i class="fa-lg fa-solid fa-ellipsis mr-1"></i>
							</button>
						</div>
					</div>
				</div>

				<%-- 포스팅한 이미지 --%>
				<div class="image">
					<img alt="post-img" src="${content.post.imagePath}" class="image">
				</div>
				<div class="content-box">
					<%-- 좋아요, 댓글, 태그아이콘 부분 --%>
					<div class="post-icon-box">
						<div class="col-4 p-0">
							<button type="button" class="like-btn" data-post-id="${content.post.id}">
								<img src="/image/like-off.png" class="post-like post-icon-like">
							</button>
							<img src="/image/comment.png" class="post-icon">
						</div>
						<div class="col-4 p-0">
							<div class="d-flex justify-content-center">
								<%-- 이미지 개수에 따라 버튼개수 가감 --%>
								<div class="img-list-btn"></div>
							</div>
						</div>
						<div class="col-4 p-0 d-flex justify-content-end">
							<img src="/image/bookmark.png" class="post-icon">
						</div>
					</div>

					<%-- 포스트 좋아요 개수, 아이디, 글 내용, 댓글 모두보기 --%>
					<div class="post-content">
						<div class="text-style-15-bold mb-2 mt-2">좋아요 14,221개</div>
						<div class="d-flex">
							<div class="text-style-15-bold mr-2 mb-1"><a class="userLoginId" href="#">${content.post.userLoginId}</a></div>
							<div class="context">${content.post.content}</div>
							<div class="d-flex">
								<a type="button" class="more d-none" data-content-id="${content.post.id}">더보기</a>
							</div>
						</div>
						<%-- 댓글 뿌려지는 모습을 확인하기 위해 우선 만들고 나중에 게시글보기 창 완성되면 거기에 추가하기 --%>
						<c:forEach items="${content.commentList}" var="comment">
							<div class="d-flex align-items-cetner">
								<div class="text-style-15-bold mr-2 mb-1">${comment.user.loginId}</div>
								<div>${comment.comment.content}</div>
							</div>
						</c:forEach>
							<div>
								<%-- 댓글이 1개 이상이면 나머지 댓글을 숨기고 댓글 n개 모두보기 버튼 표시 --%>
								<a type="button" id="text-style-14-gray">댓글 n개 모두 보기(구현 중)</a>
							</div>
					</div>

					<%-- 댓글 입력창 --%>
					<div class="post-comment">
						<div class="d-flex align-items-center h-100">
							<img src="/image/comment.png" class="post-icon ml-3">
							<input type="text" id="commentText${content.post.id}" class="comment-input ml-3 mr-3" placeholder="댓글 달기...">
							<button type="button" class="commentBtn btn btn-light" data-post-id="${content.post.id}">게시</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="side-box">
		<div class="profile">
			<div>
				<%-- 프로필 이미지를 받아와서 프로필 이미지가 없으면 기본 이미지 노출 --%>
						<c:choose>
							<c:when test="${not empty content.user.profileImageUrl}">
								<img alt="profile" src="/image/profile-img1.jpeg" class="profile-img-side">
							</c:when>
							<c:otherwise>
								<img alt="profile" src="/image/user.png" class="profile-img-side">
							</c:otherwise>
						</c:choose>
			</div>
			<div class="d-flex justify-content-between w-100">
				<div>
					<div class="text-style-15-bold"><a class="userLoginId" href="#">${userLoginId}</a></div>
				</div>
			</div>
		</div>
		<div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</section>

<jsp:include page="../post/delete_modal.jsp" />


<script>
$(document).ready(function(e) {
	
	// 삭제 모달 노출 버튼
	$('.delete-btn').on('click', function() {
		$('.modal').fadeIn();
	});
	
	// 글 내용 더보기 기능
	$('.post-content').each(function() {

		let moreBtn = $(this).find('.more');
		
		// .post-content를 순회하면서 .context를 찾는다.
		let context = $(this).find('.context');
		// .context의 내용을 가져온다.
		let context_text = context.text();
		// .context의 요약
		let context_text_short = context_text.substring(0, 16) + "...";
		
		if (context_text.length > 16) {
			// .context의 길이가 12자를 초과할 때, 글자수를 12자로 줄이고, 더보기 버튼을 노출한다
			context.html(context_text_short);
			moreBtn.removeClass('d-none');
		} else {
			// 12자를 초과하지 않으면 더보기 버튼 숨기기
			moreBtn.addClass('d-none');
		}
		
		// 더보기 버튼 클릭하면 글 내용 전체 보이기
		moreBtn.on('click', function() {
			context.html(context_text);
			$(this).addClass('d-none');
		});
	});
	
	
	// 댓글쓰기
	$('.commentBtn').on('click', function(e) {
		e.preventDefault(); //기본기능 중단
		
		let postId = $(this).data('post-id'); // data-post-id
		let commentContent = $('#commentText' + postId).val().trim();
		// let commentContent = #(this).siblings('input').val().trim();
		
		if(commentContent == '') {
			alert("댓글 내용을 입력해주세요");
			return;
		}
		
		$.ajax({
			type: "POST"
			, url: "/comment/write"
			, data: {"postId":postId, "content": commentContent}
			, success: function(data) {
				if (data.result == 'success') {
					location.reload();
				} else {
					alert(data.errorMessage);
				}
			}
			, error: function(e) {
				alert("댓글 쓰기에 실패했습니다. 관리자에게 문의해주세요.");
			}
		});
	});
	
	
	// 포스트 좋아요
	$('.like-btn').on('click', function() {
		
		// 좋아요 버튼 클릭하면 on, off (색 바뀜)
		/* let likeImg = $(this).children('img');
		likeImg.attr('src', function(index, attr) {
			if (attr.match('off')) {
				return attr.replace('off', 'on');
			} else {
				return attr.replace('on', 'off');
			}
		}); */
		
		let postId = $(this).data('post-id');
		
		$.ajax ({
			url: "/like/" + postId
			, data: {"postId": postId}
			, success: function(data) {
				if (data.result == 'success') {
					
				} else {
					alert(data.errorMessage);
			} 
			}
			, error: function(e) {
				alert("좋아요에 문제가 있네요. 관리자에게 문의해주세요");
			}
		});
	});
	
});



</script>

