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
								<img alt="profile" src="${content.user.profileImageUrl}" class="profile-img">
							</c:when>
							<c:otherwise>
								<img alt="profile" src="/image/user.png" class="profile-img">
							</c:otherwise>
						</c:choose>
					</div>
					<div class="pr-0 ml-2 col-11 d-flex align-items-center justify-content-between">
						<div class="">
							<%-- 사용자 아이디 클릭하면 프로필로 이동 --%>
							<div>
								<div class="text-style-15-bold"><a class="userLoginId" href="/profile/${content.user.id}">${content.user.loginId}</a></div>
							</div>
						</div>	
						<div class="col-1" id="post-del-btn">
							<div>
								<div>
									<%-- 글 삭제 버튼. 클릭하면 삭제하기 모달 노출 --%>
									<c:if test="${userId eq content.user.id}">
										<button type="button" class="del-btn" data-toggle="modal" data-target=".del-modal" data-post-id="${content.post.id}">
											<i class="fa-lg fa-solid fa-ellipsis mr-1"></i>
										</button>
									</c:if>
								</div>
							</div>
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
								<c:choose>
									<c:when test="${content.existLike}">
										<img src="/image/like-on.png" class="post-like post-icon-like">
									</c:when>
									<c:otherwise>
										<img src="/image/like-off.png" class="post-like post-icon-like">
									</c:otherwise>	
								</c:choose>
							</button>
							<img src="/image/comment.png" class="post-icon">
						</div>
						<div class="col-4 p-0">
							<div class="d-flex justify-content-center">
								<div class="img-list-btn"></div>
							</div>
						</div>
						<div class="col-4 p-0">
						</div>
					</div>

					<%-- 포스트 좋아요 개수, 아이디, 글 내용, 댓글 모두보기 --%>
					<div class="post-content">
						<div class="text-style-15-bold mb-2 mt-2">좋아요 ${content.countLike}개</div>
						<div class="d-flex">
							<div class="text-style-15-bold mr-2 mb-1"><a class="userLoginId" href="profile/${content.user.id}">${content.user.loginId}</a></div>
							<div class="context">${content.post.content}</div>
							<div class="d-flex">
								<a type="button" class="more d-none" data-content-id="${content.post.id}">더보기</a>
							</div>
						</div>
						
						<%-- 댓글이 2개 이상이면 나머지 댓글을 숨기고 댓글 n개 모두보기 버튼 표시 --%>
						<%-- 댓글이 1개일 때 --%>
						<c:choose>
							<c:when test="${content.countComment eq 1}">
								<div class="d-flex justify-content-between">
									<div class="d-flex align-items-cetner">
										<div class="text-style-15-bold mr-2 mb-1">${content.commentList[0].user.loginId}</div>
										<div>${content.commentList[0].comment.content}</div>
									</div>
									<div>
										<c:if
											test="${content.commentList[0].user.loginId eq userLoginId}">
											<button type="button" class="comment-del-btn mr-2" data-post-id="${content.post.id}" data-comment-id="${content.commentList[0].comment.id}">
												<img src="/image/close.png" alt="댓글삭제" width="10">
											</button>
										</c:if>
									</div>
								</div>
							</c:when>

							<%-- 댓글이 2개 이상일 때 --%>
							<c:otherwise>
								<div class="d-flex justify-content-between">
									<div class="d-flex align-items-cetner">
										<div class="text-style-15-bold mr-2 mb-1">${content.commentList[0].user.loginId}</div>
										<div>${content.commentList[0].comment.content}</div>
									</div>
									<div>
										<c:if
											test="${content.commentList[0].user.loginId eq userLoginId}">
											<button type="button" class="comment-del-btn mr-2"
												data-post-id="${content.post.id}"
												data-comment-id="${content.commentList[0].comment.id}">
												<img src="/image/close.png" alt="댓글삭제" width="10">
											</button>
										</c:if>
									</div>
								</div>
								<div class="more-comment d-none">
								<c:forEach items="${content.commentList}" var="comment"
									begin="1">
									<div class="d-flex justify-content-between">
										<div class="d-flex align-items-cetner">
											<div class="text-style-15-bold mr-2 mb-1">${comment.user.loginId}</div>
											<div>${comment.comment.content}</div>
										</div>
										<div>
											<c:if test="${comment.user.loginId eq userLoginId}">
												<button type="button" class="comment-del-btn mr-1"
													data-post-id="${content.post.id}"
													data-comment-id="${comment.comment.id}">
													<img src="/image/close.png" alt="댓글삭제" width="10">
												</button>
											</c:if>
										</div>
									</div>
								</c:forEach>
								</div>
							</c:otherwise>
						</c:choose>
						<div>
							<c:if test="${content.countComment > 1}">
								<a type="button" id="text-style-14-gray" class="more-comment-btn"
									data-count-comment="${content.countComment}">댓글
									${content.countComment - 1}개 모두 보기</a>
							</c:if>
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
					<c:when test="${not empty user.profileImageUrl}">
						<img alt="profile" src="${user.profileImageUrl}"
							class="profile-img-side">
					</c:when>
					<c:otherwise>
						<img alt="profile" src="/image/user.png" class="profile-img-side">
					</c:otherwise>
				</c:choose>
			</div>
			<div class="d-flex justify-content-between w-100">
				<div>
					<div class="text-style-15-bold"><a class="userLoginId" href="/profile/${userId}">${user.loginId}</a></div>
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

	
	$('.post-content').each(function() {

		// 글 내용 더보기 기능
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
	
	// 댓글 삭제
	$('.comment-del-btn').on('click', function() {
		let postId = $(this).data('post-id');
		let commentId = $(this).data('comment-id');
		
		$.ajax({
			type: "DELETE"
			, url: "/comment/delete"
			, data: {"postId": postId, "commentId":commentId}
			, success: function(data) {
				if (data.result == 'success') {
					location.reload(true);
				} else {
					alert(errorMessage);
				}
			}
		});
	});
	
	// 댓글 더보기
	$('.more-comment-btn').on('click', function() {
		$('.more-comment').removeClass('d-none');
		$(this).addClass('d-none');
	});
	
	// 포스트 좋아요
	$('.like-btn').on('click', function() {
		
		let postId = $(this).data('post-id');
		
		$.ajax ({
			url: "/like/" + postId
			, data: {"postId": postId}
			, success: function(data) {
				if (data.result == 'success') {
					location.reload(true);
				} else {
					alert(data.errorMessage);
				} 
			}
			, error: function(e) {
				alert("좋아요에 문제가 있네요. 관리자에게 문의해주세요");
			}
		});
	});
	
	// 카드에서 ...버튼 클릭시 모달에 삭제될 글 번호를 넣어준다.
	$('.del-btn').on('click', function() {
		let postId = $(this).data('post-id');
		
		$('.del-modal').data('post-id', postId); // del-modal 태그에 data-post-id 삽입
	});
});



</script>

