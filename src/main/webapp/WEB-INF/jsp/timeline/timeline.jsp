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
						<img alt="profile" src="/image/profile-img1.jpeg"
							class="profile-img">
					</div>
					<div class="d-flex justify-content-between w-100">
						<div>
							<%-- 사용자 아이디 클릭하면 프로필로 이동 --%>
							<div class="text-style-15-bold">${content.userLoginId}</div>
						</div>
						<div>
							<button type="button">
								<i class="fa-lg fa-solid fa-ellipsis mr-1"></i>
							</button>
						</div>
					</div>
				</div>

				<%-- 포스팅한 이미지 --%>
				<div class="image">
					<img alt="post-img" src="${content.imagePath}" class="image">
				</div>
				<div class="content-box">
					<%-- 좋아요, 댓글, 태그아이콘 부분 --%>
					<div class="post-icon-box">
						<div class="col-4 p-0">
							<button type="button">
								<img src="/image/like-black.png" id="post-icon-like">
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
							<div class="text-style-15-bold mr-2 mb-1">${content.userLoginId}</div>
							<div>${content.content}</div>
							<%-- 내용이 n자 이상이면 내용을 숨기고 ... 더보기 버튼 표시 --%>
							<div class="d-flex">
								<div>...</div>
								<a type="button" id="more">더보기(구현 중)</a>
							</div>
						</div>
						<%-- 댓글 뿌려지는 모습을 확인하기 위해 우선 만들고 나중에 게시글보기 창 완성되면 거기에 추 --%>
						<div class="d-flex align-items-cetner">
							<div class="text-style-15-bold mr-2 mb-1">hello-world</div>
							<div>댓글내용</div>
						</div>
						<div>
							<%-- 댓글이 1개 이상이면 나머지 댓글을 숨기고 댓글 n개 모두보기 버튼 표시 --%>
							<a type="button" id="text-style-14-gray">댓글 n개 모두 보기(구현 중)</a>
						</div>
					</div>

					<%-- 댓글 입력창 --%>
					<div class="post-comment">
						<div class="d-flex align-items-center h-100">
							<img src="/image/comment.png" class="post-icon ml-3">
							<input type="text" id="commentText${content.id}" class="comment-input ml-3 mr-3" placeholder="댓글 달기...">
							<button type="button" class="commentBtn btn btn-light" data-post-id="${content.id}">게시</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="side-box">
		<div class="profile">
			<div class="profile-img-box">
				<img alt="profile" src="/image/profile-img1.jpeg"
					class="profile-img">
			</div>
			<div class="d-flex justify-content-between w-100">
				<div>
					<div class="text-style-15-bold">포스팅한 사용자 아이디</div>
				</div>
			</div>
		</div>
		<div>
			<jsp:include page="../include/footer.jsp" />
		</div>
	</div>
</section>

<script>
$(document).ready(function(e) {
	// 댓글쓰기
	$('.commentBtn').on('click', function(e) {
		e.preventDefault(); //기본기능 중단
		
		let postId = $(this).data('post-id'); // data-post-id
		let commentContent = $('#commentText' + postId).val().trim();
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
});



</script>

