<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<section class="content d-flex justify-content-between container">
	<div class="timeline-box">
		<div class="post">
			<%-- 포스트 헤더 부분 --%>
			<div class="post-header">
				<%-- 포스트의 프로필사진과 아이디 --%>
				<div class="profile-img-box">
					<img alt="profile" src="/images/profile-img1.jpeg"
						class="profile-img">
				</div>
				<div class="d-flex justify-content-between w-100">
					<div>
					<%-- 사용자 아이디 클릭하면 프로필로 이동 --%>
						<div class="text-style-15-bold">포스팅한 사용자 아이디</div>
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
				<img alt="post-img" src="/images/post-img1.jpeg" class="image">
			</div>
			<div class="content-box">
				<%-- 좋아요, 댓글, 태그아이콘 부분 --%>
				<div class="post-icon-box">
					<div class="col-4 p-0">
						<button type="button">
							<img src="/images/like-black.png" id="post-icon-like">
						</button>
						<img src="/images/comment.png" class="post-icon">
					</div>
					<div class="col-4 p-0">
						<div class="d-flex justify-content-center">
							<%-- 이미지 개수에 따라 버튼개수 가감 --%>
							<div class="img-list-btn"></div>
						</div>
					</div>
					<div class="col-4 p-0 d-flex justify-content-end">
						<img src="/images/bookmark.png" class="post-icon">
					</div>
				</div>

				<%-- 포스트 좋아요 개수, 아이디, 글 내용, 댓글 모두보기 --%>
				<div class="post-content">
					<div class="text-style-15-bold mb-2 mt-2">좋아요 14,221개</div>
					<div class="d-flex">
						<div class="text-style-15-bold mr-2 mb-1">사용자 이름(loginId)</div>
						<div>내용</div>
						<%-- 내용이 n자 이상이면 내용을 숨기고 ... 더보기 버튼 표시 --%>
						<div class="d-flex">
							<div>...</div>
							<a type="button" id="more">더보기</a>
						</div>
					</div>
					<div>
						<%-- 댓글이 1개 이상이면 나머지 댓글을 숨기고 댓글 n개 모두보기 버튼 표시 --%>
						<a type="button" id="text-style-14-gray">댓글 n개 모두 보기</a>
					</div>
				</div>

				<%-- 댓글 입력창 --%>
				<div class="post-comment">
					<div class="d-flex align-items-center h-100">
						<img src="/images/comment.png" class="post-icon ml-3"> <input
							type="text" class="comment-input ml-3 mr-3"
							placeholder="댓글 달기...">
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="side-box">
		<div class="profile">
			<div class="profile-img-box">
				<img alt="profile" src="/images/profile-img1.jpeg"
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
